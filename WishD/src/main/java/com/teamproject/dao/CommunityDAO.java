package com.teamproject.dao;



import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.PageDTO;
import com.teamproject.domain.CommunityDTO;
import com.teamproject.domain.CommunityPageDTO;

@Repository
public class CommunityDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace="com.teamproject.mapper.CommunityMapper";

	public void insertCommunity(CommunityDTO communityDTO) {
		sqlSession.insert(namespace + ".insertCommunity", communityDTO);
		
	}
	
	public List<CommunityDTO> getCommunityList(CommunityPageDTO communitypageDTO) {
		System.out.println("CommunityDAO getCommunityList()");
		
		return sqlSession.selectList(namespace + ".getCommunityList", communitypageDTO);
	}
	
	//검색어 포함
	public int getCommunityCount(CommunityPageDTO communitypageDTO) {
		System.out.println("CommunityDAO getCommunityCount()");
			
		return sqlSession.selectOne(namespace + ".getCommunityCount",communitypageDTO);
	}	
	
}
