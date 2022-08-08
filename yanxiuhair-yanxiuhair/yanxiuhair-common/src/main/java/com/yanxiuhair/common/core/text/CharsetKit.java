package com.yanxiuhair.common.core.text;

import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import com.yanxiuhair.common.utils.StringUtils;

/**
 * @ClassName:  CharsetKit   
 * @Description: 字符集工具类   
 * @author: gaoxiaochuang   
 * @date:   2021年7月1日 下午2:56:19   
 *     
 * @Copyright: 2021 http://www.yanxiuhair.com/ Inc. All rights reserved. 
 * 注意：本内容仅限于许昌妍秀发制品有限公司内部传阅，禁止外泄以及用于其他的商业目
 */
public class CharsetKit {
	/** ISO-8859-1 */
	public static final String ISO_8859_1 = "ISO-8859-1";
	/** UTF-8 */
	public static final String UTF_8 = "UTF-8";
	/** GBK */
	public static final String GBK = "GBK";

	/** ISO-8859-1 */
	public static final Charset CHARSET_ISO_8859_1 = Charset.forName(ISO_8859_1);
	/** UTF-8 */
	public static final Charset CHARSET_UTF_8 = Charset.forName(UTF_8);
	/** GBK */
	public static final Charset CHARSET_GBK = Charset.forName(GBK);

	/**
	 * 转换为Charset对象
	 * 
	 * @param charset
	 *            字符集，为空则返回默认字符集
	 * @return Charset
	 */
	public static Charset charset(String charset) {
		return StringUtils.isEmpty(charset) ? Charset.defaultCharset() : Charset.forName(charset);
	}

	/**
	 * 转换字符串的字符集编码
	 * 
	 * @param source
	 *            字符串
	 * @param srcCharset
	 *            源字符集，默认ISO-8859-1
	 * @param destCharset
	 *            目标字符集，默认UTF-8
	 * @return 转换后的字符集
	 */
	public static String convert(String source, String srcCharset, String destCharset) {
		return convert(source, Charset.forName(srcCharset), Charset.forName(destCharset));
	}

	/**
	 * 转换字符串的字符集编码
	 * 
	 * @param source
	 *            字符串
	 * @param srcCharset
	 *            源字符集，默认ISO-8859-1
	 * @param destCharset
	 *            目标字符集，默认UTF-8
	 * @return 转换后的字符集
	 */
	public static String convert(String source, Charset srcCharset, Charset destCharset) {
		if (null == srcCharset) {
			srcCharset = StandardCharsets.ISO_8859_1;
		}

		if (null == destCharset) {
			destCharset = StandardCharsets.UTF_8;
		}

		if (StringUtils.isEmpty(source) || srcCharset.equals(destCharset)) {
			return source;
		}
		return new String(source.getBytes(srcCharset), destCharset);
	}

	/**
	 * @return 系统字符集编码
	 */
	public static String systemCharset() {
		return Charset.defaultCharset().name();
	}
}
