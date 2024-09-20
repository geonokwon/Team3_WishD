package com.teamproject.domain;

public class MyProjectPageDTO {
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
    //프로젝트 글상태
    private String projectStatus;
    // 내가쓴글 가져오는 용도
    private Long user_no;
    // 내가 신청한글
	private String request_project;
    
	
	
    public String getRequest_project() {
		return request_project;
	}

	public void setRequest_project(String request_project) {
		this.request_project = request_project;
	}

	public String getProjectStatus() {
		return projectStatus;
	}

	public void setProjectStatus(String projectStatus) {
		this.projectStatus = projectStatus;
	}

	public Long getUser_no() {
		return user_no;
	}

	public void setUser_no(Long user_no) {
		this.user_no = user_no;
	}

	public Integer getCreatedDateFilter() {
        return createdDateFilter;
    }

    public void setCreatedDateFilter(Integer createdDateFilter) {
        this.createdDateFilter = createdDateFilter;
    }

    //날짜별 필터
    private Integer createdDateFilter;

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
}
