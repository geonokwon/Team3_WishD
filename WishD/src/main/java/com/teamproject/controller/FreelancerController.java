package com.teamproject.controller;

import java.net.http.HttpRequest;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.teamproject.domain.FreelancerDTO;
import com.teamproject.domain.FreelancerSkillDTO;
import com.teamproject.service.FreelancerService;




@Controller
@RequestMapping("/")
public class FreelancerController {

	@Inject
	private FreelancerService freelancerService;
	
	// 프리랜서 등록 페이지 이동
	@GetMapping("/freelancer_reg")
	public String freelancer_reg() {
		
		System.out.println("freelancer_controller freelancer_reg()");
		return "freelancer/freelancer_reg";
	}
	
	// 프리랜서 등록 처리
	@PostMapping("/freelancer_regPro") 
		public String freelancer_regPro(FreelancerDTO freelancerDTO) {
		System.out.println("freelancer_controller freelancer_regPro()");
		System.out.println(freelancerDTO);

		
		// 프리랜서 등록 처리
//		freelancerService.registFreelancer(freelancerDTO);
		
		return "redirect:/freelancer_reg";
	}
	
	
	
}
