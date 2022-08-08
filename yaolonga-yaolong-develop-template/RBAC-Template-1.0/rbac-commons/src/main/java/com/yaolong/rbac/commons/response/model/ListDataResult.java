package com.yaolong.rbac.commons.response.model;

import lombok.Data;

import java.util.List;

/**
 * @author yaolong
 * @version V1.0.0
 * @program study-mybatis-generator
 * @description 列表返回格式
 * @create 2021-08-05 10:32
 **/
@Data
public class ListDataResult<T> {
    List<T> items;
    Integer total;

   public ListDataResult(List<T> items) {
        this.items = items;
        this.total = items.size();
    }

   public ListDataResult() {

    }
}
