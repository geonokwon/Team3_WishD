package com.teamproject.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.teamproject.domain.MemberDTO;
import com.teamproject.domain.ProjectPageDTO;
import com.teamproject.service.MyPageService;
import com.teamproject.service.ProjectService;

@Controller
public class MyPageController {
	
	@Inject
	private MyPageService myPageService;
	@Inject
	private ProjectService projectService; 
	
	@GetMapping("mypage")
	public String mypage(HttpSession session, Model model, HttpServletRequest reuqest) {
//		session.setAttribute("user_id", "1000");
//		session.setAttribute("access_Token", "5rxVHJROyK3JRx9d7muAJzD4ZzsZk6jKK85EoQh09tpahRgdmxYb3MqYJT3oDiiZ");
		
		// 세션에서 user_id, access_Token 인지 체크
		// 세션에 저장된 값에 따른 회원정보 찾기 분기
		MemberDTO memberDTO = null;
		if(session.getAttribute("user_id") != null) {
			memberDTO = myPageService.getNormalMember((String)session.getAttribute("user_id"));
		} else if(session.getAttribute("access_Token") != null) {
			memberDTO = myPageService.getSimpleMember((String)session.getAttribute("access_Token"));
		}
//
//		String search = reuqest.getParameter("search");
//		if (search != null && search.trim().isEmpty()) {
//            search = null;
//        }
//		int pageNum = 1;
//		//한 화면에 보여줄 글 개수 설정
//        int pageSize = 5;
//        //한 화면에 보여줄 페이지 개수 10 설정
//        int pageBlock = 5;
//        //PageDTO 객체 생성
//        ProjectPageDTO projectPageDTO = new ProjectPageDTO();
//        //pageNum, currentPage, pageSize => 값 저장
//        projectPageDTO.setCurrentPage(pageNum);
//        projectPageDTO.setPageSize(pageSize);
//        projectPageDTO.setPageNum(pageNum + 1);
//        //검색어
//        projectPageDTO.setSearch(search);
//
//
//        //프로젝트 등록 개수 전체 가져오기(나중에 state가 진행중인것만 가져와야함!)
//        projectPageDTO.setCount(projectService.getProjectCount(projectPageDTO));
//
//        //시작하는 페이지 번호 구하기
//        int startPage = ((pageNum - 1) / pageBlock) * pageBlock + 1;
//        //끝나는 페이지 번호 구하기
//        int endPage = startPage + pageBlock - 1;
//        //페이지 카운트 구하기
//        int pageCount = projectPageDTO.getCount() / pageBlock + (projectPageDTO.getCount() % pageBlock == 0 ? 0 : 1);
//        if (endPage > pageCount) {
//            endPage = pageCount;
//        }
//        projectPageDTO.setStartPage(startPage);
//        projectPageDTO.setEndPage(endPage);
//        projectPageDTO.setPageCount(pageCount);
//        projectPageDTO.setPageBlock(pageBlock);
//
//        //project_find page 스킬별 조회시 필요한 전체 스킬 데이터
//        model.addAttribute("projectSkillList", projectService.getSkillList());
//
//        //project_find page 글 개수 10개씩 가져옴
//        model.addAttribute("projectDTOList", projectService.getProject(projectPageDTO));
//        model.addAttribute("projectPageDTOList", projectPageDTO);
//
//		model.addAttribute("memberDTO", memberDTO);
		return "/mypage/mypage";
	}
	
	@PostMapping("mypage/mypageUpdatePro")
	public String mypageUpdatePro(HttpSession session, MemberDTO memberDTO) {
//		System.out.println("MyPageController - mypageUpdatePro");
		memberDTO.setUser_no(1); // "session.getAttribute(user_no)"
		memberDTO = myPageService.userCheck(memberDTO);
		System.out.println("mypageUpdatePro : " + memberDTO);
		if(memberDTO != null) {
			myPageService.updateMember(memberDTO);
			return "redirect:/mypage";
		}
		return "redirect:/mypage";
	}
	
	@PostMapping("mypage/myuserDeletePro")
	public String myuserDeletePro() { //HttpServletRequest request�׽�Ʈ
//		System.out.println(request.getParameter("email")); 
		System.out.println("MyPageController - myuserDeletePro");

		return "";
	}
	
}
