package com.yanxiuhair.web.controller.monitor;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import com.yanxiuhair.common.core.controller.BaseController;
import com.yanxiuhair.framework.web.domain.Server;

/**
 * @ClassName:  ServerController   
 * @Description: 服务器监控   
 * @author: gaoxiaochuang   
 * @date:   2021年7月1日 下午5:59:35   
 *     
 * @Copyright: 2021 http://www.yanxiuhair.com/ Inc. All rights reserved. 
 * 注意：本内容仅限于许昌妍秀发制品有限公司内部传阅，禁止外泄以及用于其他的商业目
 */
@Controller
@RequestMapping("/monitor/server")
public class ServerController extends BaseController {
	private String prefix = "monitor/server";

	@RequiresPermissions("monitor:server:view")
	@GetMapping()
	public String server(ModelMap mmap) throws Exception {
		Server server = new Server();
		server.copyTo();
		mmap.put("server", server);
		return prefix + "/server";
	}
}
