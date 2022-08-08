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
import com.yanxiuhair.common.constant.UserConstants;
import com.yanxiuhair.common.core.controller.BaseController;
import com.yanxiuhair.common.core.domain.AjaxResult;
import com.yanxiuhair.common.core.domain.Ztree;
import com.yanxiuhair.common.core.domain.entity.SysDictType;
import com.yanxiuhair.common.core.page.EasyUITableDataInfo;
import com.yanxiuhair.common.enums.BusinessType;
import com.yanxiuhair.common.utils.ShiroUtils;
import com.yanxiuhair.common.utils.poi.ExcelUtil;
import com.yanxiuhair.system.service.ISysDictTypeService;

/**
 * @ClassName:  SysDictTypeController   
 * @Description: 数据字典信息  
 * @author: gaoxiaochuang   
 * @date:   2021年7月1日 下午6:01:47   
 *     
 * @Copyright: 2021 http://www.yanxiuhair.com/ Inc. All rights reserved. 
 * 注意：本内容仅限于许昌妍秀发制品有限公司内部传阅，禁止外泄以及用于其他的商业目
 */
@Controller
@RequestMapping("/system/dict")
public class SysDictTypeController extends BaseController {
	private String prefix = "system/dict/type";

	@Autowired
	private ISysDictTypeService dictTypeService;

	@RequiresPermissions("system:dict:view")
	@GetMapping()
	public String dictType() {
		return prefix + "/type";
	}

	@PostMapping("/list")
	@RequiresPermissions("system:dict:list")
	@ResponseBody
	public EasyUITableDataInfo list(SysDictType dictType) {
		easyUIStartPage();
		List<SysDictType> list = dictTypeService.selectDictTypeList(dictType);
		return getEasyUIDataTable(list);
	}

	@Log(title = "字典类型", businessType = BusinessType.EXPORT)
	@RequiresPermissions("system:dict:export")
	@PostMapping("/export")
	@ResponseBody
	public AjaxResult export(SysDictType dictType) {

		List<SysDictType> list = dictTypeService.selectDictTypeList(dictType);
		ExcelUtil<SysDictType> util = new ExcelUtil<SysDictType>(SysDictType.class);
		return util.exportExcel(list, "字典类型");
	}

	/**
	 * 新增字典类型
	 */
	@GetMapping("/add")
	public String add() {
		return prefix + "/add";
	}

	/**
	 * 新增保存字典类型
	 */
	@Log(title = "字典类型", businessType = BusinessType.INSERT)
	@RequiresPermissions("system:dict:add")
	@PostMapping("/add")
	@ResponseBody
	public AjaxResult addSave(@Validated SysDictType dict) {
		if (UserConstants.DICT_TYPE_NOT_UNIQUE.equals(dictTypeService.checkDictTypeUnique(dict))) {
			return error("新增字典'" + dict.getDictName() + "'失败，字典类型已存在");
		}
		dict.setCreateBy(ShiroUtils.getLoginName());
		return toAjax(dictTypeService.insertDictType(dict));
	}

	/**
	 * 修改字典类型
	 */
	@GetMapping("/edit/{dictId}")
	public String edit(@PathVariable("dictId") Long dictId, ModelMap mmap) {
		mmap.put("dict", dictTypeService.selectDictTypeById(dictId));
		return prefix + "/edit";
	}

	/**
	 * 修改保存字典类型
	 */
	@Log(title = "字典类型", businessType = BusinessType.UPDATE)
	@RequiresPermissions("system:dict:edit")
	@PostMapping("/edit")
	@ResponseBody
	public AjaxResult editSave(@Validated SysDictType dict) {
		if (UserConstants.DICT_TYPE_NOT_UNIQUE.equals(dictTypeService.checkDictTypeUnique(dict))) {
			return error("修改字典'" + dict.getDictName() + "'失败，字典类型已存在");
		}
		dict.setUpdateBy(ShiroUtils.getLoginName());
		return toAjax(dictTypeService.updateDictType(dict));
	}

	@Log(title = "字典类型", businessType = BusinessType.DELETE)
	@RequiresPermissions("system:dict:remove")
	@PostMapping("/remove")
	@ResponseBody
	public AjaxResult remove(String ids) {
		dictTypeService.deleteDictTypeByIds(ids);
		return success();
	}

	/**
	 * 刷新字典缓存
	 */
	@RequiresPermissions("system:dict:remove")
	@Log(title = "字典类型", businessType = BusinessType.CLEAN)
	@GetMapping("/refreshCache")
	@ResponseBody
	public AjaxResult refreshCache() {
		dictTypeService.resetDictCache();
		return success();
	}

	/**
	 * 查询字典详细
	 */
	@RequiresPermissions("system:dict:list")
	@GetMapping("/detail/{dictId}")
	public String detail(@PathVariable("dictId") Long dictId, ModelMap mmap) {
		mmap.put("dict", dictTypeService.selectDictTypeById(dictId));
		mmap.put("dictList", dictTypeService.selectDictTypeAll());
		return "system/dict/data/data";
	}

	/**
	 * 校验字典类型
	 */
	@PostMapping("/checkDictTypeUnique")
	@ResponseBody
	public String checkDictTypeUnique(SysDictType dictType) {
		return dictTypeService.checkDictTypeUnique(dictType);
	}

	/**
	 * 选择字典树
	 */
	@GetMapping("/selectDictTree/{columnId}/{dictType}")
	public String selectDeptTree(@PathVariable("columnId") Long columnId, @PathVariable("dictType") String dictType,
			ModelMap mmap) {
		mmap.put("columnId", columnId);
		mmap.put("dict", dictTypeService.selectDictTypeByType(dictType));
		return prefix + "/tree";
	}

	/**
	 * 加载字典列表树
	 */
	@GetMapping("/treeData")
	@ResponseBody
	public List<Ztree> treeData() {
		List<Ztree> ztrees = dictTypeService.selectDictTree(new SysDictType());
		return ztrees;
	}
}
