//package com.yaolong.study.commons.web;
//
//import com.yaolong.study.commons.constant.OtherConstant;
//import org.springframework.security.core.Authentication;
//import org.springframework.security.core.context.SecurityContextHolder;
//import org.springframework.stereotype.Component;
//
//
///**
// * @program: yaolong-blog
// * @since v1.0.0
// * @description: 登录上下文
// * @author: yaolong
// * @create: 2020-08-13 00:55
// **/
//@Component
//public class LoginContext {
//
//
//    /**
//     * 获取上个下文登录名称
//     * @return
//     */
//    public static Authentication getLoginContext(){
//        return  SecurityContextHolder.getContext().getAuthentication();
//    }
//
//    /**
//     * 获取上下文username如果为anonymousUser则为admin否则为当前的登录用户
//     * @return
//     */
//    public static String getContentName() {
//        return OtherConstant.ANONYMOUS_USER.
//                equals(getLoginContext().getName()) ?
//                OtherConstant.ADMIN : LoginContext.getLoginContext().getName();
//    }
//}
