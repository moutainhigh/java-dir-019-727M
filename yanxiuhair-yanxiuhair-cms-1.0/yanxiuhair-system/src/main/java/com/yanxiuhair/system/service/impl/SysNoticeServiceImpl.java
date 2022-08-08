package com.yanxiuhair.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.yanxiuhair.common.core.text.Convert;
import com.yanxiuhair.system.domain.SysNotice;
import com.yanxiuhair.system.mapper.SysNoticeMapper;
import com.yanxiuhair.system.service.ISysNoticeService;

/**
 * @ClassName:  SysNoticeServiceImpl   
 * @Description: 公告 服务层实现
 * @author: gaoxiaochuang   
 * @date:   2021年7月1日 下午5:21:32   
 *     
 * @Copyright: 2021 http://www.yanxiuhair.com/ Inc. All rights reserved. 
 * 注意：本内容仅限于许昌妍秀发制品有限公司内部传阅，禁止外泄以及用于其他的商业目
 */
@Service
public class SysNoticeServiceImpl implements ISysNoticeService {
	@Autowired
	private SysNoticeMapper noticeMapper;

	/**
	 * 查询公告信息
	 * 
	 * @param noticeId
	 *            公告ID
	 * @return 公告信息
	 */
	@Override
	public SysNotice selectNoticeById(Long noticeId) {
		return noticeMapper.selectNoticeById(noticeId);
	}

	/**
	 * 查询公告列表
	 * 
	 * @param notice
	 *            公告信息
	 * @return 公告集合
	 */
	@Override
	public List<SysNotice> selectNoticeList(SysNotice notice) {
		return noticeMapper.selectNoticeList(notice);
	}

	/**
	 * 新增公告
	 * 
	 * @param notice
	 *            公告信息
	 * @return 结果
	 */
	@Override
	public int insertNotice(SysNotice notice) {
		return noticeMapper.insertNotice(notice);
	}

	/**
	 * 修改公告
	 * 
	 * @param notice
	 *            公告信息
	 * @return 结果
	 */
	@Override
	public int updateNotice(SysNotice notice) {
		return noticeMapper.updateNotice(notice);
	}

	/**
	 * 删除公告对象
	 * 
	 * @param ids
	 *            需要删除的数据ID
	 * @return 结果
	 */
	@Override
	public int deleteNoticeByIds(String ids) {
		return noticeMapper.deleteNoticeByIds(Convert.toStrArray(ids));
	}
}
