package com.teamproject.utils;

public interface PaginationIF {
    int getCount();
    void setCount(int count);

    int getCurrentPage();
    void setCurrentPage(int currentPage);

    int getPageSize();
    void setPageSize(int pageSize);

    int getPageNum();
    void setPageNum(int pageNum);

    int getStartPage();
    void setStartPage(int startPage);

    int getEndPage();
    void setEndPage(int endPage);

    int getPageCount();
    void setPageCount(int pageCount);

    int getPageBlock();
    void setPageBlock(int pageBlock);

    int getStartRow();
    void setStartRow(int startRow);

    int getEndRow();
    void setEndRow(int endRow);
}
