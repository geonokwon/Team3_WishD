package com.teamproject.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.teamproject.domain.FreelancerPageDTO;
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
//		session.setAttribute("user_no", 1);
//		session.setAttribute("access_Token", "dtDCDHVkTvo7oOsC1HsMAf6qu40Qurj8aYMMwmFV59GT5xjw9WBeDVreHGITSzU8");
		
		// ====== 회원 정보 가져오기 시작 =======
		// 세션에 저장된 값으로 체크
		MemberDTO memberDTO = new MemberDTO();
		Long sessionCheck = (Long)session.getAttribute("user_no");
		if(sessionCheck == null) {
			return "redirect:/login";
		}
		// 세션에 저장된 값으로 회원정보 가져오기
		memberDTO = myPageService.getLoginMember(sessionCheck.longValue());
		System.out.println(memberDTO);
		
		model.addAttribute("memberDTO", memberDTO);
		System.out.println("memberDTO : " + memberDTO);
		// ======= 회원 정보 가져오기 끝 =======
		
		// ======= 내가 쓴 프리랜서 글 가져오기 시작 =====
		String myFreelancePageNum = request.getParameter("freelancePageNum"); 
		if(myFreelancePageNum == null) {
			myFreelancePageNum = "1";
		}
		int freelancerpageNumToInt = Integer.parseInt(myFreelancePageNum);
		System.out.println("freelancerpageNumToInt :" + freelancerpageNumToInt);
		//한 화면에 보여줄 글 개수 설정
        int freelancerPageSize = 5;
        //한 화면에 보여줄 페이지 개수 5 설정
        int freelancerPageBlock = 5;
        //PageDTO 객체 생성
        FreelancerPageDTO myFreelancerPageDTO = new FreelancerPageDTO();
        
        String freelancerSearch = request.getParameter("freelancerSearch");
        System.out.println("freelancerSearch 넘어왔을때 : " + freelancerSearch);
     	
        //검색어 파라미터 넣기
     	if(freelancerSearch == "") {
     		freelancerSearch = null;
     	} else if(freelancerSearch != null) {
     		myFreelancerPageDTO.setSearch(freelancerSearch);
     	}
     	System.out.println("freelancerSearch : " + freelancerSearch);
     	
     	// 프리랜서 글상태 필터를 위해 글상태 저장
     	String freelancerStatus = request.getParameter("freelancerStatus");
     	System.out.println("파라미터로 넘어왔을때 freelancerStatus: " + freelancerStatus);
     	if(freelancerStatus == "") {
     		freelancerStatus = null;
     		System.out.println("freelancerStatus 파라미터가 공백일때 : " + freelancerStatus);
     	}
     	else if(freelancerStatus != null){ // 공백제거
     		myFreelancerPageDTO.setFreelancerStatus(freelancerStatus);
         	System.out.println("freelancerStatus 파라미터가 있을때 : " + freelancerStatus);
     	}
