package com.yanxiuhair.web.controller.monitor;

import java.util.List;
import org.apache.shiro.authz.annotation.Logical;
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
import com.yanxiuhair.common.core.text.Convert;
import com.yanxiuhair.common.enums.BusinessType;
import com.yanxiuhair.common.enums.OnlineStatus;
import com.yanxiuhair.common.utils.ShiroUtils;
import com.yanxiuhair.framework.shiro.session.OnlineSession;
import com.yanxiuhair.framework.shiro.session.OnlineSessionDAO;
import com.yanxiuhair.system.domain.SysUserOnline;
import com.yanxiuhair.system.service.ISysUserOnlineService;

/**
 * @ClassName:  SysUserOnlineController   
 * @Description: 在线用户监控 
 * @author: gaoxiaochuang   
 * @date:   2021年7月1日 下午6:00:18   
 *     
 * @Copyright: 2021 http://www.yanxiuhair.com/ Inc. All rights reserved. 
 * 注意：本内容仅限于许昌妍秀发制品有限公司内部传阅，禁止外泄以及用于其他的商业目
 */
@Controller
@RequestMapping("/monitor/online")
public class SysUserOnlineController extends BaseController {
	private String prefix = "monitor/online";

	@Autowired
	private ISysUserOnlineService userOnlineService;

	@Autowired
	private OnlineSessionDAO onlineSessionDAO;

	@RequiresPermissions("monitor:online:view")
	@GetMapping()
	public String online() {
		return prefix + "/online";
	}

	@RequiresPermissions("monitor:online:list")
	@PostMapping("/list")
	@ResponseBody
	public EasyUITableDataInfo list(SysUserOnline userOnline) {
		easyUIStartPage();
		List<SysUserOnline> list = userOnlineService.selectUserOnlineList(userOnline);
		return getEasyUIDataTable(list);
	}

	@RequiresPermissions(value = { "monitor:online:batchForceLogout",
			"monitor:online:forceLogout" }, logical = Logical.OR)
	@Log(title = "在线用户", businessType = BusinessType.FORCE)
	@PostMapping("/batchForceLogout")
	@ResponseBody
	public AjaxResult batchForceLogout(String ids) {
		for (String sessionId : Convert.toStrArray(ids)) {
			SysUserOnline online = userOnlineService.selectOnlineById(sessionId);
			if (online == null) {
				return error("用户已下线");
			}
			OnlineSession onlineSession = (OnlineSession) onlineSessionDAO.readSession(online.getSessionId());
			if (onlineSession == null) {
				return error("用户已下线");
			}
			if (sessionId.equals(ShiroUtils.getSessionId())) {
				return error("当前登录用户无法强退");
			}
			onlineSessionDAO.delete(onlineSession);
			online.setStatus(OnlineStatus.off_line);
			userOnlineService.saveOnline(online);
			userOnlineService.removeUserCache(online.getLoginName(), sessionId);
		}
		return success();
	}
}
