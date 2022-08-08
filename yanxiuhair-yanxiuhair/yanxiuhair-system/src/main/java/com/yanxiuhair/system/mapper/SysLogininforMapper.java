package com.yanxiuhair.system.mapper;

import java.util.List;
import com.yanxiuhair.system.domain.SysLogininfor;

/**
 * @ClassName:  SysLogininforMapper   
 * @Description: 系统访问日志情况信息 数据层
 * @author: gaoxiaochuang   
 * @date:   2021年7月1日 下午5:14:46   
 *     
 * @Copyright: 2021 http://www.yanxiuhair.com/ Inc. All rights reserved. 
 * 注意：本内容仅限于许昌妍秀发制品有限公司内部传阅，禁止外泄以及用于其他的商业目
 */
public interface SysLogininforMapper {
	/**
	 * 新增系统登录日志
	 * 
	 * @param logininfor
	 *            访问日志对象
	 */
	public void insertLogininfor(SysLogininfor logininfor);

	/**
	 * 查询系统登录日志集合
	 * 
	 * @param logininfor
	 *            访问日志对象
	 * @return 登录记录集合
	 */
	public List<SysLogininfor> selectLogininforList(SysLogininfor logininfor);

	/**
	 * 批量删除系统登录日志
	 * 
	 * @param ids
	 *            需要删除的数据
	 * @return 结果
	 */
	public int deleteLogininforByIds(String[] ids);

	/**
	 * 清空系统登录日志
	 * 
	 * @return 结果
	 */
	public int cleanLogininfor();
}
