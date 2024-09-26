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
	
//	메인 페이지에 넣을 프로젝트 목록
	public List<ProjectDTO> getMainProList() {
		
		return sqlSession.selectList(namespace+"getMainProList");
	}

//	메인 페이지에 넣을 프리랜서 목록
	public List<FreelancerDTO> getMainFreeList() {
		
		return sqlSession.selectList(namespace+"getMainFreeList");
	}
	
//	메인 페이지에 넣을 프로젝트의 기술들
	public List<FreelancerSkillDTO> getMainFreeSkill(Long freelancer_id) {

		return sqlSession.selectList(namespace+"getMainFreeSkill", freelancer_id);
	}
	
//	메인 페이지에 넣을 프리랜서의 기술들
	public List<ProjectSkillDTO> getMainProSkill(Long pboard_id) {
		
		return sqlSession.selectList(namespace+"getMainProSkill", pboard_id);
	}
	
//	요청 프리랜서 리스트
	public List<ProjectRequestDTO> getRqfList(PageDTO pageDTO) {
		
		return sqlSession.selectList(namespace+"getRqfList", pageDTO);
	}

//	요청 프리랜서 수
	public int getRqfCount(PageDTO pageDTO) {
		
		return sqlSession.selectOne(namespace+"getRqfCount",pageDTO);
	}

//	요청 프로젝트 리스트
	public List<FreelancerRequestDTO> getRqcList(PageDTO pageDTO) {
		
		return sqlSession.selectList(namespace+"getRqcList", pageDTO);
	}

//	요청 프로젝트 수
	public int getRqcCount(PageDTO pageDTO) {
		
		return sqlSession.selectOne(namespace+"getRqcCount",pageDTO);
	}

//	요청 프리랜서 승인
	public void freelancerApprove(Long pboard_id) {
		
		sqlSession.update(namespace+"freelancerApprove", pboard_id);
	}
	
//	요청 프로젝트 승인
	public void projectApprove(Long freelancer_id) {
		
		sqlSession.update(namespace+"projectApprove", freelancer_id);
	}

//	공지사항 목록
	public List<CommunityDTO> getNcoList(PageDTO pageDTO) {
		
		return sqlSession.selectList(namespace+"getNcoList", pageDTO);
	}

//	공지사항 수
	public int getNcoCount(PageDTO pageDTO) {
		
		return sqlSession.selectOne(namespace+"getNcoCount",pageDTO);
	}
	
//	질문 게시판 목록
	public List<CommunityQnaDTO> getQcoList(PageDTO pageDTO) {
		
		return sqlSession.selectList(namespace+"getQcoList", pageDTO);
	}

//	질문 게시글 수
	public int getQcoCount(PageDTO pageDTO) {
		
		return sqlSession.selectOne(namespace+"getQcoCount",pageDTO);
	}

//	전체 회원 목록
	public List<MemberDTO> getUserList(PageDTO pageDTO) {
		
		return sqlSession.selectList(namespace+"getUserList", pageDTO);
	}

//	전체 회원 수
	public int getUserCount(PageDTO pageDTO) {
		
		return sqlSession.selectOne(namespace+"getUserCount", pageDTO);
	}

//	회원 상세 정보
	public MemberDTO getUserInfo(Long user_no) {
		
		return sqlSession.selectOne(namespace+"getUserInfo", user_no);
	}

//	회원이 작성한 프로젝트 목록
	public List<ProjectDTO> getUserProList(PageDTO pageDTO) {
		
		return sqlSession.selectList(namespace+"getUserProList", pageDTO);
	}

//	회원이 작성한 프로젝트 수
	public int getUserProCount(PageDTO pageDTO) {
		
		return sqlSession.selectOne(namespace+"getUserProCount", pageDTO);
	}

//	회원이 작성한 프리랜서 목록
	public List<FreelancerDTO> getUserFreeList(PageDTO pageDTO) {
		
		return sqlSession.selectList(namespace+"getUserFreeList", pageDTO);
	}

//	회원이 작성한 프리랜서 수
	public int getUserFreeCount(PageDTO pageDTO) {
		
		return sqlSession.selectOne(namespace+"getUserFreeCount", pageDTO);
	}

//	회원이 작성한 질문 글 목록
	public List<CommunityQnaDTO> getUserQnaList(PageDTO pageDTO) {
		
		return sqlSession.selectList(namespace+"getUserQnaList", pageDTO);
	}

//	회원이 작성한 질문 글 수
	public int getUserQnaCount(PageDTO pageDTO) {
		
		return sqlSession.selectOne(namespace+"getUserQnaCount", pageDTO);
	}

//	회원을 차단함
	public void blackUser(Long user_no) {
		
		sqlSession.update(namespace+"blackUser", user_no);
	}
	
//	회원 차단을 해제함
	public void whiteUser(Long user_no) {
		
		sqlSession.update(namespace+"whiteUser", user_no);
	}

//	차단된 유저 목록
	public List<MemberDTO> getBlackList(PageDTO pageDTO) {
		
		return sqlSession.selectList(namespace+"getBlackList", pageDTO);
	}

//	차단된 유저 수
	public int getBlackCount(PageDTO pageDTO) {
		
		return sqlSession.selectOne(namespace+"getBlackCount", pageDTO);
	}
	
//	새로운 기술 식별번호를 가져옴
	public int getNewSkillNum() {
		
		return sqlSession.selectOne(namespace+"getNewSkillNum");
	}
	
//	새로운 기술을 삽입함
	public void insertSkill(SkillDTO skillDTO) {
		
		sqlSession.insert(namespace+"insertSkill", skillDTO);
	}

//	기술 목록
	public List<SkillDTO> getSkillList(PageDTO pageDTO) {
		
		return sqlSession.selectList(namespace+"getSkillList", pageDTO);
	}

//	기술의 수
	public int getSkillCount(PageDTO pageDTO) {
		
		return sqlSession.selectOne(namespace+"getSkillCount", pageDTO);
	}
	
//	새로운 직무 식별번호를 가져옴
	public int getNewJobNum() {
		
		return sqlSession.selectOne(namespace+"getNewJobNum");
	}
	
//	새로운 직무를 삽입함
	public void insertJob(JobDTO jobDTO) {
		
		sqlSession.insert(namespace+"insertJob", jobDTO);
	}
	
//	직무 목록
	public List<JobDTO> getJobList(PageDTO pageDTO) {
		
		return sqlSession.selectList(namespace+"getJobList", pageDTO);
	}

//	직무의 수
	public int getJobCount(PageDTO pageDTO) {
		
		return sqlSession.selectOne(namespace+"getJobCount", pageDTO);
	}
	
//	계정에 관리자 권한 부여
	public void adminOn(Long user_no) {
		
		sqlSession.update(namespace+"adminOn", user_no);
	}
	
//	계정에 관리자 권한 해제
	public void adminOff(Long user_no) {
		
		sqlSession.update(namespace+"adminOff", user_no);
	}
	
}
