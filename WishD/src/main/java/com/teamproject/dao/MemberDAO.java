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
	private static final String namespace = "com.teamproject.mapper.MemberMapper";
	
	public void insertMember(MemberDTO memberDTO) {
		System.out.println("MemberDAO insertMember()");
		
		// sqlSession.insert(sql구문, 구문에 들어갈 값)
		sqlSession.insert(namespace + ".insertMember", memberDTO);
		
		
	}
	
	// 회원체크
	public MemberDTO userCheck(MemberDTO memberDTO) {
		System.out.println("MemberDAO userCheck()");
		return sqlSession.selectOne(namespace + ", userCheck", memberDTO);
	}

	
	
	
	

}
