package com.yanxiuhair.common.enums;

/**
 * @ClassName:  BusinessType   
 * @Description: 业务操作类型
 * @author: gaoxiaochuang   
 * @date:   2021年7月1日 下午3:05:59   
 *     
 * @Copyright: 2021 http://www.yanxiuhair.com/ Inc. All rights reserved. 
 * 注意：本内容仅限于许昌妍秀发制品有限公司内部传阅，禁止外泄以及用于其他的商业目
 */
public enum BusinessType {
	/**
	 * 其它
	 */
	OTHER,

	/**
	 * 新增
	 */
	INSERT,

	/**
	 * 修改
	 */
	UPDATE,

	/**
	 * 删除
	 */
	DELETE,

	/**
	 * 授权
	 */
	GRANT,

	/**
	 * 导出
	 */
	EXPORT,

	/**
	 * 导入
	 */
	IMPORT,

	/**
	 * 强退
	 */
	FORCE,

	/**
	 * 生成代码
	 */
	GENCODE,

	/**
	 * 清空
	 */
	CLEAN,
}
