package com.teamproject.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.teamproject.dao.ManagerDAO;
import com.teamproject.dao.MemberDAO;
import com.teamproject.domain.*;

@Service
public class ManagerService {
	
	@Inject
	private ManagerDAO managerDAO;
	
//	메인 페이지에 넣을 프로젝트 리스트
	public List<ProjectDTO> getMainProList(){
		
		List<ProjectDTO> projectList = managerDAO.getMainProList();
		
		for (ProjectDTO projectDTO : projectList) {
        	projectDTO.setSkills(managerDAO.getMainProSkill(projectDTO.getPboard_id()));
        }
		
		return projectList;
	}
	
//	메인 페이지에 넣을 프리랜서 리스트
	public List<FreelancerDTO> getMainFreeList(){
		
//		getFreelancerList에서 복사함
		List<FreelancerDTO> freelancerList = managerDAO.getMainFreeList();
		
		for (FreelancerDTO freelancerDTO : freelancerList) {
        	freelancerDTO.setSkills(managerDAO.getMainFreeSkill(freelancerDTO.getFreelancer_id()));
         }
		
		return freelancerList;
	}
	
//	요청 프리랜서 리스트
	public List<ProjectRequestDTO> getRqfList(PageDTO pageDTO){
		
		int startRow = (pageDTO.getCurrentPage()-1) * pageDTO.getPageSize() + 1;
		
		int endRow = startRow + pageDTO.getPageSize() - 1;
		
		pageDTO.setStartRow(startRow - 1);
		pageDTO.setEndRow(endRow);
		
		return managerDAO.getRqfList(pageDTO);
	}
	
//	요청 프리랜서 수
	public int getRqfCount(PageDTO pageDTO) {
		
		return managerDAO.getRqfCount(pageDTO);
	}

//	요청 프로젝트 리스트
	public List<FreelancerRequestDTO> getRqcList(PageDTO pageDTO) {
		
		int startRow = (pageDTO.getCurrentPage()-1) * pageDTO.getPageSize() + 1;
		
		int endRow = startRow + pageDTO.getPageSize() - 1;
		
		pageDTO.setStartRow(startRow - 1);
		pageDTO.setEndRow(endRow);
		
		return managerDAO.getRqcList(pageDTO);
	}

//	요청 프로젝트 수
	public int getRqcCount(PageDTO pageDTO) {
		
		return managerDAO.getRqcCount(pageDTO);
	}
	
//	요청 프리랜서 승인
	public void freelancerApprove(Long pboard_id) {
		
		managerDAO.freelancerApprove(pboard_id);
	}
	
//	요청 프로젝트 승인
	public void projectApprove(Long freelancer_id) {
		
		managerDAO.projectApprove(freelancer_id);
	}
	
//	공지사항 리스트
	public List<CommunityDTO> getNcoList(PageDTO pageDTO) {
		
		int startRow = (pageDTO.getCurrentPage()-1) * pageDTO.getPageSize() + 1;
		
		int endRow = startRow + pageDTO.getPageSize() - 1;
		
		pageDTO.setStartRow(startRow - 1);
		pageDTO.setEndRow(endRow);
		
		return managerDAO.getNcoList(pageDTO);
	}

//	공지사항 수
	public int getNcoCount(PageDTO pageDTO) {
		
		return managerDAO.getNcoCount(pageDTO);
	}
	
//	질문 게시판 리스트
	public List<CommunityQnaDTO> getQcoList(PageDTO pageDTO) {
		
		int startRow = (pageDTO.getCurrentPage()-1) * pageDTO.getPageSize() + 1;
		
		int endRow = startRow + pageDTO.getPageSize() - 1;
		
		pageDTO.setStartRow(startRow - 1);
		pageDTO.setEndRow(endRow);
		
		return managerDAO.getQcoList(pageDTO);
	}

//	질문 게시글 수
	public int getQcoCount(PageDTO pageDTO) {
		
		return managerDAO.getQcoCount(pageDTO);
	}

//	회원 리스트
	public List<MemberDTO> getUserList(PageDTO pageDTO) {
		
		int startRow = (pageDTO.getCurrentPage()-1) * pageDTO.getPageSize() + 1;
		
		int endRow = startRow + pageDTO.getPageSize() - 1;
		
		pageDTO.setStartRow(startRow - 1);
		pageDTO.setEndRow(endRow);
		
		return managerDAO.getUserList(pageDTO);
	}

//	회원 수
	public int getUserCount(PageDTO pageDTO) {
		
		return managerDAO.getUserCount(pageDTO);
	}

