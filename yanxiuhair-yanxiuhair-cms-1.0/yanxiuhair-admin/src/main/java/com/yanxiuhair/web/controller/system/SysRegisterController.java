package com.yanxiuhair.web.controller.system;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.yanxiuhair.common.core.controller.BaseController;
import com.yanxiuhair.common.core.domain.AjaxResult;
import com.yanxiuhair.common.core.domain.entity.SysUser;
import com.yanxiuhair.framework.shiro.service.SysRegisterService;
import com.yanxiuhair.system.service.ISysConfigService;

/**
 * @ClassName:  SysRegisterController   
 * @Description: 注册验证 
 * @author: gaoxiaochuang   
 * @date:   2021年7月1日 下午6:06:20   
 *     
 * @Copyright: 2021 http://www.yanxiuhair.com/ Inc. All rights reserved. 
 * 注意：本内容仅限于许昌妍秀发制品有限公司内部传阅，禁止外泄以及用于其他的商业目
 */
@Controller
public class SysRegisterController extends BaseController {
	@Autowired
	private SysRegisterService registerService;

	@Autowired
	private ISysConfigService configService;

	@GetMapping("/register")
	public String register() {
		return "register";
	}

	@PostMapping("/register")
	@ResponseBody
	public AjaxResult ajaxRegister(SysUser user) {
		if (!("true".equals(configService.selectConfigByKey("sys.account.registerUser")))) {
			return error("当前系统没有开启注册功能！");
		}
		String msg = registerService.register(user);
		return StringUtils.isEmpty(msg) ? success() : error(msg);
	}
}
