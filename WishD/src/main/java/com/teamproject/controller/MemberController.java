package com.teamproject.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.teamproject.domain.MemberDTO;
import com.teamproject.service.MemberService;


// 통합회원(일반+간편)
@Controller
public class MemberController {
	
	@Inject
	private MemberService memberService;
	
	// 로그인 
	@GetMapping("/login")
	public String login() {  
		System.out.println("MemberController login()");
		return "/member/login";
	}
	
	@PostMapping("/loginPro")
	public String loginPro(MemberDTO memberDTO, HttpSession session) {
		System.out.println("MemberController loginPro");
	
		MemberDTO memberDTO1 = memberService.userCheck(memberDTO);
		
		if(memberDTO1 != null) {
			session.setAttribute("user_no", memberDTO1.getUser_no());
			return "redirect:/";
		}
		else {
			return "/login";
		}	
	}
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
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
		return "redirect:/login";
		
	}
	
//	// 회원가입시 아이디 중복체크
//	@GetMapping("/idCheck")
//	public String idCheck(HttpServletRequest request) {
//		System.out.println("MemberController idCheck()");
//		
//		String id = request.getParameter("id");
//		MemberDTO memberDTO = memberService.getMember(id);
//		
//		String result = "";
//		if(memberDTO != null) {
//			
//			// 존재하는 아이디 O , 아이디 사용 불가
//			result = "iddup";
//		}
//		else {
//			// 존재하는 아이디 X, 아이디 사용 가능
//			result = "idok";
//		}
//		return result; // 결과값 리턴 
//		
//		
//	}
//	
	
	
	
	
	
	
	
	
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
