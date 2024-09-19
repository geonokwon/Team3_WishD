package com.teamproject.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.teamproject.domain.CommunityPageDTO;
import com.teamproject.domain.CommunityQnaDTO;
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
	
	public MemberDTO getLoginMember(Long sessionCheck) {
		return sqlSession.selectOne(namespace + ".getLoginMember", sessionCheck);
	}
	
	public MemberDTO getSimpleMember(Long user_no) {
		return sqlSession.selectOne(namespace + ".getSimpleMember", user_no);
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

	// 내가 쓴 qna글개수 가져오기
	public int getMyQnaCount(Long user_no) {
		return sqlSession.selectOne(namespace + ".getMyQnaCount", user_no);
	}
	
	// 내가 쓴 qna 글리스트
	public List<CommunityQnaDTO> getMyQnaList(CommunityPageDTO myQnaPageDTO) {
		return sqlSession.selectList(namespace + ".getMyQnaList", myQnaPageDTO);
	}

	// 프로젝트 업데이트 
	public void updateMyProject(MyProjectDTO myProjectDTO) {
		sqlSession.update(namespace + ".updateMyProject", myProjectDTO);
	}
	public void updateMyProjectSkillDelete(MyProjectDTO myProjectDTO) {
		sqlSession.delete(namespace + ".updateMyProjectSkillDelete", myProjectDTO);
	}
	public void updateMyProjectSkillInsert(Map<String, Object> myProjectSkillSet) {
		sqlSession.insert(namespace + ".updateMyProjectSkillInsert", myProjectSkillSet);
	}
	
	// 수정할 글 하나만 가져오기
	public FreelancerDTO getMyFreelancerForUpdate(Long freelancer_id) {
		return sqlSession.selectOne(namespace + ".getMyFreelancerForUpdate", freelancer_id);
	}

	// 프리랜서 글 수정 시작
	public void updateMyFreelancer(FreelancerDTO freelancerDTO) {
		sqlSession.update(namespace + ".updateMyFreelancer", freelancerDTO);
	}
	public void updateMyFreelancerSkillDelete(FreelancerDTO freelancerDTO) {
		sqlSession.delete(namespace + ".updateMyFreelancerSkillDelete", freelancerDTO);
	}
	public void updateMyFreelancerSkillInsert(Map<String, Object> myFreelancerSkillSet) {
		sqlSession.insert(namespace + ".updateMyFreelancerSkillInsert", myFreelancerSkillSet);
	}

	public String userIdCheck(String id) {
		return sqlSession.selectOne(namespace + ".userIdCheck", id);
	}

	
	

	
}
