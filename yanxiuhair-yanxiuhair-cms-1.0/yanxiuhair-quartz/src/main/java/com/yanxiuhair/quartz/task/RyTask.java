package com.yanxiuhair.quartz.task;

import org.springframework.stereotype.Component;
import com.yanxiuhair.common.utils.StringUtils;

/**
 * @ClassName:  RyTask   
 * @Description: 定时任务调度测试
 * @author: gaoxiaochuang   
 * @date:   2021年7月1日 下午5:00:29   
 *     
 * @Copyright: 2021 http://www.yanxiuhair.com/ Inc. All rights reserved. 
 * 注意：本内容仅限于许昌妍秀发制品有限公司内部传阅，禁止外泄以及用于其他的商业目
 */
@Component("ryTask")
public class RyTask {
	public void ryMultipleParams(String s, Boolean b, Long l, Double d, Integer i) {
		System.out.println(StringUtils.format("执行多参方法： 字符串类型{}，布尔类型{}，长整型{}，浮点型{}，整形{}", s, b, l, d, i));
	}

	public void ryParams(String params) {
		System.out.println("执行有参方法：" + params);
	}

	public void ryNoParams() {
		System.out.println("执行无参方法");
	}
}
