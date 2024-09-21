package com.teamproject.domain;

import com.teamproject.utils.PaginationIF;

public class ProjectPageDTO implements PaginationIF {
    private int pageSize;
    private int pageNum;
    private int currentPage;

    private int startRow;
    private int endRow;

    private int count;

    private int startPage;
    private int endPage;
    private int pageCount;
    private int pageBlock;

    //검색어
    private String search;
    //스킬 id
    private Integer skill_id;
    //날짜별 필터
    private Integer createdDateFilter;
    //진행중 , 모집중 모아보기
    private Integer state;



    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public Integer getCreatedDateFilter() {
        return createdDateFilter;
    }

    public void setCreatedDateFilter(Integer createdDateFilter) {
        this.createdDateFilter = createdDateFilter;
    }

    public Integer getSkill_id() {
        return skill_id;
    }

    public void setSkill_id(Integer skill_id) {
        this.skill_id = skill_id;
    }

    public String getSearch() {
        return search;
    }

    public void setSearch(String search) {
        this.search = search;
    }

    @Override
    public int getStartPage() {
        return startPage;
    }

    @Override
    public void setStartPage(int startPage) {
        this.startPage = startPage;
    }

    @Override
    public int getEndPage() {
        return endPage;
    }

    @Override
    public void setEndPage(int endPage) {
        this.endPage = endPage;
    }

    @Override
    public int getPageCount() {
        return pageCount;
    }

    @Override
    public void setPageCount(int pageCount) {
        this.pageCount = pageCount;
    }

    @Override
    public int getPageBlock() {
        return pageBlock;
    }

    @Override
    public void setPageBlock(int pageBlock) {
        this.pageBlock = pageBlock;
    }

    @Override
    public int getCount() {
        return count;
    }

    @Override
    public void setCount(int count) {
        this.count = count;
    }

    @Override
    public int getStartRow() {
        return startRow;
    }

    @Override
    public void setStartRow(int startRow) {
        this.startRow = startRow;
    }

    @Override
    public int getEndRow() {
        return endRow;
    }

    @Override
    public void setEndRow(int endRow) {
        this.endRow = endRow;
    }

    @Override
    public int getPageSize() {
        return pageSize;
    }

    @Override
    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    @Override
    public int getPageNum() {
        return pageNum;
    }

    @Override
    public void setPageNum(int pageNum) {
        this.pageNum = pageNum;
    }

    @Override
    public int getCurrentPage() {
        return currentPage;
    }

    @Override
    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }

    @Override
    public String toString() {
        return "ProjectPageDTO{" +
                "pageSize=" + pageSize +
                ", pageNum=" + pageNum +
                ", currentPage=" + currentPage +
                ", startRow=" + startRow +
                ", endRow=" + endRow +
                ", count=" + count +
                ", startPage=" + startPage +
                ", endPage=" + endPage +
                ", pageCount=" + pageCount +
                ", pageBlock=" + pageBlock +
                ", search='" + search + '\'' +
                ", skill_id=" + skill_id +
                ", createdDateFilter=" + createdDateFilter +
                '}';
    }
}
