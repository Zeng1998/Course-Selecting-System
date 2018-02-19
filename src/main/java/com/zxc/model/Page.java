package com.zxc.model;

import java.util.List;

public class Page {
    private int currentPage;//当前页
    private int pageSize;//每页显示记录条数
    private int totalPage;//总页数
    private List<?> dataList;//每页显示的数据
    private int star;//开始数据

    public int getCurrentPage() {
        return currentPage;
    }
    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }
    public int getPageSize() {
        return pageSize;
    }
    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }
    public int getTotalPage() {
        return totalPage;
    }
    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }
    public List<?> getDataList() {
        return dataList;
    }
    public void setDataList(List<?> dataList) {
        this.dataList = dataList;
    }
    public int getStar() {
        return star;
    }
    public void setStar(int star) {
        this.star = star;
    }
}
