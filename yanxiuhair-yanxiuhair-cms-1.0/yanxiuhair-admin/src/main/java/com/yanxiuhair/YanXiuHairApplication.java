package com.yanxiuhair;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;

/**
 * @ClassName:  YanXiuHairApplication   
 * @Description: 启动程序 
 * @author: gaoxiaochuang   
 * @date:   2020年5月19日 下午1:27:57   
 *     
 * @Copyright: 2020 http://www.yanxiuhair.com Inc. All rights reserved. 
 * 注意：本内容仅限于许昌妍秀发制品有限公司内部传阅，禁止外泄以及用于其他的商业目
 */
@SpringBootApplication(exclude = { DataSourceAutoConfiguration.class })
public class YanXiuHairApplication {
	public static void main(String[] args) {
		// System.setProperty("spring.devtools.restart.enabled", "false");
		SpringApplication.run(YanXiuHairApplication.class, args);
		System.out.println(""
				+ "*********************************************系统启动成功*********************************************** \n"
				+ "*  ##    ##    ###    ##    ##    ##     ## #### ##     ##    ##     ##    ###    #### ########    *\n"
				+ "*   ##  ##    ## ##   ###   ##     ##   ##   ##  ##     ##    ##     ##   ## ##    ##  ##     ##   *\n"
				+ "*    ####    ##   ##  ####  ##      ## ##    ##  ##     ##    ##     ##  ##   ##   ##  ##     ##   *\n"
				+ "*     ##    ##     ## ## ## ##       ###     ##  ##     ##    ######### ##     ##  ##  ########    *\n"
				+ "*     ##    ######### ##  ####      ## ##    ##  ##     ##    ##     ## #########  ##  ##   ##     *\n"
				+ "*     ##    ##     ## ##   ###     ##   ##   ##  ##     ##    ##     ## ##     ##  ##  ##    ##    *\n"
				+ "*     ##    ##     ## ##    ##    ##     ## ####  #######     ##     ## ##     ## #### ##     ##   *\n"
				+ "****************************************************************************************************\n");
	}
}