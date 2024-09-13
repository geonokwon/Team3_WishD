package com.teamproject.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.teamproject.domain.MemberDTO;

@Repository
public class MemberDAO {

	@Inject
	private SqlSession sqlSession;
	
	// sql구문의 전체이름을 변수(String)로 정의
	private static final String namespace = "com.teamproject.mapper.MemberMapper.";
	
	public void insertUser(MemberDTO memberDTO) {
		System.out.println("MemberDAO insertUser()");
		
		// sqlSession.insert(sql구문, 구문에 들어갈 값)
		sqlSession.insert(namespace + "insertUser", memberDTO);
		
	}
	
	public void insertUserInfo(MemberDTO memberDTO) {
		System.out.println("MemberDAO insertUserInfo()");
		
		sqlSession.insert(namespace + "insertUserInfo", memberDTO);
		
		
	}
	
	// 회원체크
	public MemberDTO userCheck(MemberDTO memberDTO) {
		System.out.println("MemberDAO userCheck()");
		return sqlSession.selectOne(namespace + "userCheck", memberDTO);
	}
	
	// 회원 불러오기 
	public MemberDTO getMember(String id) {
		
		return sqlSession.selectOne(namespace + ",getMember", id);
	}

	
	
	
	

}
