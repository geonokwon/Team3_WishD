package com.teamproject.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.teamproject.domain.MemberDTO;
import com.teamproject.domain.MyProjectDTO;
import com.teamproject.domain.MyProjectPageDTO;
import com.teamproject.service.MyPageService;

@Controller
public class MyPageController {
	
	@Inject
	private MyPageService myPageService;
	
	@GetMapping("mypage")
	public String mypage(HttpSession session, Model model, HttpServletRequest request) {
		session.setAttribute("user_id", "1000");
//		session.setAttribute("access_Token", "dtDCDHVkTvo7oOsC1HsMAf6qu40Qurj8aYMMwmFV59GT5xjw9WBeDVreHGITSzU8");
		
		// ====== 회원 정보 가져오기 시작 =======
		// 세션에서 user_id, access_Token 인지 체크
		// 세션에 저장된 값에 따른 회원정보 찾기 분기
		MemberDTO memberDTO = null;
		if(session.getAttribute("user_id") != null) {
			memberDTO = myPageService.getNormalMember((String)session.getAttribute("user_id"));
		} else if(session.getAttribute("access_Token") != null) {
			memberDTO = myPageService.getSimpleMember((String)session.getAttribute("access_Token"));
		}
		model.addAttribute("memberDTO", memberDTO);
		System.out.println("memberDTO : " + memberDTO);
		// ======= 회원 정보 가져오기 끝 =======
		
		
		
		// ======= 프로젝트 글 페이지네이션과 같이 내가 쓴글가져오기 시작 ========
		// 파라미터값 projectPageNum 없으면 => 1페이지로 설정
		String projectPageNum = request.getParameter("projectPageNum");
		if(projectPageNum == null) {
			projectPageNum = "1";
		}
		
		int pageNumToInt = Integer.parseInt(projectPageNum);
		System.out.println("pageNumToInt :" + pageNumToInt);
				
		//한 화면에 보여줄 글 개수 설정
        int pageSize = 5;
        //한 화면에 보여줄 페이지 개수 10 설정
        int pageBlock = 5;

        //PageDTO 객체 생성
        MyProjectPageDTO myProjectPageDTO = new MyProjectPageDTO();
        
        String search = request.getParameter("search");
        //검색어 파라미터 넣기
     	if(search != null) {
     		myProjectPageDTO.setSearch(request.getParameter("search"));
     		System.out.println("search : " + request.getAttribute("search"));
     	}
       
        // 내프로젝트글 개수 가져오기
     	
     	// 검색어에 따른 프로젝트 개수 가져오기 유저넘버랑 글넘버를 넘겨야함
     	// getMyProject 안에서 유저넘버와 글넘버를 이용해 개수를 가져와서 set을 할지 결정해야함
     	myProjectPageDTO.setUser_no(memberDTO.getUser_no());
        myProjectPageDTO.setCount(myPageService.getProjectCount(memberDTO.getUser_no()));
        System.out.println("getCount : " + myProjectPageDTO.getCount());
        myProjectPageDTO.setCurrentPage(pageNumToInt);
        myProjectPageDTO.setPageSize(pageSize);
        myProjectPageDTO.setPageNum(pageNumToInt + 1);
        
        // 시작하는 페이지 번호 구하기
        int startPage = ((pageNumToInt - 1) / pageBlock) * pageBlock + 1;
        System.out.println("startPage : " + startPage);
        //끝나는 페이지 번호 구하기
        int endPage = startPage + pageBlock - 1;
        System.out.println("endPage : " + endPage);

        //페이지 카운트 구하기
        int pageCount = myProjectPageDTO.getCount() / pageBlock + (myProjectPageDTO.getCount() % pageBlock == 0 ? 0 : 1);
        if (endPage > pageCount) {
            endPage = pageCount;
        }
        System.out.println("pageCount : " + pageCount);
        
        //projectPageDTO 셋팅
        myProjectPageDTO.setStartPage(startPage);
        myProjectPageDTO.setEndPage(endPage);
        myProjectPageDTO.setPageCount(pageCount);
        myProjectPageDTO.setPageBlock(pageBlock);
        System.out.println("startPage : " + startPage);
        System.out.println("endPage : " + endPage);

        // 시작하는 행 번호 구하기
        int startRow = (pageNumToInt - 1) * pageSize + 1;
        // 끝나는 행 번호 구하기
        int endRow = startRow + pageSize - 1;
        // DB에 Limit 시작하는 행 번호 - 1, 글 개수 설정
        System.out.println("startRow - 1 전 값 : " + startRow);
        myProjectPageDTO.setStartRow(startRow - 1);
        myProjectPageDTO.setEndRow(endRow);
        System.out.println("startRow : " + startRow);
        System.out.println("endRow : " + endRow);
        
        myProjectPageDTO.setUser_no(memberDTO.getUser_no());
        //project_find page 글 개수 10개씩 가져옴
        model.addAttribute("myProjectPageDTO", myProjectPageDTO);
        model.addAttribute("myProjectDTOList", myPageService.getMyProject(myProjectPageDTO));
        System.out.println("myProjectPageDTO size : " + myPageService.getMyProject(myProjectPageDTO).size());
  	    // ======= 프로젝트 글 페이지네이션과 같이 내가 쓴글가져오기 끝 ===========
        
        
        String qnaPageNum = request.getParameter("qnaPageNum");
		if(qnaPageNum == null) {
			qnaPageNum = "1";
		}	
        
		
		return "mypage/mypage";
	}
	
	@PostMapping("mypage/mypageUpdatePro")
	public String mypageUpdatePro(HttpSession session, MemberDTO memberDTO) {
		System.out.println("mypageUpdatePro : " + memberDTO);
		MemberDTO result = myPageService.getNormalMember((String)session.getAttribute("user_id"));
		if(result != null) {
			memberDTO.setUser_no(result.getUser_no());
			myPageService.updateMember(memberDTO);
			return "redirect:/mypage";
		}
		return "redirect:/mypage";
	}
	
	@PostMapping("mypage/myuserDeletePro")
	public String myuserDeletePro() { 
//		System.out.println(request.getParameter("email")); 
		System.out.println("MyPageController - myuserDeletePro");

		return "redirect:/";
	}
	
	@GetMapping("mypage/myprojectupdate")
	public String myProjectUpdate(HttpServletRequest request, Model model) {
//		System.out.println("myProjectUpdate request.getParameter("projectPageNum") : " + request.getParameter("projectPageNum"));
		
		MyProjectDTO myProjectDTO = myPageService.getProjectForUpdate(Integer.parseInt(request.getParameter("projectPageNum")));
		System.out.println("myProjectDTO : " + myProjectDTO);
		
		model.addAttribute("myProjectDTO", myProjectDTO);
		return "mypage/project_update";
	}
}
