package com.yanxiuhair.common.utils;

import org.springframework.context.MessageSource;
import org.springframework.context.i18n.LocaleContextHolder;
import com.yanxiuhair.common.utils.spring.SpringUtils;

/**
 * @ClassName:  MessageUtils   
 * @Description: 获取i18n资源文件   
 * @author: gaoxiaochuang   
 * @date:   2021年7月1日 下午3:25:16   
 *     
 * @Copyright: 2021 http://www.yanxiuhair.com/ Inc. All rights reserved. 
 * 注意：本内容仅限于许昌妍秀发制品有限公司内部传阅，禁止外泄以及用于其他的商业目
 */
public class MessageUtils {
	/**
	 * 根据消息键和参数 获取消息 委托给spring messageSource
	 *
	 * @param code
	 *            消息键
	 * @param args
	 *            参数
	 * @return 获取国际化翻译值
	 */
	public static String message(String code, Object... args) {
		MessageSource messageSource = SpringUtils.getBean(MessageSource.class);
		return messageSource.getMessage(code, args, LocaleContextHolder.getLocale());
	}
}
