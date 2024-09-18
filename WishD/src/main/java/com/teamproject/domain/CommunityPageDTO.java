package com.teamproject.domain;

public class CommunityPageDTO {

	 private int pageSize;
	    private String pageNum;
	    private int currentPage;

	    private int startRow;
	    private int endRow;

	    private int count;

	    private int startPage;
	    private int endPage;
	    private int pageCount;
	    private int pageBlock;
	    private long user_no;
	    
	    public long getUser_no() {
			return user_no;
		}

		public void setUser_no(long user_no) {
			this.user_no = user_no;
		}

		private String search;

		public int getPageSize() {
			return pageSize;
		}

		public void setPageSize(int pageSize) {
			this.pageSize = pageSize;
		}

		public String getPageNum() {
			return pageNum;
		}

		public void setPageNum(String pageNum) {
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
	    
	   
	    
}
