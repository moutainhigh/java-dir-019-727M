package org.yaukie.frame.util;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import org.springframework.util.ResourceUtils;

import java.io.*;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

public class FileIoUtil {

     public static void writeSth() throws FileNotFoundException {
        String path = System.getProperty("user.dir")+"/config/trial.properties";
        File file = new File(path) ;
        FileOutputStream fileOutputStream = null;
        try {
            fileOutputStream = new FileOutputStream(file);
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMdd HH:mm:ss") ;
            String startUpDate = simpleDateFormat.format(new Date());
            //将日期加密处理
            Map dataMap = new HashMap();
            dataMap.put("smart_kettle_trial_key", startUpDate);
            String compact = Jwts.builder().setClaims(dataMap)
                    .signWith(SignatureAlgorithm.HS512, "weareflmiy009++")
                    .compact();
            byte[] bytes = compact.getBytes() ;
            fileOutputStream.write(bytes);
            fileOutputStream.close();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    public static String readSth(){
        String path = System.getProperty("user.dir")+"/config/trial.properties";
        File file = new File(path) ;
        FileReader fileReader = null;
        StringBuilder sb = new StringBuilder() ;
        try {
            fileReader = new FileReader(file);
            char[] chars = new char[20] ;
            int len = 0 ;

            while ((len = fileReader.read(chars))>0)
            {
                String str = new String(chars,0,len) ;
                sb.append(str) ;
            }
            fileReader.close();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        //将取出的加密串进行解密处理
        String date="" ;
        if(!sb.toString().equals("")){
            Claims body = Jwts.parser()
                    .setSigningKey("weareflmiy009++")
                    .parseClaimsJws(sb.toString())
                    .getBody();
              date = body.get("smart_kettle_trial_key")+"";
        }

        return  date ;
    }

}
