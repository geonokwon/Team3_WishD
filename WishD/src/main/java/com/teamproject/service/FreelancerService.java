package com.teamproject.service;

import java.sql.Timestamp;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.teamproject.dao.FreelancerDAO;
import com.teamproject.domain.FreelancerDTO;

@Service
public class FreelancerService {

	@Inject
	private FreelancerDAO freelancerDAO;
	
	//프리랜서 등록
	public void registFreelancer(FreelancerDTO freelancerDTO) {
		System.out.println("service RegPro");
		
		//현재 시간 변수에 저장
		Timestamp timestamp = new Timestamp(System.currentTimeMillis());
		//가입날짜 설정
		freelancerDTO.setFreelancer_date(timestamp);
		//최종수정날짜 설정
		freelancerDTO.setFreelancer_update(timestamp);
		
		freelancerDAO.registFreelancer(freelancerDTO);
		
	}//프리랜서 등록
	
	
	
	

}
