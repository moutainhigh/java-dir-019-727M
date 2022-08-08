package com.yanxiuhair.common.exception.file;

import java.util.Arrays;
import org.apache.commons.fileupload.FileUploadException;

/**
 * @ClassName:  InvalidExtensionException   
 * @Description: 文件上传 误异常类  
 * @author: gaoxiaochuang   
 * @date:   2021年7月1日 下午3:14:09   
 *     
 * @Copyright: 2021 http://www.yanxiuhair.com/ Inc. All rights reserved. 
 * 注意：本内容仅限于许昌妍秀发制品有限公司内部传阅，禁止外泄以及用于其他的商业目
 */
public class InvalidExtensionException extends FileUploadException {
	private static final long serialVersionUID = 1L;

	private String[] allowedExtension;
	private String extension;
	private String filename;

	public InvalidExtensionException(String[] allowedExtension, String extension, String filename) {
		super("filename : [" + filename + "], extension : [" + extension + "], allowed extension : ["
				+ Arrays.toString(allowedExtension) + "]");
		this.allowedExtension = allowedExtension;
		this.extension = extension;
		this.filename = filename;
	}

	public String[] getAllowedExtension() {
		return allowedExtension;
	}

	public String getExtension() {
		return extension;
	}

	public String getFilename() {
		return filename;
	}

	public static class InvalidImageExtensionException extends InvalidExtensionException {
		private static final long serialVersionUID = 1L;

		public InvalidImageExtensionException(String[] allowedExtension, String extension, String filename) {
			super(allowedExtension, extension, filename);
		}
	}

	public static class InvalidFlashExtensionException extends InvalidExtensionException {
		private static final long serialVersionUID = 1L;

		public InvalidFlashExtensionException(String[] allowedExtension, String extension, String filename) {
			super(allowedExtension, extension, filename);
		}
	}

	public static class InvalidMediaExtensionException extends InvalidExtensionException {
		private static final long serialVersionUID = 1L;

		public InvalidMediaExtensionException(String[] allowedExtension, String extension, String filename) {
			super(allowedExtension, extension, filename);
		}
	}

	public static class InvalidVideoExtensionException extends InvalidExtensionException {
		private static final long serialVersionUID = 1L;

		public InvalidVideoExtensionException(String[] allowedExtension, String extension, String filename) {
			super(allowedExtension, extension, filename);
		}
	}
}
