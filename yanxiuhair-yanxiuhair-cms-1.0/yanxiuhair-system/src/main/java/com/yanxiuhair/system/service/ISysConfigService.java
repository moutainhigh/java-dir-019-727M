package com.yanxiuhair.system.service;

import java.util.List;
import com.yanxiuhair.system.domain.SysConfig;

/**
 * @ClassName:  ISysConfigService   
 * @Description: 参数配置 服务层  
 * @author: gaoxiaochuang   
 * @date:   2021年7月1日 下午5:17:30   
 *     
 * @Copyright: 2021 http://www.yanxiuhair.com/ Inc. All rights reserved. 
 * 注意：本内容仅限于许昌妍秀发制品有限公司内部传阅，禁止外泄以及用于其他的商业目
 */
public interface ISysConfigService {
	/**
	 * 查询参数配置信息
	 * 
	 * @param configId
	 *            参数配置ID
	 * @return 参数配置信息
	 */
	public SysConfig selectConfigById(Long configId);

	/**
	 * 根据键名查询参数配置信息
	 * 
	 * @param configKey
	 *            参数键名
	 * @return 参数键值
	 */
	public String selectConfigByKey(String configKey);
	public String selectSysCodeConfigByKey(String configKey);

	/**
	 * 查询参数配置列表
	 * 
	 * @param config
	 *            参数配置信息
	 * @return 参数配置集合
	 */
	public List<SysConfig> selectConfigList(SysConfig config);

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
	 * 批量删除参数配置信息
	 * 
	 * @param ids
	 *            需要删除的数据ID
	 * @return 结果
	 */
	public void deleteConfigByIds(String ids);

	/**
	 * 加载参数缓存数据
	 */
	public void loadingConfigCache();

	/**
	 * 清空参数缓存数据
	 */
	public void clearConfigCache();

	/**
	 * 重置参数缓存数据
	 */
	public void resetConfigCache();

	/**
	 * 校验参数键名是否唯一
	 * 
	 * @param config
	 *            参数信息
	 * @return 结果
	 */
	public String checkConfigKeyUnique(SysConfig config);
}
