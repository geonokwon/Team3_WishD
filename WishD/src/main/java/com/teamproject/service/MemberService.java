package com.teamproject.service;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.teamproject.dao.MemberDAO;
import com.teamproject.domain.MemberDTO;
import com.teamproject.domain.SimpleUserDTO;

@Service
public class MemberService {
	
	@Inject
	private MemberDAO memberDAO;
	
	// 회원가입
	@Transactional
	public void insertMember(MemberDTO memberDTO) {
		System.out.println("MemberService insertMember()");
		
		//user_info 통합 테이블 저장 후 user_no 값 반환
		memberDAO.insertUserInfo(memberDTO);
		System.out.println(memberDTO.toString());
		
		//user_no 값 가지고 일반회원 테이블 저장
		memberDAO.insertUser(memberDTO);
		
	}

	// 회원체크
	public MemberDTO userCheck(MemberDTO memberDTO) {
		System.out.println("MemberService userCheck()");
		return memberDAO.userCheck(memberDTO);
	}

	// 회원 불러오기 
	public MemberDTO getMember(Long user_no) {
		System.out.println("MemberService getMember()");
		
		return memberDAO.getMember(user_no);
	}

	// 아이디 중복체크
	public String userIdCheck(String id) {
		System.out.println("MemberService userIdCheck()");
		return memberDAO.userIdCheck(id);
	}

	// 이메일 중복체크
	public String userEmailCheck(String id) {
		System.out.println("MemberService userEmailCheck()");
		return memberDAO.userEmailCheck(id);
		
	}
	
		
	// 아이디 찾기
	@Transactional
	public MemberDTO idFind(MemberDTO memberDTO) {
		System.out.println("MemberService idFind()");
		return memberDAO.idFind(memberDTO);
	}
	
	// 비밀번호 찾기
	@Transactional
	public MemberDTO passFind(MemberDTO memberDTO) {
		System.out.println("MemberService passFind()");
		return memberDAO.passFind(memberDTO);
	}
	
	//네이버 간편 로그인
	@Transactional
	public void setSimpleUesr(SimpleUserDTO simpleUserDTO) {
		System.out.println("MemberService setSimpleUesr()");

		//간편로그인 회원가입 공통 정보 저장
		memberDAO.setSimpleUserInfo(simpleUserDTO);
		System.out.println(simpleUserDTO.getUser_no());

		memberDAO.setSimpleUesr(simpleUserDTO);
	}

	//간편로그인시 이메일로 DB에서 사용자 조회 => 있으면 로그인 처리
	public SimpleUserDTO checkToken(String access_token) {
		System.out.println("MemberService CheckToken()");
		return memberDAO.checkToken(access_token);
	}

	
	
	
	
	
	
	
	
	

}
