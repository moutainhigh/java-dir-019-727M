package com.yanxiuhair.common.config;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

/**
 * @ClassName:  Global   
 * @Description: 全局配置类   
 * @author: gaoxiaochuang   
 * @date:   2021年7月1日 下午2:20:55   
 *     
 * @Copyright: 2021 http://www.yanxiuhair.com/ Inc. All rights reserved. 
 * 注意：本内容仅限于许昌妍秀发制品有限公司内部传阅，禁止外泄以及用于其他的商业目
 */
@Component
@ConfigurationProperties(prefix = "yanxiuhair")
public class Global {
	/** 项目名称 */
	private static String name;

	/** 版本 */
	private static String version;

	/** 版权年份 */
	private static String copyrightYear;

	/** 实例演示开关 */
	private static boolean demoEnabled;

	/** 上传路径 */
	private static String profile;

	/** 获取地址开关 */
	private static boolean addressEnabled;

	public static String getName() {
		return name;
	}

	public void setName(String name) {
		Global.name = name;
	}

	public static String getVersion() {
		return version;
	}

	public void setVersion(String version) {
		Global.version = version;
	}

	public static String getCopyrightYear() {
		return copyrightYear;
	}

	public void setCopyrightYear(String copyrightYear) {
		Global.copyrightYear = copyrightYear;
	}

	public static boolean isDemoEnabled() {
		return demoEnabled;
	}

	public void setDemoEnabled(boolean demoEnabled) {
		Global.demoEnabled = demoEnabled;
	}

	public static String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		Global.profile = profile;
	}

	public static boolean isAddressEnabled() {
		return addressEnabled;
	}

	public void setAddressEnabled(boolean addressEnabled) {
		Global.addressEnabled = addressEnabled;
	}

	/**
	 * 获取头像上传路径
	 */
	public static String getAvatarPath() {
		return getProfile() + "/avatar";
	}

	/**
	 * 获取下载路径
	 */
	public static String getDownloadPath() {
		return getProfile() + "/download/";
	}

	/**
	 * 获取上传路径
	 */
	public static String getUploadPath() {
		return getProfile() + "/upload";
	}
}
