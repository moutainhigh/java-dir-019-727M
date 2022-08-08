package com.yanxiuhair.common.core.domain;

import java.io.Serializable;
import java.util.List;

/**
 * @ClassName:  CxSelect   
 * @Description: CxSelect树结构实体类  
 * @author: gaoxiaochuang   
 * @date:   2021年7月1日 下午2:52:52   
 *     
 * @Copyright: 2021 http://www.yanxiuhair.com/ Inc. All rights reserved. 
 * 注意：本内容仅限于许昌妍秀发制品有限公司内部传阅，禁止外泄以及用于其他的商业目
 */
public class CxSelect implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * 数据值字段名称
	 */
	private String v;

	/**
	 * 数据标题字段名称
	 */
	private String n;

	/**
	 * 子集数据字段名称
	 */
	private List<CxSelect> s;

	public CxSelect() {
	}

	public CxSelect(String v, String n) {
		this.v = v;
		this.n = n;
	}

	public List<CxSelect> getS() {
		return s;
	}

	public void setN(String n) {
		this.n = n;
	}

	public String getN() {
		return n;
	}

	public void setS(List<CxSelect> s) {
		this.s = s;
	}

	public String getV() {
		return v;
	}

	public void setV(String v) {
		this.v = v;
	}
}
