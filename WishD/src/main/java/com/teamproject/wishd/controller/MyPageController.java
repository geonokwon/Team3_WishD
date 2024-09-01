package com.teamproject.wishd.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.teamproject.wishd.service.MyPageService;

@Controller
@RequestMapping("/")
public class MyPageController {
	
	@Inject
	MyPageService myPageService;
	
	@GetMapping("mypage")
	public String mypage() {
//		System.out.println("MyPageController - mypage");
		return "/mypage/mypage";
	}
	
	@PostMapping("mypage/mypageUpdatePro")
	public String mypageUpdatePro() {
//		System.out.println("MyPageController - mypageUpdatePro");
		return "";
	}
	
	@PostMapping("mypage/myuserDeletePro")
	public String myuserDeletePro() { //HttpServletRequest requestÅ×½ºÆ®
//		System.out.println(request.getParameter("email")); 
		System.out.println("MyPageController - myuserDeletePro");

		return "";
	}
	
	
}
