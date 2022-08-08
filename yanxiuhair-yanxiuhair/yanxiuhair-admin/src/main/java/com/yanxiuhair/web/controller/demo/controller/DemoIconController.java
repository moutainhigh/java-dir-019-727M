package com.yanxiuhair.web.controller.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @ClassName:  DemoIconController   
 * @Description: 图标相关
 * @author: gaoxiaochuang   
 * @date:   2021年7月1日 下午5:56:52   
 *     
 * @Copyright: 2021 http://www.yanxiuhair.com/ Inc. All rights reserved. 
 * 注意：本内容仅限于许昌妍秀发制品有限公司内部传阅，禁止外泄以及用于其他的商业目
 */
@Controller
@RequestMapping("/demo/icon")
public class DemoIconController {
	private String prefix = "demo/icon";

	/**
	 * FontAwesome图标
	 */
	@GetMapping("/fontawesome")
	public String fontAwesome() {
		return prefix + "/fontawesome";
	}

	/**
	 * Glyphicons图标
	 */
	@GetMapping("/glyphicons")
	public String glyphicons() {
		return prefix + "/glyphicons";
	}
}
