package com.teamproject.service;

import java.sql.Timestamp;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.teamproject.dao.MemberDAO;
import com.teamproject.domain.MemberDTO;

@Service
public class MemberService {
	
	@Inject
	private MemberDAO memberDAO;
	
	
	public void insertMember(MemberDTO memberDTO) {
		System.out.println("MemberService insertMember()");
		
		// 가입날짜
		memberDTO.setJoin_date(new Timestamp(System.currentTimeMillis()));
		
		memberDAO.insertMember(memberDTO);
		
	}


	public MemberDTO userCheck(MemberDTO memberDTO) {
		System.out.println("MemberService userCheck()");
		
		return memberDAO.userCheck(memberDTO);
	}

	
	
	
	
	
	
	
	
	

}
