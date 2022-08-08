package com.yanxiuhair.common.utils;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import com.alibaba.fastjson.JSONObject;
import com.yanxiuhair.common.config.Global;
import com.yanxiuhair.common.constant.Constants;
import com.yanxiuhair.common.utils.http.HttpUtils;

/**
 * @ClassName:  AddressUtils   
 * @Description: 获取地址类 
 * @author: gaoxiaochuang   
 * @date:   2021年7月1日 下午3:21:21   
 *     
 * @Copyright: 2021 http://www.yanxiuhair.com/ Inc. All rights reserved. 
 * 注意：本内容仅限于许昌妍秀发制品有限公司内部传阅，禁止外泄以及用于其他的商业目
 */
public class AddressUtils {
	private static final Logger log = LoggerFactory.getLogger(AddressUtils.class);

	// IP地址查询
	public static final String IP_URL = "http://whois.pconline.com.cn/ipJson.jsp";

	// 未知地址
	public static final String UNKNOWN = "XX XX";

	public static String getRealAddressByIP(String ip) {
		String address = UNKNOWN;
		// 内网不查询
		if (IpUtils.internalIp(ip)) {
			return "内网IP";
		}
		if (Global.isAddressEnabled()) {
			try {
				String rspStr = HttpUtils.sendGet(IP_URL, "ip=" + ip + "&json=true", Constants.GBK);
				if (StringUtils.isEmpty(rspStr)) {
					log.error("获取地理位置异常 {}", ip);
					return UNKNOWN;
				}
				JSONObject obj = JSONObject.parseObject(rspStr);
				String region = obj.getString("pro");
				String city = obj.getString("city");
				return String.format("%s %s", region, city);
			} catch (Exception e) {
				log.error("获取地理位置异常 {}", e);
			}
		}
		return address;
	}
}
