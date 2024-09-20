package com.teamproject.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.teamproject.domain.*;
import com.teamproject.service.ManagerService;
import com.teamproject.service.ProjectService;


@Controller
@RequestMapping("/manager")
public class ManagerController {
	
	@Inject
	private ManagerService managerService;
	@Inject
	private ProjectService projectService;
	
//	관리자 계정 확인 메소드
	public boolean managerCert(HttpSession session) {
		Long sessionNo = (Long)session.getAttribute("user_no");
		String sessionRole = (String)session.getAttribute("user_role");
		
		System.out.println(sessionNo+" "+sessionRole);
		
		if(sessionNo == null) {
			System.out.println("Access Denied");
			return true;
		}
		
		if(sessionRole!=null) {
			if(!sessionRole.equals("admin")) {
				System.out.println("Access Denied");
				return true;
			}
		}
		
		return false;
	}
	
//	관리자 페이지
	@GetMapping("/managerMain")
	public String managerMain(HttpSession session) {
		if(managerCert(session)) return "redirect:/";
		
		System.out.println("managerMain()");
		
		return "/manager/managerMain";
	}
	
//	요청 프로젝트 승인
	@GetMapping("/managerApProject")
	public String apProject(HttpServletRequest request, Model model, HttpSession session) {
		if(managerCert(session)) return "redirect:/";
		
		System.out.println("managerApProject");
		
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
		if(managerCert(session)) return "redirect:/";
		
		System.out.println("managerApFreelancer()");
		
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
	
//	ProjectController의 projectRead 메소드를 복사함
	@GetMapping("/projectRead/{pboard_id}")
    public String projectRead(@PathVariable("pboard_id")Long pboard_id, HttpSession session, Model model){
		if(managerCert(session)) return "redirect:/";
		
		System.out.println("managerProjectRead()");
		
        //선택된 pboard_id 값으로 프로젝트 등록 글 가져오기
        ProjectDTO projectDTO = projectService.getProject(pboard_id);
        System.out.println(projectDTO.toString());
        model.addAttribute("projectDTO", projectDTO);
        model.addAttribute("projectSkillList", projectService.getSkillList());
        
        //진행중 이라면 ?
        //request_freelancer 테이블에 작성을 했으니
        //매칭하기 버튼 안뜨고 바로 폼테그 보여주면서용 input 안에 값들을 전부 채워넣기 modal 로 DTO 넘겨주기(내가 요청한 글)

        ProjectRequestDTO projectRequestDTO = projectService.getRequestFreelancer(pboard_id);

        //projectRequest_file 도 불러와서 같이 줘야한다
        ProjectRequestFileDTO projectRequestFileDTO = projectService.getProjectRequestFile(pboard_id);

        System.out.println(projectRequestFileDTO.toString());
        //여기서 페이지 로 올때 확인하고 있으니까 ? 진행중일때 불러와서 modal에 담아서 front 단으로 넘기자
        System.out.println(projectRequestDTO.toString());
        model.addAttribute("projectRequestDTO", projectRequestDTO);
        model.addAttribute("projectRequestFileDTO", projectRequestFileDTO);
        return "/manager/managerProjectDetail";
    }
	
//	테스트용 코드
	@GetMapping("/managerTest1")
	public String managerTest1(HttpSession session) {
		if(managerCert(session)) return "redirect:/";
		
		return "/manager/managerBoardTemp";
	}
	
}
