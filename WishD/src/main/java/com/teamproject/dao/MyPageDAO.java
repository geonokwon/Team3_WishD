package com.teamproject.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.teamproject.domain.FreelancerDTO;
import com.teamproject.domain.FreelancerPageDTO;
import com.teamproject.domain.FreelancerSkillDTO;
import com.teamproject.domain.MemberDTO;
import com.teamproject.domain.MyProjectDTO;
import com.teamproject.domain.MyProjectPageDTO;
import com.teamproject.domain.ProjectSkillDTO;

@Repository
public class MyPageDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace="com.teamproject.mapper.MyPageMapper";
	
	// 세션에 저장된 값에 따른 분기
	public MemberDTO getNormalMember(String user_id) {
		return sqlSession.selectOne(namespace + ".getNormalMember", user_id);
	}
	public MemberDTO getSimpleMember(String access_Token) {
		return sqlSession.selectOne(namespace + ".getSimpleMember", access_Token);
	}
	
	public MemberDTO userCheck(MemberDTO memberDTO) {
		return sqlSession.selectOne(namespace + ".userCheck", memberDTO);
	}
	
	public void updateMember(MemberDTO memberDTO) {
		System.out.println("MyPageDAO - updateMember()");
		sqlSession.update(namespace + ".updateMember", memberDTO);
	}
	
//	public List<MyProjectDTO> getMyProject(MemberDTO memberDTO) {
//		System.out.println("MyPageDAO - getMyProject()");
//		return sqlSession.selectList(namespace + ".getMyProject", memberDTO);
//	}
	
	public List<ProjectSkillDTO> getMyProjectSkillList(Long pboard_id) {
		return sqlSession.selectList(namespace + ".getMyProjectSkillList", pboard_id);
	}
	public List<MyProjectDTO> getMyProject(MyProjectPageDTO pageDTO) {
		return sqlSession.selectList(namespace + ".getMyProject", pageDTO);
	}
	
	public int getProjectCount(MemberDTO memberDTO) {
		return sqlSession.selectOne(namespace + ".getProjectCount", memberDTO);
	}
	
	public MyProjectDTO getProjectForUpdate(int projectPageNum) {
		return sqlSession.selectOne(namespace + ".getProjectForUpdate", projectPageNum);
	}
	public int getFreelancerCount(MemberDTO memberDTO) {
		return sqlSession.selectOne(namespace + ".getFreelancerCount", memberDTO);
	}
	
	public List<FreelancerDTO> getMyFreelancer(FreelancerPageDTO myFreelancerPageDTO) {
		return sqlSession.selectList(namespace + ".getMyFreelancer", myFreelancerPageDTO);
	}
	// 프리랜서 글 마다 스킬가져오기
	public List<FreelancerSkillDTO> getMyFreelancerSkillList(Long freelancer_id) {
		return sqlSession.selectList(namespace + ".getMyFreelancerSkillList", freelancer_id);
	}

	

	
}
