package com.teamproject.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.teamproject.domain.*;
import com.teamproject.service.ManagerService;


@Controller
@RequestMapping("/manager")
public class ManagerController {
	
	@Inject
	private ManagerService managerService;
	
//	관리자 계정 확인 메소드
	public boolean managerCert(HttpSession session) {
		Long sessionNo = (Long)session.getAttribute("user_no");
		String sessionRole = (String)session.getAttribute("user_role");
		
		System.out.println(sessionNo+" "+sessionRole);
		
		if(sessionNo == null) {
			return true;
		}
		
		if(sessionRole!=null) {
			if(!sessionRole.equals("admin")) {
				return true;
			}
		}
		
		return false;
	}
	
//	관리자 페이지
	@GetMapping("/managerMain")
	public String managerMain(HttpSession session) {
		if(managerCert(session)) return "redirect:/";
		
		return "/manager/managerMain";
	}
	
//	요청 프로젝트 승인
	@GetMapping("/managerApProject")
	public String apProject(HttpServletRequest request, Model model, HttpSession session) {
		if(!managerCert(session)) return "redirect:/";
		
		String pageNum = request.getParameter("pageNum");
		
		if(pageNum == null) {
			pageNum = "1";
		}
		
		int currentPage = Integer.parseInt(pageNum);
		int pageSize = 20;
		
		PageDTO pageDTO = new PageDTO();
		
		pageDTO.setPageNum(pageNum);
		pageDTO.setCurrentPage(currentPage);
		pageDTO.setPageSize(pageSize);
		
		List<FreelancerRequestDTO> rqcList = managerService.getRqcList(pageDTO);
		
		int count = managerService.getRqcCount(pageDTO);
		
		int pageBlock = 10;
		
		int startPage = (currentPage-1) / pageBlock * pageBlock + 1;
		
		int endPage = startPage + pageBlock - 1;
		
		int pageCount = count / pageSize + (count % pageSize==0?0:1);
		
		if(endPage > pageCount) {
			endPage = pageCount;
		}
		
		pageDTO.setCount(count);
		pageDTO.setPageBlock(pageBlock);
		pageDTO.setStartPage(startPage);
		pageDTO.setEndPage(endPage);
		pageDTO.setPageCount(pageCount);
		
		model.addAttribute("rqcList", rqcList);
		model.addAttribute("pageDTO", pageDTO);
		
		return "/manager/managerProjectApproval";
	}
	
//	요청 프리랜서 승인
	@GetMapping("/managerApFreelancer")
	public String apFreelancer(HttpServletRequest request, Model model, HttpSession session) {
		if(!managerCert(session)) return "redirect:/";
		
		String pageNum = request.getParameter("pageNum");
		
		if(pageNum == null) {
			pageNum = "1";
		}
		
		int currentPage = Integer.parseInt(pageNum);
		int pageSize = 20;
		
		PageDTO pageDTO = new PageDTO();
		
		pageDTO.setPageNum(pageNum);
		pageDTO.setCurrentPage(currentPage);
		pageDTO.setPageSize(pageSize);
		
		List<ProjectRequestDTO> rqfList = managerService.getRqfList(pageDTO);
		
		int count = managerService.getRqfCount(pageDTO);
		
		int pageBlock = 10;
		
		int startPage = (currentPage-1) / pageBlock * pageBlock + 1;
		
		int endPage = startPage + pageBlock - 1;
		
		int pageCount = count / pageSize + (count % pageSize==0?0:1);
		
		if(endPage > pageCount) {
			endPage = pageCount;
		}
		
		pageDTO.setCount(count);
		pageDTO.setPageBlock(pageBlock);
		pageDTO.setStartPage(startPage);
		pageDTO.setEndPage(endPage);
		pageDTO.setPageCount(pageCount);
		
		model.addAttribute("rqfList", rqfList);
		model.addAttribute("pageDTO", pageDTO);
		
		return "/manager/managerFreelancerApproval";
	}
	
//	테스트용 코드
	@GetMapping("/managerTest1")
	public String managerTest1(HttpSession session) {
		if(!managerCert(session)) return "redirect:/";
		
		return "/manager/managerBoardTemp";
	}
	
}
