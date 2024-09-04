package com.teamproject.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.teamproject.dao.MyPageDAO;
import com.teamproject.domain.MemberDTO;

@Service
public class MyPageService {

	@Inject
	private MyPageDAO myPageDAO;
	
	public MemberDTO getMember(String user_no) {
		return myPageDAO.getMember(user_no);		
	}
	
	public MemberDTO userCheck(MemberDTO memberDTO) {
		return myPageDAO.userCheck(memberDTO);		
	}
	
	public void updateMember(MemberDTO memberDTO) {
		System.out.println("MyPageService - updateMember()");
		myPageDAO.updateMember(memberDTO);
	}

	

	

}
