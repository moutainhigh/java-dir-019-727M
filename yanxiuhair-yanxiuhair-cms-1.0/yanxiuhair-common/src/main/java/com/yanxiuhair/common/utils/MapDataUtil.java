package com.yanxiuhair.common.utils;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import javax.servlet.http.HttpServletRequest;

/**
 * @ClassName:  MapDataUtil   
 * @Description: Map通用处理方法 
 * @author: gaoxiaochuang   
 * @date:   2021年7月1日 下午3:24:58   
 *     
 * @Copyright: 2021 http://www.yanxiuhair.com/ Inc. All rights reserved. 
 * 注意：本内容仅限于许昌妍秀发制品有限公司内部传阅，禁止外泄以及用于其他的商业目
 */
public class MapDataUtil {
	public static Map<String, Object> convertDataMap(HttpServletRequest request) {
		Map<String, String[]> properties = request.getParameterMap();
		Map<String, Object> returnMap = new HashMap<String, Object>();
		Iterator<?> entries = properties.entrySet().iterator();
		Map.Entry<?, ?> entry;
		String name = "";
		String value = "";
		while (entries.hasNext()) {
			entry = (Entry<?, ?>) entries.next();
			name = (String) entry.getKey();
			Object valueObj = entry.getValue();
			if (null == valueObj) {
				value = "";
			} else if (valueObj instanceof String[]) {
				String[] values = (String[]) valueObj;
				value = "";
				for (int i = 0; i < values.length; i++) {
					value += values[i] + ",";
				}
				if (value.length() > 0) {
					value = value.substring(0, value.length() - 1);
				}
			} else {
				value = valueObj.toString();
			}
			returnMap.put(name, value);
		}
		return returnMap;
	}
}
