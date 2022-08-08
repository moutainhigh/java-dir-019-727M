package com.yanxiuhair.common.utils.security;

import java.security.Key;
import java.security.NoSuchAlgorithmException;
import javax.crypto.KeyGenerator;

/**
 * @ClassName:  CipherUtils   
 * @Description: 对称密钥密码算法工具类   
 * @author: gaoxiaochuang   
 * @date:   2021年7月1日 下午3:37:29   
 *     
 * @Copyright: 2021 http://www.yanxiuhair.com/ Inc. All rights reserved. 
 * 注意：本内容仅限于许昌妍秀发制品有限公司内部传阅，禁止外泄以及用于其他的商业目
 */
public class CipherUtils {
	/**
	 * 生成随机秘钥
	 *
	 * @param keyBitSize
	 *            字节大小
	 * @param algorithmName
	 *            算法名称
	 * @return 创建密匙
	 */
	public static Key generateNewKey(int keyBitSize, String algorithmName) {
		KeyGenerator kg;
		try {
			kg = KeyGenerator.getInstance(algorithmName);
		} catch (NoSuchAlgorithmException e) {
			String msg = "Unable to acquire " + algorithmName + " algorithm.  This is required to function.";
			throw new IllegalStateException(msg, e);
		}
		kg.init(keyBitSize);
		return kg.generateKey();
	}
}
