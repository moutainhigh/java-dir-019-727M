package com.yanxiuhair.web.controller.tool;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import com.yanxiuhair.common.core.controller.BaseController;

/**
 * @ClassName:  BuildController   
 * @Description: build 表单构建
 * @author: gaoxiaochuang   
 * @date:   2021年7月1日 下午6:07:08   
 *     
 * @Copyright: 2021 http://www.yanxiuhair.com/ Inc. All rights reserved. 
 * 注意：本内容仅限于许昌妍秀发制品有限公司内部传阅，禁止外泄以及用于其他的商业目
 */
@Controller
@RequestMapping("/tool/build")
public class BuildController extends BaseController {
	private String prefix = "tool/build";

	@RequiresPermissions("tool:build:view")
	@GetMapping()
	public String build() {
		return prefix + "/build";
	}
}
