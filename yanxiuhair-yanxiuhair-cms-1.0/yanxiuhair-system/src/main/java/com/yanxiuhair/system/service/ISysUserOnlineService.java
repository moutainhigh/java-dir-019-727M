package com.yanxiuhair.system.service;

import java.util.Date;
import java.util.List;
import com.yanxiuhair.system.domain.SysUserOnline;

/**
 * @ClassName:  ISysUserOnlineService   
 * @Description: 在线用户 服务层
 * @author: gaoxiaochuang   
 * @date:   2021年7月1日 下午5:19:38   
 *     
 * @Copyright: 2021 http://www.yanxiuhair.com/ Inc. All rights reserved. 
 * 注意：本内容仅限于许昌妍秀发制品有限公司内部传阅，禁止外泄以及用于其他的商业目
 */
public interface ISysUserOnlineService {
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
	public void deleteOnlineById(String sessionId);

	/**
	 * 通过会话序号删除信息
	 * 
	 * @param sessions
	 *            会话ID集合
	 * @return 在线用户信息
	 */
	public void batchDeleteOnline(List<String> sessions);

	/**
	 * 保存会话信息
	 * 
	 * @param online
	 *            会话信息
	 */
	public void saveOnline(SysUserOnline online);

	/**
	 * 查询会话集合
	 * 
	 * @param userOnline
	 *            分页参数
	 * @return 会话集合
	 */
	public List<SysUserOnline> selectUserOnlineList(SysUserOnline userOnline);

	/**
	 * 强退用户
	 * 
	 * @param sessionId
	 *            会话ID
	 */
	public void forceLogout(String sessionId);

	/**
	 * 清理用户缓存
	 * 
	 * @param loginName
	 *            登录名称
	 * @param sessionId
	 *            会话ID
	 */
	public void removeUserCache(String loginName, String sessionId);

	/**
	 * 查询会话集合
	 * 
	 * @param expiredDate
	 *            有效期
	 * @return 会话集合
	 */
	public List<SysUserOnline> selectOnlineByExpired(Date expiredDate);
}
