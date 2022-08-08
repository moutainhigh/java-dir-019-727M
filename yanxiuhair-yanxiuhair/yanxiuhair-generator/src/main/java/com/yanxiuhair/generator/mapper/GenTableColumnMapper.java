package com.yanxiuhair.generator.mapper;

import java.util.List;
import com.yanxiuhair.generator.domain.GenTableColumn;

/**
 * @ClassName:  GenTableColumnMapper   
 * @Description: 业务字段 数据层
 * @author: gaoxiaochuang   
 * @date:   2021年7月1日 下午4:54:22   
 *     
 * @Copyright: 2021 http://www.yanxiuhair.com/ Inc. All rights reserved. 
 * 注意：本内容仅限于许昌妍秀发制品有限公司内部传阅，禁止外泄以及用于其他的商业目
 */
public interface GenTableColumnMapper {
	/**
	 * 根据表名称查询列信息
	 * 
	 * @param tableName
	 *            表名称
	 * @return 列信息
	 */
	public List<GenTableColumn> selectDbTableColumnsByName(String tableName);

	/**
	 * 查询业务字段列表
	 * 
	 * @param genTableColumn
	 *            业务字段信息
	 * @return 业务字段集合
	 */
	public List<GenTableColumn> selectGenTableColumnListByTableId(GenTableColumn genTableColumn);

	/**
	 * 新增业务字段
	 * 
	 * @param genTableColumn
	 *            业务字段信息
	 * @return 结果
	 */
	public int insertGenTableColumn(GenTableColumn genTableColumn);

	/**
	 * 修改业务字段
	 * 
	 * @param genTableColumn
	 *            业务字段信息
	 * @return 结果
	 */
	public int updateGenTableColumn(GenTableColumn genTableColumn);

	/**
	 * 删除业务字段
	 * 
	 * @param genTableColumns
	 *            列数据
	 * @return 结果
	 */
	public int deleteGenTableColumns(List<GenTableColumn> genTableColumns);

	/**
	 * 批量删除业务字段
	 * 
	 * @param ids
	 *            需要删除的数据ID
	 * @return 结果
	 */
	public int deleteGenTableColumnByIds(Long[] ids);
}
