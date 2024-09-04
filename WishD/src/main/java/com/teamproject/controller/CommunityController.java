package com.teamproject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
	public class CommunityController {

	@GetMapping("Community")
		public String Community() {
		
			return "community/notice";
		}
		
	}

