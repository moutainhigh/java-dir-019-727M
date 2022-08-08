package com.yanxiuhair.common.utils;

import java.io.PrintWriter;
import java.io.StringWriter;
import org.apache.commons.lang3.exception.ExceptionUtils;

/**
 * @ClassName:  ExceptionUtil   
 * @Description:  错误信息处理类。  
 * @author: gaoxiaochuang   
 * @date:   2021年7月1日 下午3:23:43   
 *     
 * @Copyright: 2021 http://www.yanxiuhair.com/ Inc. All rights reserved. 
 * 注意：本内容仅限于许昌妍秀发制品有限公司内部传阅，禁止外泄以及用于其他的商业目
 */
public class ExceptionUtil {
	/**
	 * 获取exception的详细错误信息。
	 */
	public static String getExceptionMessage(Throwable e) {
		StringWriter sw = new StringWriter();
		e.printStackTrace(new PrintWriter(sw, true));
		String str = sw.toString();
		return str;
	}

	public static String getRootErrorMessage(Exception e) {
		Throwable root = ExceptionUtils.getRootCause(e);
		root = (root == null ? e : root);
		if (root == null) {
			return "";
		}
		String msg = root.getMessage();
		if (msg == null) {
			return "null";
		}
		return StringUtils.defaultString(msg);
	}
}
