package com.teamproject.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.teamproject.dao.MyPageDAO;
import com.teamproject.domain.MemberDTO;

@Service
public class MyPageService {

	@Inject
	private MyPageDAO myPageDAO;

	public MemberDTO getNormalMember(String user_id) {
		return myPageDAO.getNormalMember(user_id);
	}
	public MemberDTO getSimpleMember(String access_Token) {
		return myPageDAO.getSimpleMember(access_Token);
	}
	
	public MemberDTO userCheck(MemberDTO memberDTO) {
		return myPageDAO.userCheck(memberDTO);	
	}
	
	public void updateMember(MemberDTO memberDTO) {
		System.out.println("MyPageService - updateMember()");
		myPageDAO.updateMember(memberDTO);
	}
	

	
	

	

}
