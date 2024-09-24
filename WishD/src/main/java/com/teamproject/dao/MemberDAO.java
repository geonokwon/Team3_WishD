package com.teamproject.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.teamproject.domain.MemberDTO;
import com.teamproject.domain.SimpleUserDTO;

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
		System.out.println("MemberDAO getMember()");
		return sqlSession.selectOne(namespace + "getMember", id);
	}
	
	// 아이디 중복체크
	public String userIdCheck(String id) {
		System.out.println("MemberDAO userIdCheck()");
		return sqlSession.selectOne(namespace + "userIdCheck", id);
	}

	// 이메일 중복체크
	public String userEmailCheck(String id) {
		System.out.println("MemberDAO userEmailCheck()");
		
		return sqlSession.selectOne(namespace + "userEmailCheck", id);
	}
		
	// 아이디 찾기
	@Transactional
	public MemberDTO idFind(MemberDTO memberDTO) {
		
		System.out.println("MemberDAO idFind()");
		
	      memberDTO = sqlSession.selectOne(namespace + "idFind", memberDTO);
	      if(memberDTO != null) { 
	    	  memberDTO = sqlSession.selectOne(namespace + "idFindResult", memberDTO);
	      }
	      return memberDTO;
	   }
	
	// 비밀번호 찾기
	public MemberDTO passFind(MemberDTO memberDTO) {
		System.out.println("MemberDAO passFind()");
		memberDTO = sqlSession.selectOne(namespace + "passFind", memberDTO);
		if(memberDTO != null) {
			memberDTO = sqlSession.selectOne(namespace+ "passFindResult", memberDTO);
		}
		return memberDTO;
	}
	
	// 네이버 간편로그인
	public void setSimpleUesr(SimpleUserDTO simpleUserDTO) {
		System.out.println("MemberDAO setSimpleUesr()");
		sqlSession.insert(namespace + "setSimpleUesr", simpleUserDTO);

	}

	//간편로그인 회원가입 공통 정보 저장
	public void setSimpleUserInfo(SimpleUserDTO simpleUserDTO) {
		sqlSession.insert(namespace + "setSimpleUserInfo", simpleUserDTO);

	}

	public SimpleUserDTO checkToken(String access_token) {
		System.out.println("MemberDAO CheckToken");
		return sqlSession.selectOne(namespace + "CheckToken", access_token);
		
	}

	

}//클래스
