package com.teamproject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
	public class CommunityController {

@GetMapping("community")
	public String community() {
		
		return "community/notice";
	}

@GetMapping("notice_write")
public String noticeWrite() {
	
	return "community/notice_write";
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

