package com.yanxiuhair.web.controller.demo.domain;

import java.util.Date;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

/**
 * @ClassName:  GoodsModel   
 * @Description: 商品测试信息
 * @author: gaoxiaochuang   
 * @date:   2021年7月1日 下午5:58:11   
 *     
 * @Copyright: 2021 http://www.yanxiuhair.com/ Inc. All rights reserved. 
 * 注意：本内容仅限于许昌妍秀发制品有限公司内部传阅，禁止外泄以及用于其他的商业目
 */
public class GoodsModel {
	/**
	 * 商品名称
	 */
	private String name;

	/**
	 * 商品重量
	 */
	private Integer weight;

	/**
	 * 商品价格
	 */
	private Double price;

	/**
	 * 商品日期
	 */
	private Date date;

	/**
	 * 商品种类
	 */
	private String type;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getWeight() {
		return weight;
	}

	public void setWeight(Integer weight) {
		this.weight = weight;
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	@Override
	public String toString() {
		return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE).append("name", getName())
				.append("weight", getWeight()).append("price", getPrice()).append("date", getDate())
				.append("type", getType()).toString();
	}
}
