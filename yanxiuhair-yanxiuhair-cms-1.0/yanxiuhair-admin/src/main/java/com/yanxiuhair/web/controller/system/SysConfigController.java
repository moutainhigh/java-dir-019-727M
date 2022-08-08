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
import com.yanxiuhair.common.core.page.EasyUITableDataInfo;
import com.yanxiuhair.common.enums.BusinessType;
import com.yanxiuhair.common.utils.ShiroUtils;
import com.yanxiuhair.common.utils.poi.ExcelUtil;
import com.yanxiuhair.system.domain.SysConfig;
import com.yanxiuhair.system.service.ISysConfigService;

/**
 * @ClassName:  SysConfigController   
 * @Description: 参数配置 信息操作处理
 * @author: gaoxiaochuang   
 * @date:   2021年7月1日 下午6:00:56   
 *     
 * @Copyright: 2021 http://www.yanxiuhair.com/ Inc. All rights reserved. 
 * 注意：本内容仅限于许昌妍秀发制品有限公司内部传阅，禁止外泄以及用于其他的商业目
 */
@Controller
@RequestMapping("/system/config")
public class SysConfigController extends BaseController {
	private String prefix = "system/config";

	@Autowired
	private ISysConfigService configService;

	@RequiresPermissions("system:config:view")
	@GetMapping()
	public String config() {
		return prefix + "/config";
	}

	/**
	 * 查询参数配置列表
	 */
	@RequiresPermissions("system:config:list")
	@PostMapping("/list")
	@ResponseBody
	public EasyUITableDataInfo list(SysConfig config) {
		easyUIStartPage();
		List<SysConfig> list = configService.selectConfigList(config);
		return getEasyUIDataTable(list);
	}

	@Log(title = "参数管理", businessType = BusinessType.EXPORT)
	@RequiresPermissions("system:config:export")
	@PostMapping("/export")
	@ResponseBody
	public AjaxResult export(SysConfig config) {
		List<SysConfig> list = configService.selectConfigList(config);
		ExcelUtil<SysConfig> util = new ExcelUtil<SysConfig>(SysConfig.class);
		return util.exportExcel(list, "参数数据");
	}

	/**
	 * 新增参数配置
	 */
	@GetMapping("/add")
	public String add() {
		return prefix + "/add";
	}

	/**
	 * 新增保存参数配置
	 */
	@RequiresPermissions("system:config:add")
	@Log(title = "参数管理", businessType = BusinessType.INSERT)
	@PostMapping("/add")
	@ResponseBody
	public AjaxResult addSave(@Validated SysConfig config) {
		if (UserConstants.CONFIG_KEY_NOT_UNIQUE.equals(configService.checkConfigKeyUnique(config))) {
			return error("新增参数'" + config.getConfigName() + "'失败，参数键名已存在");
		}
		config.setCreateBy(ShiroUtils.getLoginName());
		return toAjax(configService.insertConfig(config));
	}

	/**
	 * 修改参数配置
	 */
	@GetMapping("/edit/{configId}")
	public String edit(@PathVariable("configId") Long configId, ModelMap mmap) {
		mmap.put("config", configService.selectConfigById(configId));
		return prefix + "/edit";
	}

	/**
	 * 修改保存参数配置
	 */
	@RequiresPermissions("system:config:edit")
	@Log(title = "参数管理", businessType = BusinessType.UPDATE)
	@PostMapping("/edit")
	@ResponseBody
	public AjaxResult editSave(@Validated SysConfig config) {
		if (UserConstants.CONFIG_KEY_NOT_UNIQUE.equals(configService.checkConfigKeyUnique(config))) {
			return error("修改参数'" + config.getConfigName() + "'失败，参数键名已存在");
		}
		config.setUpdateBy(ShiroUtils.getLoginName());
		return toAjax(configService.updateConfig(config));
	}

	/**
	 * 删除参数配置
	 */
	@RequiresPermissions("system:config:remove")
	@Log(title = "参数管理", businessType = BusinessType.DELETE)
	@PostMapping("/remove")
	@ResponseBody
	public AjaxResult remove(String ids) {
		configService.deleteConfigByIds(ids);
		return success();
	}

	/**
	 * 刷新参数缓存
	 */
	@RequiresPermissions("system:config:remove")
	@Log(title = "参数管理", businessType = BusinessType.CLEAN)
	@GetMapping("/refreshCache")
	@ResponseBody
	public AjaxResult refreshCache() {
		configService.resetConfigCache();
		return success();
	}

	/**
	 * 校验参数键名
	 */
	@PostMapping("/checkConfigKeyUnique")
	@ResponseBody
	public String checkConfigKeyUnique(SysConfig config) {
		return configService.checkConfigKeyUnique(config);
	}
}
