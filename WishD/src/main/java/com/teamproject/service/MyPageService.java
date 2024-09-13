package com.teamproject.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.teamproject.dao.MyPageDAO;
import com.teamproject.domain.FreelancerDTO;
import com.teamproject.domain.FreelancerPageDTO;
import com.teamproject.domain.MemberDTO;
import com.teamproject.domain.MyProjectDTO;
import com.teamproject.domain.MyProjectPageDTO;

@Service
public class MyPageService {

	@Inject
	private MyPageDAO myPageDAO;

	public MemberDTO getLoginMember(Long user_no) {
		// 일반회원 정보가져오기
		MemberDTO memberDTO = myPageDAO.getLoginMember(user_no);
		return memberDTO;
	}
	
	public MemberDTO userCheck(MemberDTO memberDTO) {
		return myPageDAO.userCheck(memberDTO);	
	}
	
	public void updateMember(MemberDTO memberDTO) {
		System.out.println("MyPageService - updateMember()");
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
		System.out.println("서비스의 getMyProject myProjectList size : " + myProjectList.size());
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
	
	public MyProjectDTO getProjectForUpdate(String parameter) {
		// TODO Auto-generated method stub
		return null;
	}
	
	public MyProjectDTO getProjectForUpdate(int projectPageNum) {
		return myPageDAO.getProjectForUpdate(projectPageNum);
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
	
	
	
	
	
	
	
	
	

	

}
