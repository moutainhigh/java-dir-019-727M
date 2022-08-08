package com.yanxiuhair.system.mapper;

import java.util.List;
import com.yanxiuhair.system.domain.SysConfig;

/**
 * @ClassName:  SysConfigMapper   
 * @Description: 参数配置 数据层
 * @author: gaoxiaochuang   
 * @date:   2021年7月1日 下午5:13:54   
 *     
 * @Copyright: 2021 http://www.yanxiuhair.com/ Inc. All rights reserved. 
 * 注意：本内容仅限于许昌妍秀发制品有限公司内部传阅，禁止外泄以及用于其他的商业目
 */
public interface SysConfigMapper {
	/**
	 * 查询参数配置信息
	 * 
	 * @param config
	 *            参数配置信息
	 * @return 参数配置信息
	 */
	public SysConfig selectConfig(SysConfig config);

	/**
	 * 查询参数配置列表
	 * 
	 * @param config
	 *            参数配置信息
	 * @return 参数配置集合
	 */
	public List<SysConfig> selectConfigList(SysConfig config);

	/**
	 * 根据键名查询参数配置信息
	 * 
	 * @param configKey
	 *            参数键名
	 * @return 参数配置信息
	 */
	public SysConfig checkConfigKeyUnique(String configKey);

	/**
	 * 新增参数配置
	 * 
	 * @param config
	 *            参数配置信息
	 * @return 结果
	 */
	public int insertConfig(SysConfig config);

	/**
	 * 修改参数配置
	 * 
	 * @param config
	 *            参数配置信息
	 * @return 结果
	 */
	public int updateConfig(SysConfig config);

	/**
	 * 删除参数配置
	 * 
	 * @param configId
	 *            参数主键
	 * @return 结果
	 */
	public int deleteConfigById(Long configId);

	/**
	 * 批量删除参数配置
	 * 
	 * @param configIds
	 *            需要删除的数据ID
	 * @return 结果
	 */
	public int deleteConfigByIds(String[] configIds);
}