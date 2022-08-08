package shop.yaojianfeng.study.jspServlet.jeffDemo.common.entity;

import java.util.ArrayList;

/**
 * 分页对象
 * @author yaojianfeng
 */
public class MyPage<T> {
    private int totalCount;
    private int pageSize;
    private int pageNumber;
    private ArrayList<T> pageDataList;

    public MyPage(int totalCount, int pageSize, int pageNumber, ArrayList<T> pageDataList) {
        this.totalCount = totalCount;
        this.pageSize = pageSize;
        this.pageNumber = pageNumber;
        this.pageDataList = pageDataList;
    }

    public MyPage() {
    }

    public int getTotalCount() {
        return totalCount;
    }

    public void setTotalCount(int totalCount) {
        this.totalCount = totalCount;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getPageNumber() {
        return pageNumber;
    }

    public void setPageNumber(int pageNumber) {
        this.pageNumber = pageNumber;
    }

    public ArrayList<T> getPageDataList() {
        return pageDataList;
    }

    public void setPageDataList(ArrayList<T> pageDataList) {
        this.pageDataList = pageDataList;
    }
}
