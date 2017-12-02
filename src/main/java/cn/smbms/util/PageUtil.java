package cn.smbms.util;

import java.util.List;

public class PageUtil<T> {
    private Integer pageIndex; //当前页
    private Integer pageSize;   //每页显示几条数据
    private Integer totalRecords;//总记录数  数据库有多少条数据
    private Integer totalPages;//总页数=总记录除以每页数量
    private List<T> list;

    public Integer getPageIndex() {
        return pageIndex;
    }

    public void setPageIndex(Integer pageIndex) {
        this.pageIndex = pageIndex;
    }

    public Integer getPageSize() {
        return pageSize;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }

    public Integer getTotalRecords() {
        return totalRecords;
    }

    public void setTotalRecords(Integer totalRecords) {
        this.totalRecords = totalRecords;
    }

    public Integer getTotalPages() {
        return totalPages;
    }

    public void setTotalPages(Integer totalPages) {
        this.totalPages = totalPages;
    }

    public List<T> getList() {
        return list;
    }

    public void setList(List<T> list) {
        this.list = list;
    }

    @Override
    public String toString() {
        return "PageUtil{" +
                "pageIndex=" + pageIndex +
                ", pageSize=" + pageSize +
                ", totalRecords=" + totalRecords +
                ", totalPages=" + totalPages +
                ", list=" + list +
                '}';
    }
}
