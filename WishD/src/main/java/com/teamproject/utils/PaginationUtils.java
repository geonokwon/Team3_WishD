package com.teamproject.utils;

import java.util.logging.Logger;


public class PaginationUtils {
    private static final Logger logger = Logger.getLogger(PaginationUtils.class.getName());

    public static void pagination(PaginationIF pageDTO, int pageNum, int pageSize, int pageBlock){
        logger.info("-> pagination()");

        //pageNum, currentPage, pageSize => 값 저장
        pageDTO.setCurrentPage(pageNum);
        pageDTO.setPageSize(pageSize);
        pageDTO.setPageNum(pageNum + 1);

        //시작하는 페이지 번호 구하기
        int startPage = ((pageNum - 1) / pageBlock) * pageBlock + 1;
        //끝나는 페이지 번호 구하기
        int endPage = startPage + pageBlock - 1;
        //페이지 카운트 구하기
        int pageCount = pageDTO.getCount() / pageBlock + (pageDTO.getCount() % pageBlock == 0 ? 0 : 1);
        if (endPage > pageCount) {
            endPage = pageCount;
        }
        //projectPageDTO 셋팅
        pageDTO.setStartPage(startPage);
        pageDTO.setEndPage(endPage);
        pageDTO.setPageCount(pageCount);
        pageDTO.setPageBlock(pageBlock);

        // 시작하는 행 번호 구하기
        int startRow = (pageNum - 1) * pageSize + 1;
        // 끝나는 행 번호 구하기
        int endRow = startRow + pageSize - 1;
        // DB에 Limit 시작하는 행 번호 - 1, 글 개수 설정
        pageDTO.setStartRow(startRow - 1);
        pageDTO.setEndRow(endRow);
    }
}
