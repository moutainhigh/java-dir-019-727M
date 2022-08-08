package com.yaolong.rbac.jwt;

import com.yaolong.rbac.jwt.domain.SysMenuResourceVben;
import com.yaolong.rbac.jwt.vo.MenuParams;

/**
 * @author yaolong
 * @version V1.0.0
 * @program study-mybatis-generator
 * @description
 * @create 2021-08-06 16:49
 **/
public class Test {
        public static void main(String[] args) throws IllegalAccessException {
        MenuParams menuParams = new MenuParams();
        menuParams.setCaseSensitive(false);
        menuParams.setParentId(1L);
        menuParams.setComponent("layout");
        menuParams.setId(1L);
        menuParams.setMetaId(1L);
        menuParams.setCarryParam(false);
        menuParams.setAffix(true);
        menuParams.setHideBreadcrumb(true);
        menuParams.setHideMenu(true);
        new SysMenuResourceVben(menuParams);
//        System.out.println(MapperUtils.copy(menuParams,new StudyMenuResourceVben()));
//        System.out.println(MapperUtils.copy(menuParams,new StudyMenuMeta()));
//        System.out.println(ObjectUtil.isNull(menuParams));
//        System.out.println(ObjectTool.checkObjFieldIsNull(menuParams));
    }
}
