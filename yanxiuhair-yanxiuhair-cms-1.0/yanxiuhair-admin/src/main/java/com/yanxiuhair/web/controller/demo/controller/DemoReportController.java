package com.yanxiuhair.web.controller.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @ClassName:  DemoReportController   
 * @Description: 报表  
 * @author: gaoxiaochuang   
 * @date:   2021年7月1日 下午5:57:20   
 *     
 * @Copyright: 2021 http://www.yanxiuhair.com/ Inc. All rights reserved. 
 * 注意：本内容仅限于许昌妍秀发制品有限公司内部传阅，禁止外泄以及用于其他的商业目
 */
@Controller
@RequestMapping("/demo/report")
public class DemoReportController {
	private String prefix = "demo/report";

	/**
	 * 百度ECharts
	 */
	@GetMapping("/echarts")
	public String echarts() {
		return prefix + "/echarts";
	}

	/**
	 * 图表插件
	 */
	@GetMapping("/peity")
	public String peity() {
		return prefix + "/peity";
	}

	/**
	 * 线状图插件
	 */
	@GetMapping("/sparkline")
	public String sparkline() {
		return prefix + "/sparkline";
	}

	/**
	 * 图表组合
	 */
	@GetMapping("/metrics")
	public String metrics() {
		return prefix + "/metrics";
	}
}
