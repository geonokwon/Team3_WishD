package com.teamproject.wishd.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.teamproject.wishd.domain.MemberDTO;

@Repository
public class MyPageDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace="com.teamproject.wishd.mapper.MyPageMapper";
	
	public MemberDTO getMember(String user_no) {
		return sqlSession.selectOne(namespace + ".getMember", user_no);
	}

	public MemberDTO userCheck(MemberDTO memberDTO) {
		return sqlSession.selectOne(namespace + ".userCheck", memberDTO);
	}
	
	public void updateMember(MemberDTO memberDTO) {
		System.out.println("MyPageDAO - updateMember()");
		sqlSession.update(namespace + ".updateMember", memberDTO);
	}
}
