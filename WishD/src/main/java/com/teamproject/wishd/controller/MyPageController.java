package com.teamproject.wishd.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/")
public class MyPageController {
	
	@GetMapping("mypage")
	public String mypage() {
		return "/mypage/mypage";
	}
}
