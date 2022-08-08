package com.yanxiuhair.web.controller.monitor;

import java.util.List;
import com.yanxiuhair.framework.shiro.service.SysPasswordService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.yanxiuhair.common.annotation.Log;
import com.yanxiuhair.common.core.controller.BaseController;
import com.yanxiuhair.common.core.domain.AjaxResult;
import com.yanxiuhair.common.core.page.EasyUITableDataInfo;
import com.yanxiuhair.common.enums.BusinessType;
import com.yanxiuhair.common.utils.poi.ExcelUtil;
import com.yanxiuhair.system.domain.SysLogininfor;
import com.yanxiuhair.system.service.ISysLogininforService;

/**
 * @ClassName:  SysLogininforController   
 * @Description: 系统访问记录
 * @author: gaoxiaochuang   
 * @date:   2021年7月1日 下午5:59:50   
 *     
 * @Copyright: 2021 http://www.yanxiuhair.com/ Inc. All rights reserved. 
 * 注意：本内容仅限于许昌妍秀发制品有限公司内部传阅，禁止外泄以及用于其他的商业目
 */
@Controller
@RequestMapping("/monitor/logininfor")
public class SysLogininforController extends BaseController {
	private String prefix = "monitor/logininfor";

	@Autowired
	private ISysLogininforService logininforService;

	@Autowired
	private SysPasswordService passwordService;

	@RequiresPermissions("monitor:logininfor:view")
	@GetMapping()
	public String logininfor() {
		return prefix + "/logininfor";
	}

	@RequiresPermissions("monitor:logininfor:list")
	@PostMapping("/list")
	@ResponseBody
	public EasyUITableDataInfo list(SysLogininfor logininfor) {
		easyUIStartPage();
		List<SysLogininfor> list = logininforService.selectLogininforList(logininfor);
		return getEasyUIDataTable(list);
	}

	@Log(title = "登录日志", businessType = BusinessType.EXPORT)
	@RequiresPermissions("monitor:logininfor:export")
	@PostMapping("/export")
	@ResponseBody
	public AjaxResult export(SysLogininfor logininfor) {
		List<SysLogininfor> list = logininforService.selectLogininforList(logininfor);
		ExcelUtil<SysLogininfor> util = new ExcelUtil<SysLogininfor>(SysLogininfor.class);
		return util.exportExcel(list, "登录日志");
	}

	@RequiresPermissions("monitor:logininfor:remove")
	@Log(title = "登录日志", businessType = BusinessType.DELETE)
	@PostMapping("/remove")
	@ResponseBody
	public AjaxResult remove(String ids) {
		return toAjax(logininforService.deleteLogininforByIds(ids));
	}

	@RequiresPermissions("monitor:logininfor:remove")
	@Log(title = "登录日志", businessType = BusinessType.CLEAN)
	@PostMapping("/clean")
	@ResponseBody
	public AjaxResult clean() {
		logininforService.cleanLogininfor();
		return success();
	}

	@RequiresPermissions("monitor:logininfor:unlock")
	@Log(title = "账户解锁", businessType = BusinessType.OTHER)
	@PostMapping("/unlock")
	@ResponseBody
	public AjaxResult unlock(String loginName) {
		passwordService.clearLoginRecordCache(loginName);
		return success();
	}
}
