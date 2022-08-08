package com.yanxiuhair.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.yanxiuhair.common.core.text.Convert;
import com.yanxiuhair.system.domain.SysOperLog;
import com.yanxiuhair.system.mapper.SysOperLogMapper;
import com.yanxiuhair.system.service.ISysOperLogService;

/**
 * @ClassName:  SysOperLogServiceImpl   
 * @Description: 操作日志 服务层处理   
 * @author: gaoxiaochuang   
 * @date:   2021年7月1日 下午5:21:46   
 *     
 * @Copyright: 2021 http://www.yanxiuhair.com/ Inc. All rights reserved. 
 * 注意：本内容仅限于许昌妍秀发制品有限公司内部传阅，禁止外泄以及用于其他的商业目
 */
@Service
public class SysOperLogServiceImpl implements ISysOperLogService {
	@Autowired
	private SysOperLogMapper operLogMapper;

	/**
	 * 新增操作日志
	 * 
	 * @param operLog
	 *            操作日志对象
	 */
	@Override
	public void insertOperlog(SysOperLog operLog) {
		operLogMapper.insertOperlog(operLog);
	}

	/**
	 * 查询系统操作日志集合
	 * 
	 * @param operLog
	 *            操作日志对象
	 * @return 操作日志集合
	 */
	@Override
	public List<SysOperLog> selectOperLogList(SysOperLog operLog) {
		return operLogMapper.selectOperLogList(operLog);
	}

	/**
	 * 批量删除系统操作日志
	 * 
	 * @param ids
	 *            需要删除的数据
	 * @return
	 */
	@Override
	public int deleteOperLogByIds(String ids) {
		return operLogMapper.deleteOperLogByIds(Convert.toStrArray(ids));
	}

	/**
	 * 查询操作日志详细
	 * 
	 * @param operId
	 *            操作ID
	 * @return 操作日志对象
	 */
	@Override
	public SysOperLog selectOperLogById(Long operId) {
		return operLogMapper.selectOperLogById(operId);
	}

	/**
	 * 清空操作日志
	 */
	@Override
	public void cleanOperLog() {
		operLogMapper.cleanOperLog();
	}
}
