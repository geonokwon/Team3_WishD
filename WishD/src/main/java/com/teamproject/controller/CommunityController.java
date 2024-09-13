package com.teamproject.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.teamproject.domain.CommunityDTO;
import com.teamproject.service.CommunityService;

@Controller
public class CommunityController {

	//BoardService 자동으로 객체 생성
	@Inject
	private CommunityService communityService;
	
	@GetMapping("community")
	public String notice() {
		return "/community/notice";
	}
	
	//글쓰기
	@GetMapping("/notice_write")
	public String noticeWrite() {
	
		return "/community/notice_write";
	}
	
	//글쓰기 처리
	@PostMapping("/notice_writePro")
	public String noticeWritePro(CommunityDTO communityDTO, HttpSession session) {
		System.out.println("CommunityController notice_writePro()");
		System.out.println(communityDTO);
		
		session.getAttribute("user_no");
		
		communityService.insertCommunity(communityDTO);
		
		return "redirect:/community";
		}
		
	
	@GetMapping("notice_update")
	public String noticeUpdate() {
		
		return "community/notice_update";
	}
	
	@GetMapping("qna")
	public String qna() {
		
		return "community/qna";
	}
	
	@GetMapping("qna_write")
	public String qnaWrite() {
		
		return "community/qna_write";
	}
	
	@GetMapping("qna_update")
	public String qnaUpdate() {
		
		return "community/qna_update";
	}

}

