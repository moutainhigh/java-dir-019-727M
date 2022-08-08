package com.yaolong.rbac.jwt.controller;

import cn.hutool.http.HttpUtil;
import com.yaolong.rbac.commons.response.ResponseResult;
import com.yaolong.rbac.commons.utils.MapperUtils;
import lombok.SneakyThrows;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.io.IOException;

/**
 * @program: study-project
 * @description: 测试Controller
 * @author: yaolong
 * @create: 2021-05-23 17:53
 **/
@RestController
@RequestMapping("/eladmin/sys/test")
public class SysEladminTestController {


    @GetMapping("")
    public ResponseResult test(){
        return ResponseResult.success("test");
    }

    @GetMapping("/1")
    public ResponseResult test1(){
        return ResponseResult.success("test1");
    }
    @GetMapping("/2")
    public ResponseResult test2(){
        return ResponseResult.success("test2");
    }
    @SneakyThrows
    @GetMapping("/wxLogin")
    public ResponseResult wxLogin(@RequestParam("code") String code) throws IOException {
        String appId = "wx5300e7910b2dea17";
        String secret = "af77042179c126aff1daae40d3abc79d";
        String url = "https://api.weixin.qq.com/sns/jscode2session?appid="+appId+"&secret="+secret+"&js_code="+code+"&grant_type=authorization_code";
        String s = HttpUtil.get(url);
        return ResponseResult.success(MapperUtils.json2map(s));

    }

}
