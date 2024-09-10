package com.teamproject.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.teamproject.domain.MemberDTO;

@Repository
public class MyPageDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace="com.teamproject.mapper.MyPageMapper";
	
	// 세션에 저장된 값에 따른 분기
	public MemberDTO getNormalMember(String user_id) {
		return sqlSession.selectOne(namespace + ".getNormalMember", user_id);
	}
	public MemberDTO getSimpleMember(String access_Token) {
		return sqlSession.selectOne(namespace + ".getSimpleMember", access_Token);
	}
	
	public MemberDTO userCheck(MemberDTO memberDTO) {
		return sqlSession.selectOne(namespace + ".userCheck", memberDTO);
	}
	
	public void updateMember(MemberDTO memberDTO) {
		System.out.println("MyPageDAO - updateMember()");
		sqlSession.update(namespace + ".updateMember", memberDTO);
	}

	

	
}
