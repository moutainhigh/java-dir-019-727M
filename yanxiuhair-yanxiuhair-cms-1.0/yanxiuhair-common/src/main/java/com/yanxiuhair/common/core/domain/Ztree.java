package com.yanxiuhair.common.core.domain;

import java.io.Serializable;

/**
 * @ClassName:  Ztree   
 * @Description: Ztree树结构实体类  
 * @author: gaoxiaochuang   
 * @date:   2021年7月1日 下午2:54:04   
 *     
 * @Copyright: 2021 http://www.yanxiuhair.com/ Inc. All rights reserved. 
 * 注意：本内容仅限于许昌妍秀发制品有限公司内部传阅，禁止外泄以及用于其他的商业目
 */
public class Ztree implements Serializable {
	private static final long serialVersionUID = 1L;

	/** 节点ID */
	private Long id;

	/** 节点父ID */
	private Long pId;

	/** 节点名称 */
	private String name;

	/** 节点标题 */
	private String title;

	/** 是否勾选 */
	private boolean checked = false;

	/** 是否展开 */
	private boolean open = false;

	/** 是否能勾选 */
	private boolean nocheck = false;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getpId() {
		return pId;
	}

	public void setpId(Long pId) {
		this.pId = pId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public boolean isChecked() {
		return checked;
	}

	public void setChecked(boolean checked) {
		this.checked = checked;
	}

	public boolean isOpen() {
		return open;
	}

	public void setOpen(boolean open) {
		this.open = open;
	}

	public boolean isNocheck() {
		return nocheck;
	}

	public void setNocheck(boolean nocheck) {
		this.nocheck = nocheck;
	}
}
