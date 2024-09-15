package com.teamproject.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.teamproject.dao.MemberDAO;
import com.teamproject.domain.MemberDTO;

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
	public MemberDTO getMember(String user_id) {
		System.out.println("MemberService getMember()");
		
		return memberDAO.getMember(user_id);
	}

	// 아이디 찾기
	@Transactional
	public MemberDTO idFind(MemberDTO memberDTO) {
		return memberDAO.idFind(memberDTO);
	}
	
	// 비밀번호 찾기
	@Transactional
	public MemberDTO passFind(MemberDTO memberDTO) {
		return memberDAO.passFind(memberDTO);
	}


	
	
	
	
	
	
	
	
	

}
