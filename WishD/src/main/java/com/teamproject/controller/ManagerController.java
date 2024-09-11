package com.teamproject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/manager")
public class ManagerController {
	
	@GetMapping("/managerMain")
	public String managerMain() {
		
		return "/manager/managerMain";
	}
	
}
