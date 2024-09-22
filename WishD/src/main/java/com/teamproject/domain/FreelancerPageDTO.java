package com.teamproject.domain;

import com.teamproject.utils.PaginationIF;

public class FreelancerPageDTO implements PaginationIF{
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
    //진행중 , 구직중 모아보기
    private Integer state;
    
    
    private Long user_no;
    private String freelancerSearch;
    private String freelancerStatus;
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
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
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
	public String getSearch() {
		return search;
	}
	public void setSearch(String search) {
		this.search = search;
	}
	public Integer getSkill_id() {
		return skill_id;
	}
	public void setSkill_id(Integer skill_id) {
		this.skill_id = skill_id;
	}
	public Integer getCreatedDateFilter() {
		return createdDateFilter;
	}
	public void setCreatedDateFilter(Integer createdDateFilter) {
		this.createdDateFilter = createdDateFilter;
	}
	public Integer getState() {
		return state;
	}
	public void setState(Integer state) {
		this.state = state;
	}
	public Long getUser_no() {
		return user_no;
	}
	public void setUser_no(Long user_no) {
		this.user_no = user_no;
	}
	public String getFreelancerSearch() {
		return freelancerSearch;
	}
	public void setFreelancerSearch(String freelancerSearch) {
		this.freelancerSearch = freelancerSearch;
	}
	public String getFreelancerStatus() {
		return freelancerStatus;
	}
	public void setFreelancerStatus(String freelancerStatus) {
		this.freelancerStatus = freelancerStatus;
	}
    
    
    

}