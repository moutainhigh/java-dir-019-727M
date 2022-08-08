package com.yanxiuhair.framework.web.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.yanxiuhair.common.core.domain.entity.SysDictData;
import com.yanxiuhair.system.service.ISysDictDataService;
import com.yanxiuhair.system.service.ISysDictTypeService;

/**
 * @ClassName:  DictService   
 * @Description: 首创 html调用 thymeleaf 实现字典读取
 * @author: gaoxiaochuang   
 * @date:   2021年7月1日 下午4:48:46   
 *     
 * @Copyright: 2021 http://www.yanxiuhair.com/ Inc. All rights reserved. 
 * 注意：本内容仅限于许昌妍秀发制品有限公司内部传阅，禁止外泄以及用于其他的商业目
 */
@Service("dict")
public class DictService {
	@Autowired
	private ISysDictTypeService dictTypeService;

	@Autowired
	private ISysDictDataService dictDataService;

	/**
	 * 根据字典类型查询字典数据信息
	 * 
	 * @param dictType
	 *            字典类型
	 * @return 参数键值
	 */
	public List<SysDictData> getType(String dictType) {
		return dictTypeService.selectDictDataByType(dictType);
	}

	/**
	 * 根据字典类型和字典键值查询字典数据信息
	 * 
	 * @param dictType
	 *            字典类型
	 * @param dictValue
	 *            字典键值
	 * @return 字典标签
	 */
	public String getLabel(String dictType, String dictValue) {
		return dictDataService.selectDictLabel(dictType, dictValue);
	}
}
