package com.yanxiuhair.common.core.page;

import com.yanxiuhair.common.constant.Constants;
import com.yanxiuhair.common.utils.ServletUtils;

/**
 * @ClassName:  TableSupport   
 * @Description: 表格数据处理   
 * @author: gaoxiaochuang   
 * @date:   2021年7月1日 下午2:55:24   
 *     
 * @Copyright: 2021 http://www.yanxiuhair.com/ Inc. All rights reserved. 
 * 注意：本内容仅限于许昌妍秀发制品有限公司内部传阅，禁止外泄以及用于其他的商业目
 */
public class TableSupport {
	/**
	 * 封装分页对象
	 */
	public static PageDomain getPageDomain() {
		PageDomain pageDomain = new PageDomain();
		pageDomain.setPageNum(ServletUtils.getParameterToInt(Constants.PAGE_NUM));
		pageDomain.setPageSize(ServletUtils.getParameterToInt(Constants.PAGE_SIZE));
		pageDomain.setOrderByColumn(ServletUtils.getParameter(Constants.ORDER_BY_COLUMN));
		pageDomain.setIsAsc(ServletUtils.getParameter(Constants.IS_ASC));
		return pageDomain;
	}

	public static PageDomain buildPageRequest() {
		return getPageDomain();
	}
	
	/**
	 * 封装分页对象
	 */
	public static EasyUIPageDomain getEasyUIPageDomain() {
		EasyUIPageDomain pageDomain = new EasyUIPageDomain();
		pageDomain.setPage(ServletUtils.getParameterToInt(Constants.EASYUI_PAGE));
		pageDomain.setRows(ServletUtils.getParameterToInt(Constants.EASYUI_ROWS));
		pageDomain.setOrder(ServletUtils.getParameter(Constants.EASYUI_ORDER));
		pageDomain.setSort(ServletUtils.getParameter(Constants.EASYUI_SORT));
		return pageDomain;
	}

	public static EasyUIPageDomain buildEasyUIPageRequest() {
		return getEasyUIPageDomain();
	}
}
