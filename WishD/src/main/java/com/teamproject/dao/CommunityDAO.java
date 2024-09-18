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
	
	//질문 쓰기
	public void insertCommunityQna(CommunityQnaDTO communityQnaDTO) {
		sqlSession.insert(namespace + ".insertCommunityQna", communityQnaDTO);
			
	}
		
	
	//질문 목록 불러오기
	public List<CommunityQnaDTO> getCommunityQnaList(CommunityPageDTO communitypageDTO) {
		System.out.println("CommunityQnaDAO getCommunityQnaList()");
		
		return sqlSession.selectList(namespace + ".getCommunityQnaList", communitypageDTO);
	}
	
	//검색어 포함
	public int getCommunityCount(CommunityPageDTO communitypageDTO) {
		System.out.println("CommunityDAO getCommunityCount()");
			
		return sqlSession.selectOne(namespace + ".getCommunityCount",communitypageDTO);
	}	
	
}
