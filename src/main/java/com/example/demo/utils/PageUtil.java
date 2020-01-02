package com.example.demo.utils;

import java.util.ArrayList;
import java.util.List;

public class PageUtil<T> {
    //当前页数
    private int currentPage;
    //总页￿
    @SuppressWarnings("unused")
    private int totalPage;
    //总记录数
    private int totalCount;
    //每页显示条数
    private int pageSize;
    //每页条数
    @SuppressWarnings("unused")
    private int startRow;
    //当前页显示数￿
    private List<T> list=new ArrayList<T>();

    public int getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(int currentPage) {
        if(currentPage<=0){//如果当前￿=0
            currentPage=1;
        }else if(currentPage>this.getTotalPage()){//如果当前页大于�?页数
            //如果总记录数￿￿
            if(this.getTotalPage()==0){
                currentPage=1;
            }else{//否则将�?页数赋�?给当前页￿
                currentPage=getTotalPage();
            }

        }
        this.currentPage = currentPage;
    }
    public int getTotalPage() {
        //如果总记录数%每页显示条数==0
        if(this.getTotalCount()%this.getPageSize()==0){
            //总页数为 --总记录数/每页显示条数
            return this.getTotalCount()/this.getPageSize();
        }else{
            //否则总页数为--总记录数/每页显示条数+1
            return this.getTotalCount()/this.getPageSize()+1;
        }

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
        if(pageSize<=0){
            pageSize=5;
        }
        this.pageSize = pageSize;
    }
    public int getStartRow() {
        return (this.getCurrentPage()-1)*this.getPageSize();
    }

    public List<T> getList() {
        return list;
    }
    public void setList(List<T> list) {
        this.list = list;
    }

    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }

    public void setStartRow(int startRow) {
        this.startRow = startRow;
    }

}