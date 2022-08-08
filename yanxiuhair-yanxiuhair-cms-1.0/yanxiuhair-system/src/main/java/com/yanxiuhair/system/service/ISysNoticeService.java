package com.yanxiuhair.system.service;

import java.util.List;
import com.yanxiuhair.system.domain.SysNotice;

/**
 * @ClassName:  ISysNoticeService   
 * @Description: 公告 服务层
 * @author: gaoxiaochuang   
 * @date:   2021年7月1日 下午5:18:32   
 *     
 * @Copyright: 2021 http://www.yanxiuhair.com/ Inc. All rights reserved. 
 * 注意：本内容仅限于许昌妍秀发制品有限公司内部传阅，禁止外泄以及用于其他的商业目
 */
public interface ISysNoticeService {
	/**
	 * 查询公告信息
	 * 
	 * @param noticeId
	 *            公告ID
	 * @return 公告信息
	 */
	public SysNotice selectNoticeById(Long noticeId);

	/**
	 * 查询公告列表
	 * 
	 * @param notice
	 *            公告信息
	 * @return 公告集合
	 */
	public List<SysNotice> selectNoticeList(SysNotice notice);

	/**
	 * 新增公告
	 * 
	 * @param notice
	 *            公告信息
	 * @return 结果
	 */
	public int insertNotice(SysNotice notice);

	/**
	 * 修改公告
	 * 
	 * @param notice
	 *            公告信息
	 * @return 结果
	 */
	public int updateNotice(SysNotice notice);

	/**
	 * 删除公告信息
	 * 
	 * @param ids
	 *            需要删除的数据ID
	 * @return 结果
	 */
	public int deleteNoticeByIds(String ids);
}
