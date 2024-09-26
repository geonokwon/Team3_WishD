package com.teamproject.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.teamproject.domain.CommunityDTO;
import com.teamproject.domain.CommunityPageDTO;
import com.teamproject.domain.CommunityQnaDTO;


@Repository
public class CommunityDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace="com.teamproject.mapper.CommunityMapper";

	//공지사항 글쓰기
	public void insertCommunity(CommunityDTO communityDTO) {
		sqlSession.insert(namespace + ".insertCommunity", communityDTO);
		
	}
	
	//공지사항 목록 불러오기
	public List<CommunityDTO> getCommunityList(CommunityPageDTO communitypageDTO) {
		System.out.println("CommunityDAO getCommunityList()");
		
		return sqlSession.selectList(namespace + ".getCommunityList", communitypageDTO);
	}
	
	//공지사항 상세 페이지
	public CommunityDTO getCommunityById(long ncommunity_num) {
	    return sqlSession.selectOne(namespace + ".getCommunityById", ncommunity_num);
	}

	
	//공지사항 수정하기
	public void updateCommunity(CommunityDTO communityDTO) {
		sqlSession.update(namespace + ".updateCommunity", communityDTO);
	}
	
	//공지사항 삭제하기
	public void deleteCommunity(long ncommunity_num) {
		sqlSession.delete(namespace + ".deleteCommunity", ncommunity_num);
	}
	
	//공지사항 카운트
	public int getCommunityCount(CommunityPageDTO communitypageDTO) {
		System.out.println("CommunityDAO getCommunityCount()");
		return sqlSession.selectOne(namespace + ".getCommunityCount",communitypageDTO);
	}
	
	//질문 쓰기
	public void insertCommunityQna(CommunityQnaDTO communityQnaDTO) {
		sqlSession.insert(namespace + ".insertCommunityQna", communityQnaDTO);
			
	}	
	
	//질문 목록 불러오기
	public List<CommunityQnaDTO> getCommunityQnaList(CommunityPageDTO communitypageDTO) {
		System.out.println("CommunityQnaDAO getCommunityQnaList()");
		
		return sqlSession.selectList(namespace + ".getCommunityQnaList", communitypageDTO);
	}
	
	//질문 상세 페이지
	public CommunityQnaDTO getCommunityQnaById(long qcommunity_num) {
		return sqlSession.selectOne(namespace + ".getCommunityQnaById", qcommunity_num);
	}
	
	//질문 수정하기
	public void updateCommunityQna(CommunityQnaDTO communityQnaDTO) {
		sqlSession.update(namespace + ".updateCommunityQna", communityQnaDTO);
	}
	
	//질문 삭제하기
	public void deleteCommunityQna(long qcommunity_num) {
		sqlSession.delete(namespace + ".deleteCommunityQna", qcommunity_num);
	}
	
	//질문 답변
	public void updateQnaAnswer(long qcommunity_num) {
		sqlSession.update(namespace + ".updateQnaAnswer", qcommunity_num);
		
	}	
	
	//질문 카운트
	public int getCommunityQnaCount(CommunityPageDTO communitypageDTO) {
		System.out.println("CommunityDAO getCommunityQnaCount()");
		return sqlSession.selectOne(namespace + ".getCommunityQnaCount",communitypageDTO);
	}

	//sql에서 user_no 가져와서 반환하기
	public String getUserName(Long user_no) {
		System.out.println("CommunityDAO getUserName()");
		return sqlSession.selectOne(namespace + ".getUserName", user_no);
		
	}


	
}
