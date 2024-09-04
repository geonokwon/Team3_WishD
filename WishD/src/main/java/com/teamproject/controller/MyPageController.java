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
//		System.out.println("MyPageController - mypage");
		MemberDTO memberDTO = myPageService.getMember((String)session.getAttribute("user_no"));
		model.addAttribute("memberDTO", memberDTO);
		return "/mypage/mypage";
	}
	
	@PostMapping("mypage/mypageUpdatePro")
	public String mypageUpdatePro(HttpSession session, MemberDTO memberDTO) {
//		System.out.println("MyPageController - mypageUpdatePro");
		memberDTO.setUser_no((int)(1)); // "session.getAttribute(user_no)"
		MemberDTO memberDTO2 = myPageService.userCheck(memberDTO);
		if(memberDTO2 != null) {
			myPageService.updateMember(memberDTO);
			return "redirect:/mypage";
		}
		return "redirect:/mypage";
	}
	
	@PostMapping("mypage/myuserDeletePro")
	public String myuserDeletePro() { //HttpServletRequest requestÅ×½ºÆ®
//		System.out.println(request.getParameter("email")); 
		System.out.println("MyPageController - myuserDeletePro");

		return "";
	}
	
	
}
