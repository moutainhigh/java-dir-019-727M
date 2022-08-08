package com.yanxiuhair.common.utils.file;

/**
 * @ClassName:  MimeTypeUtils   
 * @Description: 媒体类型工具类   
 * @author: gaoxiaochuang   
 * @date:   2021年7月1日 下午3:33:58   
 *     
 * @Copyright: 2021 http://www.yanxiuhair.com/ Inc. All rights reserved. 
 * 注意：本内容仅限于许昌妍秀发制品有限公司内部传阅，禁止外泄以及用于其他的商业目
 */
public class MimeTypeUtils {
	public static final String IMAGE_PNG = "image/png";

	public static final String IMAGE_JPG = "image/jpg";

	public static final String IMAGE_JPEG = "image/jpeg";

	public static final String IMAGE_BMP = "image/bmp";

	public static final String IMAGE_GIF = "image/gif";

	public static final String[] IMAGE_EXTENSION = { "bmp", "gif", "jpg", "jpeg", "png" };

	public static final String[] FLASH_EXTENSION = { "swf", "flv" };

	public static final String[] MEDIA_EXTENSION = { "swf", "flv", "mp3", "wav", "wma", "wmv", "mid", "avi", "mpg",
			"asf", "rm", "rmvb" };

	public static final String[] VIDEO_EXTENSION = { "mp4", "avi", "rmvb" };

	public static final String[] DEFAULT_ALLOWED_EXTENSION = {
			// 图片
			"bmp", "gif", "jpg", "jpeg", "png",
			// word excel powerpoint
			"doc", "docx", "xls", "xlsx", "ppt", "pptx", "html", "htm", "txt",
			// 压缩文件
			"rar", "zip", "gz", "bz2",
			// 视频格式
			"mp4", "avi", "rmvb",
			// pdf
			"pdf" };

	public static String getExtension(String prefix) {
		switch (prefix) {
		case IMAGE_PNG:
			return "png";
		case IMAGE_JPG:
			return "jpg";
		case IMAGE_JPEG:
			return "jpeg";
		case IMAGE_BMP:
			return "bmp";
		case IMAGE_GIF:
			return "gif";
		default:
			return "";
		}
	}
}
