package com.yanxiuhair.common.utils.uuid;

/**
 * @ClassName:  IdUtils   
 * @Description: ID生成器工具类  
 * @author: gaoxiaochuang   
 * @date:   2021年7月1日 下午3:39:28   
 *     
 * @Copyright: 2021 http://www.yanxiuhair.com/ Inc. All rights reserved. 
 * 注意：本内容仅限于许昌妍秀发制品有限公司内部传阅，禁止外泄以及用于其他的商业目
 */
public class IdUtils {
	/**
	 * 获取随机UUID
	 * 
	 * @return 随机UUID
	 */
	public static String randomUUID() {
		return UUID.randomUUID().toString();
	}

	/**
	 * 简化的UUID，去掉了横线
	 * 
	 * @return 简化的UUID，去掉了横线
	 */
	public static String simpleUUID() {
		return UUID.randomUUID().toString(true);
	}

	/**
	 * 获取随机UUID，使用性能更好的ThreadLocalRandom生成UUID
	 * 
	 * @return 随机UUID
	 */
	public static String fastUUID() {
		return UUID.fastUUID().toString();
	}

	/**
	 * 简化的UUID，去掉了横线，使用性能更好的ThreadLocalRandom生成UUID
	 * 
	 * @return 简化的UUID，去掉了横线
	 */
	public static String fastSimpleUUID() {
		return UUID.fastUUID().toString(true);
	}
}
