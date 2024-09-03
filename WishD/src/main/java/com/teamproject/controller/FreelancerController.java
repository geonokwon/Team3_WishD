package com.teamproject.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.teamproject.domain.FreelancerDTO;
import com.teamproject.service.FreelancerService;




@Controller
@RequestMapping("/freelancer/*")
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
	@GetMapping("/freelancer_regPro") 
		public String freelancer_regPro(FreelancerDTO freelancerDTO) {
		System.out.println("freelancer_controller freelancer_regPro()");
		
		// 프리랜서 등록 처리
		freelancerService.registFreelancer(freelancerDTO);
		
		return "redirect:/freelancer/freelancer_reg";
	}
	
	
	
	
	
}
