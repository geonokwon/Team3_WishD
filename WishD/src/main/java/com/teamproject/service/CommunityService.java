package com.teamproject.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.teamproject.dao.CommunityDAO;
import com.teamproject.domain.CommunityDTO;
import com.teamproject.domain.CommunityPageDTO;
import com.teamproject.domain.CommunityQnaDTO;

@Service
public class CommunityService {

	@Inject
	private CommunityDAO communityDAO;
	
	//공지사항 작성
	public void insertCommunity(CommunityDTO communityDTO) {
		System.out.println("CommunityService insertCommunity");
		
		//글 번호
		communityDAO.insertCommunity(communityDTO);
		
	}
	
	//공지사항 목록 가져오기
	public List<CommunityDTO> getCommunityList(CommunityPageDTO communitypageDTO) {
		System.out.println("CommunityService getCommunityList");
		// 시작하는 행번호 구하기  1, 11, 21,...
				
		int startRow = (communitypageDTO.getCurrentPage()-1) * communitypageDTO.getPageSize() + 1;
				
		// 끝나는 행번호 구하기 10 20 30 
		int endRow = startRow + communitypageDTO.getPageSize() - 1;
				
		// pageDTO startRow, endRow 저장
		// limit   시작하는 행번호 - 1, 글개수 
		communitypageDTO.setStartRow(startRow - 1);
		communitypageDTO.setEndRow(endRow);
				
	    return communityDAO.getCommunityList(communitypageDTO);
	}
	
	//공지사항 수정
	public void updateCommunity(CommunityDTO communityDTO) {
		System.out.println("CommunityService updateCommunity");
		communityDAO.updateCommunity(communityDTO);
			
	}
	
	//공지사항 삭제
	public void deleteCommunity(long ncommunity_num) {
		System.out.println("CommunityService deleteCommunity");
		communityDAO.deleteCommunity(ncommunity_num);
			
	}
	
	//공지사항 상세 페이지
	public CommunityDTO getCommunityById(long ncommunity_num) {
	    return communityDAO.getCommunityById(ncommunity_num);
	}

	//공지사항 페이지 카운트
	public int getCommunityCount(CommunityPageDTO communityPageDTO) {
		System.out.println("CommunityService getCommunityCount");
		
		return communityDAO.getCommunityCount(communityPageDTO);
	}
	
	//질문 작성
	public void insertCommunityQna(CommunityQnaDTO communityQnaDTO) {
		System.out.println("CommunityService insertCommunityQna");
			
		//user 이름 가져오기
		
		communityQnaDTO.setUser_name(communityDAO.getUserName(communityQnaDTO.getUser_no()));
		System.out.println(communityQnaDTO.getUser_name());
		//글 번호
		communityDAO.insertCommunityQna(communityQnaDTO);
			
	}
	
	//질문 목록 가져오기
	public List<CommunityQnaDTO> getCommunityQnaList(CommunityPageDTO communitypageDTO) {
		System.out.println("CommunityService getCommunityQnaList");
		
		// 시작하는 행번호 구하기
		int startRow = (communitypageDTO.getCurrentPage()-1) * communitypageDTO.getPageSize() + 1;
				
		// 끝나는 행번호 구하기 10 20 30 
		int endRow = startRow + communitypageDTO.getPageSize() - 1;
				
		// pageDTO startRow, endRow 저장
		// limit   시작하는 행번호 - 1, 글개수 
		communitypageDTO.setStartRow(startRow - 1);
		communitypageDTO.setEndRow(endRow);
				
	    return communityDAO.getCommunityQnaList(communitypageDTO);
	}

	//질문 페이지 카운트
	public int getCommunityQnaCount(CommunityPageDTO communityPageDTO) {
		System.out.println("CommunityService getCommunityQnaCount");
			
		return communityDAO.getCommunityQnaCount(communityPageDTO);
	}
		
	//질문 상세 페이지
	public CommunityQnaDTO getCommunityQnaById(long qcommunity_num) {
	    return communityDAO.getCommunityQnaById(qcommunity_num);
	}
	
	//질문 수정
	public void updateCommunityQna(CommunityQnaDTO communityQnaDTO) {
		System.out.println("CommunityService updateCommunityQna");
		communityDAO.updateCommunityQna(communityQnaDTO);
			
	}
	
	//질문 삭제
	public void deleteCommunityQna(long qcommunity_num) {
		System.out.println("CommunityService deleteCommunityQna");
		communityDAO.deleteCommunityQna(qcommunity_num);
			
	}
	
	//질문 답변
	public void qnaAnswer(long qcommunity_num) {
	    communityDAO.updateQnaAnswer(qcommunity_num);
	}
	
	//
	public String convertNewLines(String input) {
	    if (input != null) {
	        return input.replaceAll("\n", "<br>");
	    }
	    return input;
	}

	
}
