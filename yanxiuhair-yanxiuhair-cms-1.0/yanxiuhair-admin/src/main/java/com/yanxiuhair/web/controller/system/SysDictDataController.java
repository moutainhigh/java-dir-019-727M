package com.yanxiuhair.web.controller.system;

import java.util.List;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.yanxiuhair.common.annotation.Log;
import com.yanxiuhair.common.core.controller.BaseController;
import com.yanxiuhair.common.core.domain.AjaxResult;
import com.yanxiuhair.common.core.domain.entity.SysDictData;
import com.yanxiuhair.common.core.page.EasyUITableDataInfo;
import com.yanxiuhair.common.enums.BusinessType;
import com.yanxiuhair.common.utils.ShiroUtils;
import com.yanxiuhair.common.utils.poi.ExcelUtil;
import com.yanxiuhair.system.service.ISysDictDataService;

/**
 * @ClassName:  SysDictDataController   
 * @Description: 数据字典信息 
 * @author: gaoxiaochuang   
 * @date:   2021年7月1日 下午6:01:33   
 *     
 * @Copyright: 2021 http://www.yanxiuhair.com/ Inc. All rights reserved. 
 * 注意：本内容仅限于许昌妍秀发制品有限公司内部传阅，禁止外泄以及用于其他的商业目
 */
@Controller
@RequestMapping("/system/dict/data")
public class SysDictDataController extends BaseController {
	private String prefix = "system/dict/data";

	@Autowired
	private ISysDictDataService dictDataService;

	@RequiresPermissions("system:dict:view")
	@GetMapping()
	public String dictData() {
		return prefix + "/data";
	}

	@PostMapping("/list")
	@RequiresPermissions("system:dict:list")
	@ResponseBody
	public EasyUITableDataInfo list(SysDictData dictData) {
		easyUIStartPage();
		List<SysDictData> list = dictDataService.selectDictDataList(dictData);
		return getEasyUIDataTable(list);
	}

	@Log(title = "字典数据", businessType = BusinessType.EXPORT)
	@RequiresPermissions("system:dict:export")
	@PostMapping("/export")
	@ResponseBody
	public AjaxResult export(SysDictData dictData) {
		List<SysDictData> list = dictDataService.selectDictDataList(dictData);
		ExcelUtil<SysDictData> util = new ExcelUtil<SysDictData>(SysDictData.class);
		return util.exportExcel(list, "字典数据");
	}

	/**
	 * 新增字典类型
	 */
	@GetMapping("/add/{dictType}")
	public String add(@PathVariable("dictType") String dictType, ModelMap mmap) {
		mmap.put("dictType", dictType);
		return prefix + "/add";
	}

	/**
	 * 新增保存字典类型
	 */
	@Log(title = "字典数据", businessType = BusinessType.INSERT)
	@RequiresPermissions("system:dict:add")
	@PostMapping("/add")
	@ResponseBody
	public AjaxResult addSave(@Validated SysDictData dict) {
		dict.setCreateBy(ShiroUtils.getLoginName());
		return toAjax(dictDataService.insertDictData(dict));
	}

	/**
	 * 修改字典类型
	 */
	@GetMapping("/edit/{dictCode}")
	public String edit(@PathVariable("dictCode") Long dictCode, ModelMap mmap) {
		mmap.put("dict", dictDataService.selectDictDataById(dictCode));
		return prefix + "/edit";
	}

	/**
	 * 修改保存字典类型
	 */
	@Log(title = "字典数据", businessType = BusinessType.UPDATE)
	@RequiresPermissions("system:dict:edit")
	@PostMapping("/edit")
	@ResponseBody
	public AjaxResult editSave(@Validated SysDictData dict) {
		dict.setUpdateBy(ShiroUtils.getLoginName());
		return toAjax(dictDataService.updateDictData(dict));
	}

	@Log(title = "字典数据", businessType = BusinessType.DELETE)
	@RequiresPermissions("system:dict:remove")
	@PostMapping("/remove")
	@ResponseBody
	public AjaxResult remove(String ids) {
		dictDataService.deleteDictDataByIds(ids);
		return success();
	}
}
