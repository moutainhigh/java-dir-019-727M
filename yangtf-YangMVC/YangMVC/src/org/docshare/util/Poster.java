/**
 * Copyright 2008 YangTongfeng
 *
 * Permission is hereby granted, free of charge, to any person obtaining a 
 * copy of this software and associated documentation files (the "Software")
 * , to deal in the Software without restriction, including without limitation 
 * the rights to use, copy, modify, merge, publish, distribute, sublicense, 
 * and/or sell copies of the Software, and to permit persons to whom the 
 * Software is furnished to do so, subject to the following conditions:
 * The above copyright notice and this permission notice shall be included
 * in all copies or substantial portions of the Software.

 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, 
 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES 
 * OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
 * IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY 
 * CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, 
 * TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE 
 * SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */
package org.docshare.util;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.PrintStream;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.InetSocketAddress;
import java.net.Proxy;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.docshare.log.Log;

import com.alibaba.fastjson.JSON;



public class Poster {
	public static String doPostJSON(String url,Object params, String token) {
		String pp=JSON.toJSONString(params);
		try {
			return doPost(url, pp,token);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	public static String doPost(String url, Map<String, Object> params) {
		try {
			return doPost(url, params,null);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	static final boolean useProxy = false;
	public static String doPost(String url,String params,String token) throws Exception {
		// ??????????????????
        
        URL restURL = new URL(url);
        
        Log.d("?????????"+url);
        int t= 0;//????????????????????????
        while(t<1) {
            try {
                /*
                 * ?????????urlConnection????????????????????????URL???????????????(?????????http)?????????URLConnection???
                 * ?????????HttpURLConnection
                 */
            	HttpURLConnection conn=null;
            	if(useProxy){
	            	InetSocketAddress addr = new InetSocketAddress("127.0.0.1",8080);  
	                Proxy proxy = new Proxy(Proxy.Type.HTTP, addr);
	                conn = (HttpURLConnection) restURL.openConnection(proxy);
            	}else{
            		conn = (HttpURLConnection) restURL.openConnection();
            	}
//                conn.setConnectTimeout(5000);
//                conn.setReadTimeout(5000);
                // ????????????
                conn.setRequestMethod("POST");
                // ???????????????httpUrlConnection???????????????????????????true; httpUrlConnection.setDoInput(true);
                conn.setDoOutput(true);
                // allowUserInteraction ????????? true??????????????????????????????????????????????????????????????????????????????????????? URL ???????????????
                conn.setAllowUserInteraction(false);
                conn.addRequestProperty("Content-Type", "application/json;charset=utf-8");
                if(token!=null){
                	conn.addRequestProperty("token", token);
                	conn.addRequestProperty("Cookie", "JSESSIONID="+ token);
                }

                PrintStream ps = new PrintStream(conn.getOutputStream());
                ps.print(params);

                ps.close();

                BufferedReader bReader = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));

                String line, resultStr = "";

                while (null != (line = bReader.readLine())) {
                    resultStr += line;
                }
                System.out.println(resultStr);
                bReader.close();

                return resultStr;
            } catch (Exception e) {
                t++;
                Log.e("=======>????????????(requset error )???" + t);
                e.printStackTrace();
            }
        }
        
        throw new Exception("????????????,???????????????");

    }
    
    /**
     * ??????????????????
     * 
     * @param parameters
     * @return
     * @throws UnsupportedEncodingException
     */
    public static String paramsConvert(Map<String, Object> parameters) throws UnsupportedEncodingException {
        StringBuffer sb = new StringBuffer();// ??????????????????
        // ??????????????????
        for (String name : parameters.keySet()) {
            Object object = parameters.get(name);
            Log.d("?????????"+object.getClass());
            if(object instanceof Integer) {
                sb.append(name).append("=").append(java.net.URLEncoder.encode((String)object, "UTF-8"))
                .append("&");
            }else if(object instanceof Date) {
                Calendar cal = Calendar.getInstance();
                cal.setTime((Date)object);
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                sb.append(name).append("=").append(java.net.URLEncoder.encode(sdf.format(cal.getTime()), "UTF-8"))
                .append("&");
            }else{
                if(object.getClass().isArray()) {//??????????????????????????????
                    String[] values = (String[])object;
                    for(String va : values) {
                        sb.append(name).append("=").append(java.net.URLEncoder.encode((String) va, "UTF-8"))
                        .append("&");
                    }
                }else {
                    sb.append(name).append("=").append(java.net.URLEncoder.encode(""+parameters.get(name), "UTF-8"))
                    .append("&");
                }
            }
        }
        return sb.toString().substring(0, sb.toString().length()-1);
	}    
    
    public static String doPost(String url, Map<String, Object> parameters,String token) throws Exception {
        String params = paramsConvert(parameters);
        Log.d("?????????"+params.toString());
        return doPost(url, params,token);
    }
    
    public static void main(String[] args) throws Exception {
    	Map<String,String> map = new HashMap<>();
    	map.put("loginName"	, "admin");
    	map.put("password", "123456");
    	//Log.i(Poster.doPostJSON("http://localhost:8001/shiro-api/login", map,null));
    	String token = "15D1821DFC4851E0E67C85D5335A68BA";
    	Log.i(Poster.doPostJSON("http://localhost:8001/shiro-api/check?token="+token,"",token));
    }
}