//     	
//      // 내프리랜서글 개수 가져오기
//     	// 검색어에 따른 프로젝트 개수 가져오기 유저넘버랑 글넘버를 넘겨야함
//     	// getFreelancerCount에서 검색어를 안넘겨서 카운트가 비정상 작동
     	myFreelancerPageDTO.setUser_no(memberDTO.getUser_no());
     	memberDTO.setSearch(freelancerSearch);
     	myFreelancerPageDTO.setFreelancerStatus(freelancerStatus); // 프로젝트 글상태 넣어줘야 카운트 계산
     	// 프로젝트 글 상태도 넘겨야함
     	memberDTO.setFreelancerStatus(freelancerStatus); // 프로젝트 글상태 넣어줘야 카운트 계산
     	myFreelancerPageDTO.setCount(myPageService.getFreelancerCount(memberDTO));
        System.out.println("freegetCount : " + myFreelancerPageDTO.getCount());
        myFreelancerPageDTO.setCurrentPage(freelancerpageNumToInt);
        myFreelancerPageDTO.setPageSize(freelancerPageSize);
        myFreelancerPageDTO.setPageNum(freelancerpageNumToInt + 1);
        
        // 시작하는 페이지 번호 구하기
        int freelancerStartPage = ((freelancerpageNumToInt - 1) / freelancerPageBlock) * freelancerPageBlock + 1;
        System.out.println("freestartPage : " + freelancerStartPage);
        //끝나는 페이지 번호 구하기
        int freelancerEndPage = freelancerStartPage + freelancerPageBlock - 1;
        System.out.println("endPage : " + freelancerEndPage);

        //페이지 카운트 구하기
        int freelancerPageCount = myFreelancerPageDTO.getCount() / freelancerPageBlock + (myFreelancerPageDTO.getCount() % freelancerPageBlock == 0 ? 0 : 1);
        if (freelancerEndPage > freelancerPageCount) {
        	freelancerEndPage = freelancerPageCount;
        }
        System.out.println("pageCount : " + freelancerPageCount);
        
        //projectPageDTO 셋팅
        myFreelancerPageDTO.setStartPage(freelancerStartPage);
        myFreelancerPageDTO.setEndPage(freelancerEndPage);
        myFreelancerPageDTO.setPageCount(freelancerPageCount);
        myFreelancerPageDTO.setPageBlock(freelancerPageBlock);
        System.out.println("freelancerStartPage : " + freelancerStartPage);
        System.out.println("freelancerEndPage : " + freelancerEndPage);

        // 시작하는 행 번호 구하기
        int freelancerStartRow = (freelancerpageNumToInt - 1) * freelancerPageSize + 1;
        // 끝나는 행 번호 구하기
        int freelancerEndRow = freelancerStartRow + freelancerPageSize - 1;
        // DB에 Limit 시작하는 행 번호 - 1, 글 개수 설정
        myFreelancerPageDTO.setStartRow(freelancerStartRow - 1);
        myFreelancerPageDTO.setEndRow(freelancerEndRow);
        System.out.println("freelancerStartRow : " + freelancerStartRow);
        System.out.println("freelancerEndRow : " + freelancerEndRow);
        
        myFreelancerPageDTO.setUser_no(memberDTO.getUser_no());
        //project_find page 글 개수 10개씩 가져옴
        model.addAttribute("myFreelancerPageDTO", myFreelancerPageDTO);
        model.addAttribute("myFreelancerDTOList", myPageService.getMyFreelancer(myFreelancerPageDTO));
        System.out.println("myFreelancerPageDTO size : " + myPageService.getMyFreelancer(myFreelancerPageDTO).size());
  	    // ============ 프리랜서 글 가져오기 끝 ==========
		
		
		
		
		// ======= 프로젝트 글 페이지네이션과 내가 쓴글가져오기 시작 ========
		// 파라미터값 projectPageNum 없으면 => 1페이지로 설정
		String projectPageNum = request.getParameter("projectPageNum");
		if(projectPageNum == null) {
			projectPageNum = "1";
		}
		
		int pageNumToInt = Integer.parseInt(projectPageNum);
		System.out.println("pageNumToInt :" + pageNumToInt);
				
		//한 화면에 보여줄 글 개수 설정
        int pageSize = 5;
        //한 화면에 보여줄 페이지 개수 5 설정
        int pageBlock = 5;

        //PageDTO 객체 생성
        MyProjectPageDTO myProjectPageDTO = new MyProjectPageDTO();
        
        String search = request.getParameter("search");
        
     	
        //검색어 파라미터 넣기
        
     	if(search != null) {
     		myProjectPageDTO.setSearch(request.getParameter("search"));
     		System.out.println("search : " + request.getAttribute("search"));
     	}
     	
     	// 프로젝트 글상태 필터를 위해 글상태 저장
     	String projectStatus = request.getParameter("projectStatus");
     	System.out.println("파라미터로 넘어왔을때 projectStatus: " + projectStatus);
     	if(projectStatus == "") {
     		projectStatus = null;
     		System.out.println("projectStatus 파라미터가 공백일때 : " + projectStatus);
     	}
     	else if(projectStatus != null){ // 공백제거
     		myProjectPageDTO.setProjectStatus(projectStatus);
         	System.out.println("projectStatus 파라미터가 있을때 : " + projectStatus);
     	}
     	
        // 내프로젝트글 개수 가져오기
     	// 검색어에 따른 프로젝트 개수 가져오기 유저넘버랑 글넘버를 넘겨야함
     	// getProjectCount에서 검색어를 안넘겨서 카운트가 비정상 작동
     	myProjectPageDTO.setUser_no(memberDTO.getUser_no());
     	memberDTO.setSearch(search);
     	myProjectPageDTO.setProjectStatus(projectStatus); // 프로젝트 글상태 넣어줘야 카운트 계산
     	// 프로젝트 글 상태도 넘겨야함
     	memberDTO.setProjectStatus(projectStatus); // 프로젝트 글상태 넣어줘야 카운트 계산
        myProjectPageDTO.setCount(myPageService.getProjectCount(memberDTO));
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
  	    // ======= 프로젝트 글 페이지네이션과 내가 쓴글가져오기 끝 ===========
        
        String qnaPageNum = request.getParameter("qnaPageNum");
		if(qnaPageNum == null) {
			qnaPageNum = "1";
		}
        
		
		return "mypage/mypage";
	}
	
	@PostMapping("mypage/mypageUpdatePro")
	public String mypageUpdatePro(HttpSession session, MemberDTO memberDTO) {
		System.out.println("mypageUpdatePro : " + memberDTO);
//		MemberDTO result = myPageService.getNormalMember((String)session.getAttribute("user_id"));
//		if(result != null) {
//			memberDTO.setUser_no(result.getUser_no());
//			myPageService.updateMember(memberDTO);
//			return "redirect:/mypage";
//		}
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
		System.out.println("myprojectupdate - myprojectupdate");
		
		
		MyProjectDTO myProjectDTO = myPageService.getProjectForUpdate(Integer.parseInt(request.getParameter("projectPageNum")));
		System.out.println("myProjectDTO : " + myProjectDTO);
		
		model.addAttribute("myProjectDTO", myProjectDTO);
		return "mypage/project_update";
	}
}
