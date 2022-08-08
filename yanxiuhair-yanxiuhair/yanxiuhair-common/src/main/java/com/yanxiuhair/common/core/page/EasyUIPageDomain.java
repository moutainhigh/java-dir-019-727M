package com.yanxiuhair.common.core.page;

import com.yanxiuhair.common.utils.StringUtils;

/**
 * @ClassName:  EasyUIPageDomainPageDomain   
 * @Description: EasyUI分页数据 
 * @author: gaoxiaochuang   
 * @date:   2020年10月19日 上午9:47:57   
 *     
 * @Copyright: 2020 http://www.yanxiuhair.com/ Inc. All rights reserved. 
 * 注意：本内容仅限于许昌妍秀发制品有限公司内部传阅，禁止外泄以及用于其他的商业目
 */
public class EasyUIPageDomain {
	/** 当前记录起始索引 */
	private Integer page;

	/** 每页显示记录数 */
	private Integer rows;

	/** 排序列 */
	private String sort;

	/** 排序的方向desc或者asc */
	private String order = "asc";

	public String getOrderBy() {
		if (StringUtils.isEmpty(sort)) {
			return "";
		}
		return StringUtils.toUnderScoreCase(sort) + " " + order;
	}

	public Integer getPage() {
		return page;
	}

	public void setPage(Integer page) {
		this.page = page;
	}

	public Integer getRows() {
		return rows;
	}

	public void setRows(Integer rows) {
		this.rows = rows;
	}

	public String getOrder() {
		return order;
	}

	public void setOrder(String order) {
		this.order = order;
	}

	public String getSort() {
		return sort;
	}

	public void setSort(String sort) {
		this.sort = sort;
	}

}
