package com.yanxiuhair.common.utils.file;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.FileInputStream;
import java.io.InputStream;
import java.net.URL;
import java.net.URLConnection;
import java.util.Arrays;
import org.apache.poi.util.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import com.yanxiuhair.common.config.Global;
import com.yanxiuhair.common.constant.Constants;
import com.yanxiuhair.common.utils.StringUtils;

/**
 * @ClassName:  ImageUtils   
 * @Description: 图片处理工具类   
 * @author: gaoxiaochuang   
 * @date:   2021年7月1日 下午3:33:20   
 *     
 * @Copyright: 2021 http://www.yanxiuhair.com/ Inc. All rights reserved. 
 * 注意：本内容仅限于许昌妍秀发制品有限公司内部传阅，禁止外泄以及用于其他的商业目
 */
public class ImageUtils {
	private static final Logger log = LoggerFactory.getLogger(ImageUtils.class);

	public static byte[] getImage(String imagePath) {
		InputStream is = getFile(imagePath);
		try {
			return IOUtils.toByteArray(is);
		} catch (Exception e) {
			log.error("图片加载异常 {}", e);
			return null;
		} finally {
			IOUtils.closeQuietly(is);
		}
	}

	public static InputStream getFile(String imagePath) {
		try {
			byte[] result = readFile(imagePath);
			result = Arrays.copyOf(result, result.length);
			return new ByteArrayInputStream(result);
		} catch (Exception e) {
			log.error("获取图片异常 {}", e);
		}
		return null;
	}

	/**
	 * 读取文件为字节数据
	 * 
	 * @param key
	 *            地址
	 * @return 字节数据
	 */
	public static byte[] readFile(String url) {
		InputStream in = null;
		ByteArrayOutputStream baos = null;
		try {
			if (url.startsWith("http")) {
				// 网络地址
				URL urlObj = new URL(url);
				URLConnection urlConnection = urlObj.openConnection();
				urlConnection.setConnectTimeout(30 * 1000);
				urlConnection.setReadTimeout(60 * 1000);
				urlConnection.setDoInput(true);
				in = urlConnection.getInputStream();
			} else {
				// 本机地址
				String localPath = Global.getProfile();
				String downloadPath = localPath + StringUtils.substringAfter(url, Constants.RESOURCE_PREFIX);
				in = new FileInputStream(downloadPath);
			}
			return IOUtils.toByteArray(in);
		} catch (Exception e) {
			log.error("获取文件路径异常 {}", e);
			return null;
		} finally {
			IOUtils.closeQuietly(in);
			IOUtils.closeQuietly(baos);
		}
	}
}
