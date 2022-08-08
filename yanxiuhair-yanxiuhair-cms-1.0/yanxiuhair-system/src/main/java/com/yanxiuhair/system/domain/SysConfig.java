package com.yanxiuhair.system.domain;

import javax.validation.constraints.*;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.yanxiuhair.common.annotation.Excel;
import com.yanxiuhair.common.annotation.Excel.ColumnType;
import com.yanxiuhair.common.core.domain.BaseEntity;

/**
 * @ClassName:  SysConfig   
 * @Description: 参数配置表 sys_config  
 * @author: gaoxiaochuang   
 * @date:   2021年7月1日 下午5:05:48   
 *     
 * @Copyright: 2021 http://www.yanxiuhair.com/ Inc. All rights reserved. 
 * 注意：本内容仅限于许昌妍秀发制品有限公司内部传阅，禁止外泄以及用于其他的商业目
 */
public class SysConfig extends BaseEntity {
	private static final long serialVersionUID = 1L;

	/** 参数主键 */
	@Excel(name = "参数主键", cellType = ColumnType.NUMERIC)
	private Long configId;

	/** 参数名称 */
	@Excel(name = "参数名称")
	private String configName;

	/** 参数键名 */
	@Excel(name = "参数键名")
	private String configKey;

	/** 参数键值 */
	@Excel(name = "参数键值")
	private String configValue;

	/** 系统内置（Y是 N否） */
	@Excel(name = "系统内置", readConverterExp = "Y=是,N=否")
	private String configType;

	public Long getConfigId() {
		return configId;
	}

	public void setConfigId(Long configId) {
		this.configId = configId;
	}

	@NotBlank(message = "参数名称不能为空")
	@Size(min = 0, max = 100, message = "参数名称不能超过100个字符")
	public String getConfigName() {
		return configName;
	}

	public void setConfigName(String configName) {
		this.configName = configName;
	}

	@NotBlank(message = "参数键名长度不能为空")
	@Size(min = 0, max = 100, message = "参数键名长度不能超过100个字符")
	public String getConfigKey() {
		return configKey;
	}

	public void setConfigKey(String configKey) {
		this.configKey = configKey;
	}

	@NotBlank(message = "参数键值不能为空")
	@Size(min = 0, max = 500, message = "参数键值长度不能超过500个字符")
	public String getConfigValue() {
		return configValue;
	}

	public void setConfigValue(String configValue) {
		this.configValue = configValue;
	}

	public String getConfigType() {
		return configType;
	}

	public void setConfigType(String configType) {
		this.configType = configType;
	}

	@Override
	public String toString() {
		return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE).append("configId", getConfigId())
				.append("configName", getConfigName()).append("configKey", getConfigKey())
				.append("configValue", getConfigValue()).append("configType", getConfigType())
				.append("createBy", getCreateBy()).append("createTime", getCreateTime())
				.append("updateBy", getUpdateBy()).append("updateTime", getUpdateTime()).append("remark", getRemark())
				.toString();
	}
}
