package com.teamproject.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;


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
			return "redirect:/login";
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
	
//	// 회원가입시 이메일 중복체크 
//	// 응답을 받기 위해서 @ResponseBody 사용 
//	@PostMapping("/emil-check")
//	public @ResponseBody String emailCheck(@RequestParam("user_email")String user_email) {
//		System.out.println("MemberController emailCheck()");
//		// DB 에서 체크한 결과를 String 으로 받아와서 return 해준다.
//		String checkResult = memberService.emailCheck(user_email);
//		return checkResult;
//	}
//	
//	

	// 아이디 찾기
	@GetMapping("/idFind")
	public String idFind() {
		System.out.println("MemberController idFind()");
		return "/member/idFind";
	}
	

	@PostMapping("/idFindPro")
	public String idFindPro(MemberDTO memberDTO, Model model) {
		
		System.out.println("MemberController idFindPro()");
		memberDTO = memberService.idFind(memberDTO);
		
		if(memberDTO != null) { // 아이디가 있으면 model에 데이터 담아서 결과화면
			model.addAttribute("memberDTO", memberDTO);
			return "/member/idResult";
		}
		else {
			// 아이디가 없으면 에러 메시지를 model에 담아 아이디 찾기 화면으로 
	        model.addAttribute("errorMessage", "일치하는 아이디가 없습니다.");
	        return "member/idFind";
		}
	}
	
	// 비밀번호 찾기
	@GetMapping("/passFind")
	public String passFind() {
		System.out.println("MemberController passFind()");
		return "/member/passFind";
		
	}
	
	@PostMapping("/passFindPro")
	public String passFindPro(MemberDTO memberDTO, Model model) {
		
		System.out.println("MemberController passFindPro()");
		memberDTO = memberService.passFind(memberDTO);
		
		if(memberDTO != null) { // 비밀번호가 있으면 model 데이터 담아서 결과화면으로 이동
			
			model.addAttribute("memberDTO", memberDTO);
			return "/member/passResult";
			
		}
		else {
			
			// 아이디가 없으면 에러 메시지를 model에 담아 비밀번호 찾기 화면으로 
	        model.addAttribute("errorMessage", "일치하는 비밀번호가 없습니다.");
	        return "/member/passFind";
		}
		
		
		
	}
	
	
	
	
	
	
	
	
	
}//클래스 
	
	
	
	
	
	
	
