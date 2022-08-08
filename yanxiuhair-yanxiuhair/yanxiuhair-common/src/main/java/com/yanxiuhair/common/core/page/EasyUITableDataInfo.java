package com.yanxiuhair.common.core.page;

import java.io.Serializable;
import java.util.List;

/**
 * @ClassName:  TableDataInfo   
 * @Description: 表格分页数据对象   
 * @author: gaoxiaochuang   
 * @date:   2020年10月19日 上午9:48:16   
 *     
 * @Copyright: 2020 http://www.yanxiuhair.com/ Inc. All rights reserved. 
 * 注意：本内容仅限于许昌妍秀发制品有限公司内部传阅，禁止外泄以及用于其他的商业目
 */
public class EasyUITableDataInfo implements Serializable {
	private static final long serialVersionUID = 1L;

	/** 总记录数 */
	private long total;

	/** 列表数据 */
	private List<?> rows;

	/** 消息状态码 */
	private int code;

	/** 消息内容 */
	private String msg;

	/**
	 * 表格数据对象
	 */
	public EasyUITableDataInfo() {
	}

	/**
	 * 分页
	 * 
	 * @param list
	 *            列表数据
	 * @param total
	 *            总记录数
	 */
	public EasyUITableDataInfo(List<?> list, int total) {
		this.rows = list;
		this.total = total;
	}

	public long getTotal() {
		return total;
	}

	public void setTotal(long total) {
		this.total = total;
	}

	public List<?> getRows() {
		return rows;
	}

	public void setRows(List<?> rows) {
		this.rows = rows;
	}

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}
}