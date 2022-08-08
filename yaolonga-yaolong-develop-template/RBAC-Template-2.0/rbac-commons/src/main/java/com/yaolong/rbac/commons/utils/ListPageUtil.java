package com.yaolong.rbac.commons.utils;
import lombok.Data;
import lombok.experimental.Accessors;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 * @program: yaolong-blog
 * @description: 手动分页工具
 * @author: yaolong
 * @create: 2020-10-15 22:36
 **/
@Data
@Accessors(chain = true)
public class ListPageUtil<T> {
    /**原集合*/
    private List<T> records;

    /** 上一页 */
    private Integer lastPage;

    /** 当前页 */
    private Integer current;

    /** 下一页 */
    private Integer nextPage;

    /** 每页条数 */
    private Integer size;

    /** 总条数 */
    private Integer total;

    /** 总数据页数 */
    private Integer pages;

    public ListPageUtil(List<T> records, Integer current, Integer size) {
        if (records == null || records.isEmpty()) {
            this.records = new ArrayList<>();
        }

        this.records = records;
        this.size = size;
        /*this.total = records.size()/size;
        if(records.size()%size!=0){
            this.total++;
        }*/

        this.current = current;
        this.total = records.size();
        this.pages = (total + size - 1) / size;
        this.lastPage = Math.max(current - 1, 1);
        this.nextPage = current>=pages? pages: current + 1;

    }

    /**
     * 得到分页后的数据
     *
     * @return 分页后结果
     */
    public List<T> getPagedList() {
        int fromIndex = (current - 1) * size;
        if (fromIndex >= records.size()) {
            //空数组
            return Collections.emptyList();
        }
        if(fromIndex<0){
            //空数组
            return Collections.emptyList();
        }
        int toIndex = current * size;
        if (toIndex >= records.size()) {
            toIndex = records.size();
        }
        return records.subList(fromIndex, toIndex);
    }

}
