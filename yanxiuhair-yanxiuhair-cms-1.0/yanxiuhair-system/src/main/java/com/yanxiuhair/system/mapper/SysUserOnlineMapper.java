package com.yanxiuhair.system.mapper;

import java.util.List;
import com.yanxiuhair.system.domain.SysUserOnline;

/**
 * @ClassName:  SysUserOnlineMapper   
 * @Description: 在线用户 数据层  
 * @author: gaoxiaochuang   
 * @date:   2021年7月1日 下午5:16:47   
 *     
 * @Copyright: 2021 http://www.yanxiuhair.com/ Inc. All rights reserved. 
 * 注意：本内容仅限于许昌妍秀发制品有限公司内部传阅，禁止外泄以及用于其他的商业目
 */
public interface SysUserOnlineMapper {
	/**
	 * 通过会话序号查询信息
	 * 
	 * @param sessionId
	 *            会话ID
	 * @return 在线用户信息
	 */
	public SysUserOnline selectOnlineById(String sessionId);

	/**
	 * 通过会话序号删除信息
	 * 
	 * @param sessionId
	 *            会话ID
	 * @return 在线用户信息
	 */
	public int deleteOnlineById(String sessionId);

	/**
	 * 保存会话信息
	 * 
	 * @param online
	 *            会话信息
	 * @return 结果
	 */
	public int saveOnline(SysUserOnline online);

	/**
	 * 查询会话集合
	 * 
	 * @param userOnline
	 *            会话参数
	 * @return 会话集合
	 */
	public List<SysUserOnline> selectUserOnlineList(SysUserOnline userOnline);

	/**
	 * 查询过期会话集合
	 * 
	 * @param lastAccessTime
	 *            过期时间
	 * @return 会话集合
	 */
	public List<SysUserOnline> selectOnlineByExpired(String lastAccessTime);
}
