package com.teamproject.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.teamproject.domain.MemberDTO;
import com.teamproject.service.MemberService;



@Controller
public class MemberController {
	
	@Inject
	private MemberService memberService;
	
	@GetMapping("/login")
	public String login() {  
		
		System.out.println("MemberController login()");

		return "/member/login";
	}
	
	@PostMapping("/loginPro")
	public String loginPro(MemberDTO memberDTO, HttpSession session) {
		System.out.println("MemberController loginPro");
		System.out.println(memberDTO);
		
		memberDTO = memberService.userCheck(memberDTO);
		if(memberDTO != null) {
			
			// 아이디 비밀번호 일치
			// 세션에 로그인 표시값 저장
			session.setAttribute("user_id", memberDTO.getUser_id());
			// 메인 페이지로 이동
			return "redirect:/member/main";	
		} 
		else {
			
			// 아이디 비밀번호 틀림 -> 로그인 페이지로 이동
			return "redirect:/member/login";	
		}
	}
	
	// 회원가입
	@GetMapping("/insert")
	public String insert() {
		
		System.out.println("MemberController insert()");
		
		return "/member/insert";
		
	}
	
	@PostMapping("/insertPro")
	public String insertPro(MemberDTO memberDTO) {
		
		System.out.println("MemberController insertPro");
		System.out.println(memberDTO);
		
		
		memberService.insertMember(memberDTO);
		// 로그인 주소변경 하면서 이동 
		return "redirect:/member/login";
		
	}
	
	// 아이디 찾기
	@GetMapping("/idFind")
	public String idFind() {
		
		System.out.println("MemberController idFind()");
		
		return "/member/idFind";
	}
	
	// 아이디 찾기 결과
		@GetMapping("/idResult")
		public String idResult() {
			
			System.out.println("MemberController idResult()");
			
			return "/member/idResult";
		}

	
	// 비밀번호 찾기
	@GetMapping("/passFind")
	public String passFind() {
		
		System.out.println("MemberController passFind()");
		
		return "/member/passFind";
	}

	// 비밀번호 찾기 결과
	@GetMapping("/passResult")
	public String passResult() {
				
		System.out.println("MemberController passResult()");
				
		return "/member/passResult";
	}
	
}
