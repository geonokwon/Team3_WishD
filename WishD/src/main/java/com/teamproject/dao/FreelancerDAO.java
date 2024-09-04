package com.teamproject.dao;


import javax.inject.Inject;


import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;



import com.teamproject.domain.FreelancerDTO;
@Repository
public class FreelancerDAO {
	
	//마이바티스 객체생성
	@Inject
	private SqlSession sqlSession;
	private static final String namespace="com.teamproject.mapper.FreelancerMapper";
	
	
	//프리랜서 등록
	public void registFreelancer(FreelancerDTO freelancerDTO) {
		System.out.println("FreelancerDAO regist");
		
		
		sqlSession.insert(namespace + ".resistFreelancer", freelancerDTO);
	}//프리랜서 등록

	
	
	
}
