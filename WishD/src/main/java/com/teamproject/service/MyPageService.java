package com.teamproject.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.teamproject.dao.MyPageDAO;
import com.teamproject.domain.CommunityPageDTO;
import com.teamproject.domain.CommunityQnaDTO;
import com.teamproject.domain.FreelancerDTO;
import com.teamproject.domain.FreelancerPageDTO;
import com.teamproject.domain.JobDTO;
import com.teamproject.domain.MemberDTO;
import com.teamproject.domain.MyProjectDTO;
import com.teamproject.domain.MyProjectPageDTO;

@Service
public class MyPageService {

	@Inject
	private MyPageDAO myPageDAO;
	@Inject
	private ProjectService projectService;
	
	public MemberDTO getLoginMember(Long user_no) {
		// 회원 정보가져오기 로그인종류 분기
		// 처음에 user 테이블에서 가져옴
		MemberDTO memberDTO = myPageDAO.getLoginMember(user_no);
		System.out.println("일반 memberDTO : " + memberDTO);
		if(memberDTO == null) { // user_id가 없으면 simple_user 테이블에서 가져옴
			memberDTO = myPageDAO.getSimpleMember(user_no);
			System.out.println("심플 memberDTO : " + memberDTO);
		}
		return memberDTO;
	}
	
//	public MemberDTO userCheck(MemberDTO memberDTO) {
//		return myPageDAO.userCheck(memberDTO);	
//	}
	
	//비밀번호 업데이트 
	public void updateMember(MemberDTO memberDTO) {
		System.out.println("MyPageService - updateMember() : " + memberDTO);
		myPageDAO.updateMember(memberDTO);
	}
	
	// 내 프로젝트 가져오기
//	public List<MyProjectDTO> getMyProject(MemberDTO memberDTO) {
//		List<MyProjectDTO> myProjectList = myPageDAO.getMyProject(memberDTO);
//		for(MyProjectDTO i : myProjectList) {
//			i.setSkills(myPageDAO.getMyProjectSkillList(i.getPboard_id()));
//			System.out.println(i);
//		}
//		return myProjectList;
//	}
	public List<MyProjectDTO> getMyProject(MyProjectPageDTO pageDTO) {
		// 내가 쓴글 가져오기
		List<MyProjectDTO> myProjectList = myPageDAO.getMyProject(pageDTO);
//		System.out.println("서비스의 getMyProject myProjectList size : " + myProjectList.size());
		for(MyProjectDTO i : myProjectList) {
			i.setSkills(myPageDAO.getMyProjectSkillList(i.getPboard_id()));
			System.out.println(i);
		}
		System.out.println(myProjectList.size());
		return myProjectList;
	}
	
	public int getProjectCount(MemberDTO memberDTO) {
		return myPageDAO.getProjectCount(memberDTO);
	}
	
	public MyProjectDTO getProjectForUpdate(int projectPageNum) {
		MyProjectDTO myProjectDTO = myPageDAO.getProjectForUpdate(projectPageNum);
		myProjectDTO.setSkills(myPageDAO.getMyProjectSkillList(myProjectDTO.getPboard_id()));
		return myProjectDTO;
	}
	
	public int getFreelancerCount(MemberDTO memberDTO) {
		return myPageDAO.getFreelancerCount(memberDTO);
	}
	
	public List<FreelancerDTO> getMyFreelancer(FreelancerPageDTO myFreelancerPageDTO) {
		// 내가 쓴 프리랜서글 가져오기
		List<FreelancerDTO> myFreelancerList = myPageDAO.getMyFreelancer(myFreelancerPageDTO);
		System.out.println("서비스의 getMyFreelancer myFreelancerList size : " + myFreelancerList.size());
		for(FreelancerDTO i : myFreelancerList) {
			i.setSkills(myPageDAO.getMyFreelancerSkillList(i.getFreelancer_id()));
			System.out.println(i);
		}
		System.out.println(myFreelancerList.size());
		return myFreelancerList;
	}
	
	// 내 qna 개수 가져오기 
	public int getMyQnaCount(Long user_no) {
		return myPageDAO.getMyQnaCount(user_no);
	}

