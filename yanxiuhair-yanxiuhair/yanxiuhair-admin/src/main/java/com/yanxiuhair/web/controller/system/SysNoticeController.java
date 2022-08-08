package com.yanxiuhair.web.controller.system;

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
import com.yanxiuhair.common.utils.ShiroUtils;
import com.yanxiuhair.system.domain.SysNotice;
import com.yanxiuhair.system.service.ISysNoticeService;

/**
 * @ClassName:  SysNoticeController   
 * @Description: 公告 信息操作处理
 * @author: gaoxiaochuang   
 * @date:   2021年7月1日 下午6:05:38   
 *     
 * @Copyright: 2021 http://www.yanxiuhair.com/ Inc. All rights reserved. 
 * 注意：本内容仅限于许昌妍秀发制品有限公司内部传阅，禁止外泄以及用于其他的商业目
 */
@Controller
@RequestMapping("/system/notice")
public class SysNoticeController extends BaseController {
	private String prefix = "system/notice";

	@Autowired
	private ISysNoticeService noticeService;

	@RequiresPermissions("system:notice:view")
	@GetMapping()
	public String notice() {
		return prefix + "/notice";
	}

	/**
	 * 查询公告列表
	 */
	@RequiresPermissions("system:notice:list")
	@PostMapping("/list")
	@ResponseBody
	public EasyUITableDataInfo list(SysNotice notice) {
		easyUIStartPage();
		if(notice.getNoticeType() != null){
			notice.setNoticeType(notice.getNoticeType().trim());
		}
		List<SysNotice> list = noticeService.selectNoticeList(notice);
		return getEasyUIDataTable(list);
	}

	/**
	 * 新增公告
	 */
	@GetMapping("/add")
	public String add() {
		return prefix + "/add";
	}

	/**
	 * 新增保存公告
	 */
	@RequiresPermissions("system:notice:add")
	@Log(title = "通知公告", businessType = BusinessType.INSERT)
	@PostMapping("/add")
	@ResponseBody
	public AjaxResult addSave(SysNotice notice) {
		notice.setCreateBy(ShiroUtils.getLoginName());
		return toAjax(noticeService.insertNotice(notice));
	}

	/**
	 * 修改公告
	 */
	@GetMapping("/edit/{noticeId}")
	public String edit(@PathVariable("noticeId") Long noticeId, ModelMap mmap) {
		mmap.put("notice", noticeService.selectNoticeById(noticeId));
		return prefix + "/edit";
	}

	/**
	 * 修改保存公告
	 */
	@RequiresPermissions("system:notice:edit")
	@Log(title = "通知公告", businessType = BusinessType.UPDATE)
	@PostMapping("/edit")
	@ResponseBody
	public AjaxResult editSave(SysNotice notice) {
		notice.setUpdateBy(ShiroUtils.getLoginName());
		return toAjax(noticeService.updateNotice(notice));
	}

	/**
	 * 删除公告
	 */
	@RequiresPermissions("system:notice:remove")
	@Log(title = "通知公告", businessType = BusinessType.DELETE)
	@PostMapping("/remove")
	@ResponseBody
	public AjaxResult remove(String ids) {
		return toAjax(noticeService.deleteNoticeByIds(ids));
	}
}
