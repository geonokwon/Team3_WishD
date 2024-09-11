package com.teamproject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import org.springframework.web.bind.annotation.RequestMapping;



@Controller
public class MemberController {
	
	@GetMapping("/login")
	public String login() {  
		System.out.println("LoginController login()");
		
		// WEB-INF/veiws/폴더/파일이름.jsp
		return "/member/login";
	}
	
	
	
	@GetMapping("/insert")
	public String insert() {
		
		System.out.println("LoginController login()");
		
		return "/login/insert";
		
	}
	
//	@PostMapping("/insertPro")
//	public String insertPro(LoginDTO loginDTO) {
//		
//		System.out.println("LoginController loginPro");
//		System.out.println(loginDTO);
//		
//	}

}
