package com.teamproject.domain;

import java.util.Objects;

public class ProjectPageDTO {
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


    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        ProjectPageDTO that = (ProjectPageDTO) o;
        return pageSize == that.pageSize &&
                pageNum == that.pageNum &&
                currentPage == that.currentPage &&
                startRow == that.startRow &&
                endRow == that.endRow &&
                count == that.count &&
                startPage == that.startPage &&
                endPage == that.endPage &&
                pageCount == that.pageCount &&
                pageBlock == that.pageBlock &&
                Objects.equals(search, that.search) &&
                Objects.equals(skill_id, that.skill_id) &&
                Objects.equals(createdDateFilter, that.createdDateFilter) &&
                Objects.equals(state, that.state);
    }

    @Override
    public int hashCode() {
        return Objects.hash(pageSize, pageNum, currentPage, startRow, endRow, count, startPage, endPage, pageCount, pageBlock, search, skill_id, createdDateFilter, state);
    }



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

    public int getStartPage() {
        return startPage;
    }

    public void setStartPage(int startPage) {
        this.startPage = startPage;
    }

    public int getEndPage() {
        return endPage;
    }

    public void setEndPage(int endPage) {
        this.endPage = endPage;
    }

    public int getPageCount() {
        return pageCount;
    }

    public void setPageCount(int pageCount) {
        this.pageCount = pageCount;
    }

    public int getPageBlock() {
        return pageBlock;
    }

    public void setPageBlock(int pageBlock) {
        this.pageBlock = pageBlock;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public int getStartRow() {
        return startRow;
    }

    public void setStartRow(int startRow) {
        this.startRow = startRow;
    }

    public int getEndRow() {
        return endRow;
    }

    public void setEndRow(int endRow) {
        this.endRow = endRow;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getPageNum() {
        return pageNum;
    }

    public void setPageNum(int pageNum) {
        this.pageNum = pageNum;
    }

    public int getCurrentPage() {
        return currentPage;
    }

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