	public MemberDTO getUserInfo(Long user_no) {
		
		return managerDAO.getUserInfo(user_no);
	}

//	회원이 작성한 프로젝트 목록
	public List<ProjectDTO> getUserProList(PageDTO pageDTO) {
		
		int startRow = (pageDTO.getCurrentPage()-1) * pageDTO.getPageSize() + 1;
		
		int endRow = startRow + pageDTO.getPageSize() - 1;
		
		pageDTO.setStartRow(startRow - 1);
		pageDTO.setEndRow(endRow);
		
		return managerDAO.getUserProList(pageDTO);
	}

//	회원이 작성한 프로젝트 수
	public int getUserProCount(PageDTO pageDTO) {
		
		return managerDAO.getUserProCount(pageDTO);
	}

//	회원이 작성한 프리랜서 목록
	public List<FreelancerDTO> getUserFreeList(PageDTO pageDTO) {

		int startRow = (pageDTO.getCurrentPage()-1) * pageDTO.getPageSize() + 1;
		
		int endRow = startRow + pageDTO.getPageSize() - 1;
		
		pageDTO.setStartRow(startRow - 1);
		pageDTO.setEndRow(endRow);
		
		return managerDAO.getUserFreeList(pageDTO);
	}

//	회원이 작성한 프리랜서 수
	public int getUserFreeCount(PageDTO pageDTO) {
		
		return managerDAO.getUserFreeCount(pageDTO);
	}

//	회원이 작성한 질문 글 목록
	public List<CommunityQnaDTO> getUserQnaList(PageDTO pageDTO) {
		
		int startRow = (pageDTO.getCurrentPage()-1) * pageDTO.getPageSize() + 1;
		
		int endRow = startRow + pageDTO.getPageSize() - 1;
		
		pageDTO.setStartRow(startRow - 1);
		pageDTO.setEndRow(endRow);
		
		return managerDAO.getUserQnaList(pageDTO);
	}

//	회원이 작성한 질문 글 수
	public int getUserQnaCount(PageDTO pageDTO) {
		
		return managerDAO.getUserQnaCount(pageDTO);
	}

//	회원을 차단함
	public void blackUser(Long user_no) {
		
		managerDAO.blackUser(user_no);
	}
	
//	회원 차단을 해제함
	public void whiteUser(Long user_no) {
		
		managerDAO.whiteUser(user_no);
	}

//	차단된 유저 목록
	public List<MemberDTO> getBlackList(PageDTO pageDTO) {
		
		int startRow = (pageDTO.getCurrentPage()-1) * pageDTO.getPageSize() + 1;
		
		int endRow = startRow + pageDTO.getPageSize() - 1;
		
		pageDTO.setStartRow(startRow - 1);
		pageDTO.setEndRow(endRow);
		
		return managerDAO.getBlackList(pageDTO);
	}

//	차단된 유저 수
	public int getBlackCount(PageDTO pageDTO) {
		
		return managerDAO.getBlackCount(pageDTO);
	}


//	새로운 기술을 삽입함
	public void insertSkill(String skillName) {
		
		SkillDTO skillDTO = new SkillDTO();
		
		Integer skillNum = managerDAO.getNewSkillNum();
		
		skillDTO.setSkill_id(skillNum); skillDTO.setSkill_name(skillName);
		
		managerDAO.insertSkill(skillDTO);
	}

//	기술 목록
	public List<SkillDTO> getSkillList(PageDTO pageDTO) {
		
		int startRow = (pageDTO.getCurrentPage()-1) * pageDTO.getPageSize() + 1;
		
		int endRow = startRow + pageDTO.getPageSize() - 1;
		
		pageDTO.setStartRow(startRow - 1);
		pageDTO.setEndRow(endRow);
		
		return managerDAO.getSkillList(pageDTO);
	}

//	기술의 수
	public int getSkillCount(PageDTO pageDTO) {
		
		return managerDAO.getSkillCount(pageDTO);
	}
	
//	새로운 직무를 삽입함
	public void insertJob(String jobName) {
		
		JobDTO jobDTO = new JobDTO();
		
		Integer jobNum = managerDAO.getNewJobNum();
		
		jobDTO.setJob_id(jobNum); jobDTO.setJob_name(jobName);
		
		managerDAO.insertJob(jobDTO);
	}
	
//	직무 목록
	public List<JobDTO> getJobList(PageDTO pageDTO) {
		
		int startRow = (pageDTO.getCurrentPage()-1) * pageDTO.getPageSize() + 1;
		
		int endRow = startRow + pageDTO.getPageSize() - 1;
		
		pageDTO.setStartRow(startRow - 1);
		pageDTO.setEndRow(endRow);
		
		return managerDAO.getJobList(pageDTO);
	}

//	직무의 수
	public int getJobCount(PageDTO pageDTO) {
		
		return managerDAO.getJobCount(pageDTO);
	}
	
//	계정에 관리자 권한 부여
	public void adminOn(Long user_no) {
		
		managerDAO.adminOn(user_no);
	}
	
//	계정에 관리자 권한 해제
	public void adminOff(Long user_no) {
		
		managerDAO.adminOff(user_no);
	}
	
}
