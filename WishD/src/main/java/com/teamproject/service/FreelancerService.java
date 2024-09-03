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
	
	public void registFreelancer(FreelancerDTO freelancerDTO) {
		System.out.println("service RegPro");
		
		//가입날짜
//		freelancerDTO.setFreelancer_date(new Timestamp(System.currentTimeMillis()));
		freelancerDAO.registFreelancer(freelancerDTO);
	}

}
