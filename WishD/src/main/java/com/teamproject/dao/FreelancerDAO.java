package com.teamproject.dao;


import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;


import com.teamproject.domain.FreelancerDTO;
@Repository
public class FreelancerDAO {
	
	//마이바티스 객체생성
	@Inject
	private SqlSession sqlSession;

	public void registFreelancer(FreelancerDTO freelancerDTO) {
		
		System.out.println("DAO regist");
		
		
	}

}
