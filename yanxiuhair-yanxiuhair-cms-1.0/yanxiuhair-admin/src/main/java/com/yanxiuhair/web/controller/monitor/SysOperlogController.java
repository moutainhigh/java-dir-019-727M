package com.yanxiuhair.web.controller.monitor;

import java.util.List;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.yanxiuhair.common.annotation.Log;
import com.yanxiuhair.common.core.controller.BaseController;
import com.yanxiuhair.common.core.domain.AjaxResult;
import com.yanxiuhair.common.core.page.EasyUITableDataInfo;
import com.yanxiuhair.common.enums.BusinessType;
import com.yanxiuhair.common.utils.poi.ExcelUtil;
import com.yanxiuhair.system.domain.SysOperLog;
import com.yanxiuhair.system.service.ISysOperLogService;

/**
 * @ClassName:  SysOperlogController   
 * @Description: 操作日志记录
 * @author: gaoxiaochuang   
 * @date:   2021年7月1日 下午6:00:02   
 *     
 * @Copyright: 2021 http://www.yanxiuhair.com/ Inc. All rights reserved. 
 * 注意：本内容仅限于许昌妍秀发制品有限公司内部传阅，禁止外泄以及用于其他的商业目
 */
@Controller
@RequestMapping("/monitor/operlog")
public class SysOperlogController extends BaseController {
	private String prefix = "monitor/operlog";

	@Autowired
	private ISysOperLogService operLogService;

	@RequiresPermissions("monitor:operlog:view")
	@GetMapping()
	public String operlog() {
		return prefix + "/operlog";
	}

	@RequiresPermissions("monitor:operlog:list")
	@PostMapping("/list")
	@ResponseBody
	public EasyUITableDataInfo list(SysOperLog operLog) {
		easyUIStartPage();
		List<SysOperLog> list = operLogService.selectOperLogList(operLog);
		return getEasyUIDataTable(list);
	}

	@Log(title = "操作日志", businessType = BusinessType.EXPORT)
	@RequiresPermissions("monitor:operlog:export")
	@PostMapping("/export")
	@ResponseBody
	public AjaxResult export(SysOperLog operLog) {
		List<SysOperLog> list = operLogService.selectOperLogList(operLog);
		ExcelUtil<SysOperLog> util = new ExcelUtil<SysOperLog>(SysOperLog.class);
		return util.exportExcel(list, "操作日志");
	}

	@Log(title = "操作日志", businessType = BusinessType.DELETE)
	@RequiresPermissions("monitor:operlog:remove")
	@PostMapping("/remove")
	@ResponseBody
	public AjaxResult remove(String ids) {
		return toAjax(operLogService.deleteOperLogByIds(ids));
	}

	@RequiresPermissions("monitor:operlog:detail")
	@GetMapping("/detail/{operId}")
	public String detail(@PathVariable("operId") Long operId, ModelMap mmap) {
		mmap.put("operLog", operLogService.selectOperLogById(operId));
		return prefix + "/detail";
	}

	@Log(title = "操作日志", businessType = BusinessType.CLEAN)
	@RequiresPermissions("monitor:operlog:remove")
	@PostMapping("/clean")
	@ResponseBody
	public AjaxResult clean() {
		operLogService.cleanOperLog();
		return success();
	}
}
