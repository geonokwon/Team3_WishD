package com.teamproject.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.teamproject.domain.CommunityDTO;

@Repository
public class CommunityDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace="com.itwillbs.mapper.CommunityMapper";

	public void insertCommunity(CommunityDTO communityDTO) {
		sqlSession.insert(namespace + ".insertCommunity", communityDTO);
		
	}
	

	
}
