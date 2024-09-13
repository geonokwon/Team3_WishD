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
	
	public int getMAxNum() {
		System.out.println("CommunityDAO getMAxNum()");
		return sqlSession.selectOne(namespace + ".getMaxNum");
		
	}
	
	public void insertCommunity(CommunityDTO communityDTO) {
		System.out.println("CommunityDAO insertCommunity()");
		
		sqlSession.insert(namespace + ".insertCommunity", communityDTO);
		
	}
	
}
