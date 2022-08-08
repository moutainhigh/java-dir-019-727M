package com.yaolong.rbac.jwt.controller.vue3VbenAdmin;

import com.yaolong.rbac.commons.response.ResponseResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author yaolong
 * @version V1.0.0
 * @program RBAC-Template
 * @description 测试
 * @create 2021-08-14 13:43
 **/
@RestController
@RequestMapping("/vbenadmin/test")
public class SysVbenadminTestController {

    /**
     * @description TODO
     * @author yaolong
     * @date 2021/8/14 13:45
     * @version v1.0.0
     */

    @GetMapping("/test1")
    public ResponseResult test(){
        return ResponseResult.success("成功");
    }


    @GetMapping("/test2")
    public ResponseResult test2(){
        return ResponseResult.success("成功");
    }

    @GetMapping("/test9")
    public ResponseResult test9(){
        return ResponseResult.success("成功");
    }
}
