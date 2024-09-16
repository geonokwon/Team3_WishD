package com.teamproject.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.teamproject.domain.*;

@Repository
public class ManagerDAO {
	
	private static final String namespace = "com.teamproject.mapper.ManagerMapper.";
	
	@Inject
	private SqlSession sqlSession;
	
//	요청 프리랜서 리스트
	public List<ProjectRequestDTO> getRqfList(PageDTO pageDTO) {
		
		return sqlSession.selectList(namespace+"getRqfList", pageDTO);
	}

//	요청 프리랜서 수
	public int getRqfCount(PageDTO pageDTO) {
		
		return sqlSession.selectOne(namespace+"getRqfCount",pageDTO);
	}

	public List<FreelancerRequestDTO> getRqcList(PageDTO pageDTO) {
		
		return null;
	}

	public int getRqcCount(PageDTO pageDTO) {
		
		return 0;
	}

	
	
}