	// 내 qna 글리스트 가져오기
	public List<CommunityQnaDTO> getMyQnaList(CommunityPageDTO myQnaPageDTO) {
		List<CommunityQnaDTO> MyQnaDTOList = myPageDAO.getMyQnaList(myQnaPageDTO);
		return MyQnaDTOList;
	}
	
	// 프로젝트 수정
	@Transactional
	public void updateMyProject(MyProjectDTO myProjectDTO) {
		myPageDAO.updateMyProject(myProjectDTO);
		
		// 번호로된 스킬리스트를 들고 스킬테이블 업데이트
        if(myProjectDTO.getSkillList() != "") { // 스킬선택을 그대로 두면 "" 값이 넘어와 필터
        	Map<String, Object> myProjectSkillSet = new HashMap<>();
            myProjectSkillSet.put("pboard_id", myProjectDTO.getPboard_id());
        	myPageDAO.updateMyProjectSkillDelete(myProjectDTO); // pboard_id와 skillList사용
        	myProjectSkillSet.put("skill_id", projectService.getSkillList(myProjectDTO.getSkillList()));
        	myPageDAO.updateMyProjectSkillInsert(myProjectSkillSet);
		}
        
	}
	
	// 수정할 글 가져오는 작업
	public FreelancerDTO getMyFreelancerForUpdate(Long freelancer_id) {
		FreelancerDTO freelancerDTO = myPageDAO.getMyFreelancerForUpdate(freelancer_id);
		freelancerDTO.setSkills(myPageDAO.getMyFreelancerSkillList(freelancer_id));
		System.out.println(freelancerDTO);
		
		return freelancerDTO;
	}
	
	// 프리랜서 글 수정작업
	@Transactional
	public void updateMyFreelancer(FreelancerDTO freelancerDTO) {
		myPageDAO.updateMyFreelancer(freelancerDTO);
		if(freelancerDTO.getSkillList() != "") {
			Map<String, Object> myFreelancerSkillSet = new HashMap<>();
			myFreelancerSkillSet.put("freelancer_id", freelancerDTO.getFreelancer_id());
			myPageDAO.updateMyFreelancerSkillDelete(freelancerDTO); // freelancer_id
			myFreelancerSkillSet.put("skill_id", projectService.getSkillList(freelancerDTO.getSkillList()));
			myPageDAO.updateMyFreelancerSkillInsert(myFreelancerSkillSet);
		}
	}

	public String userIdCheck(String id) {
		return myPageDAO.userIdCheck(id);
	}

	public List<JobDTO> getJobsList() {
		return myPageDAO.getJobsList();
	}

	public List<MyProjectDTO> getRequestListCount(Long user_no) {
		return myPageDAO.getRequestListCount(user_no);
	}

	// 프로젝트에 요청보낸것
	public List<MyProjectDTO> getMyRequestProject(MyProjectPageDTO myProjectRequestPageDTO) {
		List<MyProjectDTO> myProjectList = myPageDAO.getMyRequestProject(myProjectRequestPageDTO);
		
		for(MyProjectDTO i : myProjectList) {
			i.setSkills(myPageDAO.getMyProjectSkillList(i.getPboard_id()));
			System.out.println(i);
		}
		System.out.println(myProjectList.size());
		return myProjectList;
	}

	// 프리랜서에 요청보낸글 카운트
	public List<FreelancerDTO> getRequestFreeListCount(Long user_no) {
		return myPageDAO.getRequestFreeListCount(user_no);
	}

	// 프리랜서에 요청보낸글 가져오기 
	public List<FreelancerDTO> getMyRequestFree(FreelancerPageDTO myFreelancerRequestPageDTO) {
		List<FreelancerDTO> freelancerDTO = myPageDAO.getMyRequestFree(myFreelancerRequestPageDTO);
		for(FreelancerDTO i : freelancerDTO) { // 스킬가져오기
			i.setSkills(myPageDAO.getMyFreelancerSkillList(i.getFreelancer_id()));
			System.out.println(i);
		}
		return freelancerDTO;
	}
	
	//회원탈퇴
	public MemberDTO deleteCheck(MemberDTO memberDTO) {
		return myPageDAO.deleteCheck(memberDTO);
	}
	public void deleteMember(MemberDTO memberDTO) {
		myPageDAO.deleteUser(memberDTO);
		myPageDAO.deleteUserInfo(memberDTO);
	}

	
	
	

}
