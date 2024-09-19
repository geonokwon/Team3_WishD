package com.teamproject.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
	
	// 아이디 중복체크
	@GetMapping("/idCheck")
	@ResponseBody
	public String idCheck(HttpServletRequest request) {
		String id = request.getParameter("id");
		System.out.println("아이디 중복 체크: " + id);
		
		// 아이디 중복 여부 확인
		String result = memberService.userIdCheck(id);
		
		if(result != null) {
			// 아이디 중복
			return "iddup"; 
			
		} else {
			// 아이디 사용 가능
			return "idok";
		}
		
	}
	
	// 이메일 중복체크
	@GetMapping("/emailCheck")
	@ResponseBody
	public String emailCheck(HttpServletRequest request) {
		String id = request.getParameter("id");
		System.out.println("이메일 중복체크 : " + id);
		
		// 이메일 중복 여부 확인
		String result = memberService.userEmailCheck(id);
		
		if(result != null) {
			// 이메일 중복
			return "emailDup";
			
		} else {
			// 이메일 사용 가능
			return "emailOk";
		}
		
	}
	
	
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
		
		if(memberDTO != null) { // 아이디가 있으면 model에 데이터 담아서 결과화면 이동
			model.addAttribute("memberDTO", memberDTO);
			return "/member/idResult";
		}
		else {
			// 아이디가 없으면 에러 메시지를 model에 담아서 전달
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
			
			// 아이디가 없으면 에러 메시지를 model에 담아서 찾기화면
	        model.addAttribute("errorMessage", "일치하는 비밀번호가 없습니다.");
	        return "/member/passFind";
		}
		
	}
	
	
	
	
	
}//클래스 
	
	
	
	
	
	
	
