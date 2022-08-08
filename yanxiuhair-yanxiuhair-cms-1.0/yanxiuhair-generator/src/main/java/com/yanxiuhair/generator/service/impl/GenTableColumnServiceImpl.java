package com.yanxiuhair.generator.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.yanxiuhair.common.core.text.Convert;
import com.yanxiuhair.generator.domain.GenTableColumn;
import com.yanxiuhair.generator.mapper.GenTableColumnMapper;
import com.yanxiuhair.generator.service.IGenTableColumnService;

/**
 * @ClassName:  GenTableColumnServiceImpl   
 * @Description: 业务字段 服务层实现   
 * @author: gaoxiaochuang   
 * @date:   2021年7月1日 下午4:54:51   
 *     
 * @Copyright: 2021 http://www.yanxiuhair.com/ Inc. All rights reserved. 
 * 注意：本内容仅限于许昌妍秀发制品有限公司内部传阅，禁止外泄以及用于其他的商业目
 */
@Service
public class GenTableColumnServiceImpl implements IGenTableColumnService {
	@Autowired
	private GenTableColumnMapper genTableColumnMapper;

	/**
	 * 查询业务字段列表
	 * 
	 * @param genTableColumn
	 *            业务字段信息
	 * @return 业务字段集合
	 */
	@Override
	public List<GenTableColumn> selectGenTableColumnListByTableId(GenTableColumn genTableColumn) {
		return genTableColumnMapper.selectGenTableColumnListByTableId(genTableColumn);
	}

	/**
	 * 新增业务字段
	 * 
	 * @param genTableColumn
	 *            业务字段信息
	 * @return 结果
	 */
	@Override
	public int insertGenTableColumn(GenTableColumn genTableColumn) {
		return genTableColumnMapper.insertGenTableColumn(genTableColumn);
	}

	/**
	 * 修改业务字段
	 * 
	 * @param genTableColumn
	 *            业务字段信息
	 * @return 结果
	 */
	@Override
	public int updateGenTableColumn(GenTableColumn genTableColumn) {
		return genTableColumnMapper.updateGenTableColumn(genTableColumn);
	}

	/**
	 * 删除业务字段对象
	 * 
	 * @param ids
	 *            需要删除的数据ID
	 * @return 结果
	 */
	@Override
	public int deleteGenTableColumnByIds(String ids) {
		return genTableColumnMapper.deleteGenTableColumnByIds(Convert.toLongArray(ids));
	}
}