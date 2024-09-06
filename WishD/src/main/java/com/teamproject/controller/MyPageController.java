package com.teamproject.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.teamproject.domain.MemberDTO;
import com.teamproject.service.MyPageService;

@Controller
@RequestMapping("/")
public class MyPageController {
	
	@Inject
	private MyPageService myPageService;
	
	@GetMapping("mypage")
	public String mypage(HttpSession session, Model model) {
		MemberDTO memberDTO = myPageService.getMember("1");
		// 세션에서 user_id, access_Token 인지 체크 (마이페이지만 테스트시 비활성)
//		MemberDTO memberDTO = null;
//		if(session.getAttribute("user_id") != "") {
//			memberDTO = myPageService.getMember((String)session.getAttribute("user_id"));
//		} else if(session.getAttribute("access_Token") != "") {
//			memberDTO = myPageService.getMember((String)session.getAttribute("access_Token"));
//		}
		model.addAttribute("memberDTO", memberDTO);
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
