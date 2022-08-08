package com.yanxiuhair.common.exception.file;

import com.yanxiuhair.common.exception.base.BaseException;

/**
 * @ClassName:  FileException   
 * @Description: 文件信息异常类 
 * @author: gaoxiaochuang   
 * @date:   2021年7月1日 下午3:10:21   
 *     
 * @Copyright: 2021 http://www.yanxiuhair.com/ Inc. All rights reserved. 
 * 注意：本内容仅限于许昌妍秀发制品有限公司内部传阅，禁止外泄以及用于其他的商业目
 */
public class FileException extends BaseException {
	private static final long serialVersionUID = 1L;

	public FileException(String code, Object[] args) {
		super("file", code, args, null);
	}

}
