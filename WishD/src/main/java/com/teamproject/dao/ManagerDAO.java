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

	
	
}
