package com.yanxiuhair.web.core.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import com.yanxiuhair.common.config.Global;
import io.swagger.annotations.ApiOperation;
import springfox.documentation.builders.ApiInfoBuilder;
import springfox.documentation.builders.PathSelectors;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.service.ApiInfo;
import springfox.documentation.service.Contact;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;

/**
 * @ClassName:  SwaggerConfig   
 * @Description: Swagger2的接口配置
 * @author: gaoxiaochuang   
 * @date:   2021年7月1日 下午6:32:17   
 *     
 * @Copyright: 2021 http://www.yanxiuhair.com/ Inc. All rights reserved. 
 * 注意：本内容仅限于许昌妍秀发制品有限公司内部传阅，禁止外泄以及用于其他的商业目
 */
@Configuration
public class SwaggerConfig {
	/** 是否开启swagger */
	@Value("${swagger.enabled}")
	private boolean enabled;

	/**
	 * 创建API
	 */
	@Bean
	public Docket createRestApi() {
		return new Docket(DocumentationType.OAS_30)
				// 是否启用Swagger
				.enable(enabled)
				// 用来创建该API的基本信息，展示在文档的页面中（自定义展示的信息）
				.apiInfo(apiInfo())
				// 设置哪些接口暴露给Swagger展示
				.select()
				// 扫描所有有注解的api，用这种方式更灵活
				.apis(RequestHandlerSelectors.withMethodAnnotation(ApiOperation.class))
				// 扫描指定包中的swagger注解
				// .apis(RequestHandlerSelectors.basePackage("com.ruoyi.project.tool.swagger"))
				// 扫描所有 .apis(RequestHandlerSelectors.any())
				.paths(PathSelectors.any()).build();
	}

	/**
	 * 添加摘要信息
	 */
	private ApiInfo apiInfo() {
		// 用ApiInfoBuilder进行定制
		return new ApiInfoBuilder()
				// 设置标题
				.title("标题：妍秀后台管理系统_接口文档")
				// 描述
				.description("描述：具体包括XXX,XXX模块...")
				// 作者信息
				.contact(new Contact(Global.getName(), null, null))
				// 版本
				.version("版本号:" + Global.getVersion()).build();
	}
}
