package com.yanxiuhair.quartz.controller;

import java.util.List;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.yanxiuhair.common.annotation.Log;
import com.yanxiuhair.common.core.controller.BaseController;
import com.yanxiuhair.common.core.domain.AjaxResult;
import com.yanxiuhair.common.core.page.EasyUITableDataInfo;
import com.yanxiuhair.common.enums.BusinessType;
import com.yanxiuhair.common.utils.StringUtils;
import com.yanxiuhair.common.utils.poi.ExcelUtil;
import com.yanxiuhair.quartz.domain.SysJob;
import com.yanxiuhair.quartz.domain.SysJobLog;
import com.yanxiuhair.quartz.service.ISysJobLogService;
import com.yanxiuhair.quartz.service.ISysJobService;

/**
 * @ClassName:  SysJobLogController   
 * @Description: 调度日志操作处理 
 * @author: gaoxiaochuang   
 * @date:   2021年7月1日 下午4:58:20   
 *     
 * @Copyright: 2021 http://www.yanxiuhair.com/ Inc. All rights reserved. 
 * 注意：本内容仅限于许昌妍秀发制品有限公司内部传阅，禁止外泄以及用于其他的商业目
 */
@Controller
@RequestMapping("/monitor/jobLog")
public class SysJobLogController extends BaseController {
	private String prefix = "monitor/job";

	@Autowired
	private ISysJobService jobService;

	@Autowired
	private ISysJobLogService jobLogService;

	@RequiresPermissions("monitor:job:view")
	@GetMapping()
	public String jobLog(@RequestParam(value = "jobId", required = false) Long jobId, ModelMap mmap) {
		if (StringUtils.isNotNull(jobId)) {
			SysJob job = jobService.selectJobById(jobId);
			mmap.put("job", job);
		}
		return prefix + "/jobLog";
	}

	@RequiresPermissions("monitor:job:list")
	@PostMapping("/list")
	@ResponseBody
	public EasyUITableDataInfo list(SysJobLog jobLog) {
		easyUIStartPage();
		List<SysJobLog> list = jobLogService.selectJobLogList(jobLog);
		return getEasyUIDataTable(list);
	}

	@Log(title = "调度日志", businessType = BusinessType.EXPORT)
	@RequiresPermissions("monitor:job:export")
	@PostMapping("/export")
	@ResponseBody
	public AjaxResult export(SysJobLog jobLog) {
		List<SysJobLog> list = jobLogService.selectJobLogList(jobLog);
		ExcelUtil<SysJobLog> util = new ExcelUtil<SysJobLog>(SysJobLog.class);
		return util.exportExcel(list, "调度日志");
	}

	@Log(title = "调度日志", businessType = BusinessType.DELETE)
	@RequiresPermissions("monitor:job:remove")
	@PostMapping("/remove")
	@ResponseBody
	public AjaxResult remove(String ids) {
		return toAjax(jobLogService.deleteJobLogByIds(ids));
	}

	@RequiresPermissions("monitor:job:detail")
	@GetMapping("/detail/{jobLogId}")
	public String detail(@PathVariable("jobLogId") Long jobLogId, ModelMap mmap) {
		mmap.put("name", "jobLog");
		mmap.put("jobLog", jobLogService.selectJobLogById(jobLogId));
		return prefix + "/detail";
	}

	@Log(title = "调度日志", businessType = BusinessType.CLEAN)
	@RequiresPermissions("monitor:job:remove")
	@PostMapping("/clean")
	@ResponseBody
	public AjaxResult clean() {
		jobLogService.cleanJobLog();
		return success();
	}
}
