package com.yanxiuhair.common.core.controller;

import java.beans.PropertyEditorSupport;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.yanxiuhair.common.core.domain.AjaxResult;
import com.yanxiuhair.common.core.domain.AjaxResult.Type;
import com.yanxiuhair.common.core.page.EasyUIPageDomain;
import com.yanxiuhair.common.core.page.EasyUITableDataInfo;
import com.yanxiuhair.common.core.page.PageDomain;
import com.yanxiuhair.common.core.page.TableDataInfo;
import com.yanxiuhair.common.core.page.TableSupport;
import com.yanxiuhair.common.utils.DateUtils;
import com.yanxiuhair.common.utils.ServletUtils;
import com.yanxiuhair.common.utils.StringUtils;
import com.yanxiuhair.common.utils.sql.SqlUtil;

/**
 * @ClassName:  BaseController   
 * @Description: web层通用数据处理  
 * @author: gaoxiaochuang   
 * @date:   2021年7月1日 下午2:41:15   
 *     
 * @Copyright: 2021 http://www.yanxiuhair.com/ Inc. All rights reserved. 
 * 注意：本内容仅限于许昌妍秀发制品有限公司内部传阅，禁止外泄以及用于其他的商业目
 */
public class BaseController {
	protected final Logger logger = LoggerFactory.getLogger(this.getClass());

	/**
	 * 将前台传递过来的日期格式的字符串，自动转化为Date类型
	 */
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		// Date 类型转换
		binder.registerCustomEditor(Date.class, new PropertyEditorSupport() {
			@Override
			public void setAsText(String text) {
				setValue(DateUtils.parseDate(text));
			}
		});
	}

	/**
	 * 设置请求分页数据
	 */
	protected void startPage() {
		PageDomain pageDomain = TableSupport.buildPageRequest();
		Integer pageNum = pageDomain.getPageNum();
		Integer pageSize = pageDomain.getPageSize();
		if (StringUtils.isNotNull(pageNum) && StringUtils.isNotNull(pageSize)) {
			String orderBy = SqlUtil.escapeOrderBySql(pageDomain.getOrderBy());
			PageHelper.startPage(pageNum, pageSize, orderBy);
		}
	}
	
	/**
	 * 设置请求分页数据
	 */
	protected void easyUIStartPage() {
		EasyUIPageDomain pageDomain = TableSupport.buildEasyUIPageRequest();
		Integer page = pageDomain.getPage();
		Integer rows = pageDomain.getRows();
		if (StringUtils.isNotNull(page) && StringUtils.isNotNull(rows)) {
			String orderBy = SqlUtil.escapeOrderBySql(pageDomain.getOrderBy());
			PageHelper.startPage(page, rows, orderBy);
		}
	}

	/**
	 * 设置请求排序数据
	 */
	protected void startOrderBy() {
		PageDomain pageDomain = TableSupport.buildPageRequest();
		if (StringUtils.isNotEmpty(pageDomain.getOrderBy())) {
			String orderBy = SqlUtil.escapeOrderBySql(pageDomain.getOrderBy());
			PageHelper.orderBy(orderBy);
		}
	}

	/**
	 * 获取request
	 */
	public HttpServletRequest getRequest() {
		return ServletUtils.getRequest();
	}

	/**
	 * 获取response
	 */
	public HttpServletResponse getResponse() {
		return ServletUtils.getResponse();
	}

	/**
	 * 获取session
	 */
	public HttpSession getSession() {
		return getRequest().getSession();
	}

	/**
	 * 响应请求分页数据
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	protected TableDataInfo getDataTable(List<?> list) {
		TableDataInfo rspData = new TableDataInfo();
		rspData.setCode(0);
		rspData.setRows(list);
		rspData.setTotal(new PageInfo(list).getTotal());
		return rspData;
	}

	/**
	 * 响应请求分页数据
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	protected EasyUITableDataInfo getEasyUIDataTable(List<?> list) {
		EasyUITableDataInfo rspData = new EasyUITableDataInfo();
		rspData.setCode(0);
		rspData.setRows(list);
		rspData.setTotal(new PageInfo(list).getTotal());
		return rspData;
	}
	
	/**
	 * 响应返回结果
	 * 
	 * @param rows
	 *            影响行数
	 * @return 操作结果
	 */
	protected AjaxResult toAjax(int rows) {
		return rows > 0 ? success() : error();
	}

	/**
	 * 响应返回结果
	 * 
	 * @param result
	 *            结果
	 * @return 操作结果
	 */
	protected AjaxResult toAjax(boolean result) {
		return result ? success() : error();
	}

	/**
	 * 返回成功
	 */
	public AjaxResult success() {
		return AjaxResult.success();
	}

	/**
	 * 返回成功消息
	 */
	public AjaxResult success(String message) {
		return AjaxResult.success(message);
	}

	/**
	 * 返回成功
	 */
	public AjaxResult success(Object data) {
		return AjaxResult.success(data);
	}
	
	/**
	 * 返回成功
	 */
	public AjaxResult success(String msg, Object data) {
		return AjaxResult.success(msg, data);
	}
	
	/**
	 * 返回失败消息
	 */
	public AjaxResult error() {
		return AjaxResult.error();
	}

	/**
	 * 返回失败消息
	 */
	public AjaxResult error(String message) {
		return AjaxResult.error(message);
	}

	/**
	 * 返回失败消息
	 */
	public AjaxResult error(String message, Object data) {
		return AjaxResult.error(message, data);
	}
	
	/**
	 * 返回错误码消息
	 */
	public AjaxResult error(Type type, String message) {
		return new AjaxResult(type, message);
	}

	/**
	 * 页面跳转
	 */
	public String redirect(String url) {
		return StringUtils.format("redirect:{}", url);
	}
}
