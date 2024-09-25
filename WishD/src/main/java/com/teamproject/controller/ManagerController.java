package com.teamproject.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.teamproject.domain.*;
import com.teamproject.service.FreelancerService;
import com.teamproject.service.ManagerService;
import com.teamproject.service.ProjectService;

@Controller
@RequestMapping("/manager")
public class ManagerController {
	
	@Inject
	private ManagerService managerService;
	@Inject
	private ProjectService projectService;
	@Inject
	private FreelancerService freelancerService;
	
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
//	요청 받은 프로젝트와 요청한 프리랜서의 상세 내용
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

        //여기서 페이지 로 올때 확인하고 있으니까 ? 진행중일때 불러와서 modal에 담아서 front 단으로 넘기자
        model.addAttribute("projectRequestDTO", projectRequestDTO);
        model.addAttribute("projectRequestFileDTO", projectRequestFileDTO);
        return "/manager/managerProjectDetail";
    }
	
//	요청 받은 프리랜서와 요청한 프로젝트의 상세 내용
	@GetMapping("/freelancerRead/{freelancer_id}")
    public String freelancerRead(@PathVariable("freelancer_id")Long freelancer_id, HttpSession session, Model model){
		if(managerCert(session)) return "redirect:/";
		
		System.out.println("managerProjectRead()");
		
        //선택된 pboard_id 값으로 프로젝트 등록 글 가져오기
        FreelancerDTO freelancerDTO = freelancerService.getFreelancer(freelancer_id);
        System.out.println(freelancerDTO.toString());
        model.addAttribute("freelancerDTO", freelancerDTO);
        model.addAttribute("freelancerSkillList",freelancerService.getSkillList());
        
        //진행중 이라면 ?
        //request_freelancer 테이블에 작성을 했으니
        //매칭하기 버튼 안뜨고 바로 폼테그 보여주면서용 input 안에 값들을 전부 채워넣기 modal 로 DTO 넘겨주기(내가 요청한 글)

        FreelancerRequestDTO freelancerRequestDTO = freelancerService.getRequestClient(freelancer_id);

        //projectRequest_file 도 불러와서 같이 줘야한다
        FreelancerRequestFileDTO freelancerRequestFileDTO = freelancerService.getFreelancerRequestFile(freelancer_id);

        //여기서 페이지 로 올때 확인하고 있으니까 ? 진행중일때 불러와서 modal에 담아서 front 단으로 넘기자
        model.addAttribute("freelancerRequestDTO", freelancerRequestDTO);
        model.addAttribute("projectRequestFileDTO", freelancerRequestFileDTO);
        return "/manager/managerFreelancerDetail";
    }
	
//	요청 프리랜서 승인하기
	@PostMapping("freelancerApprove/{pboard_id}")
    public String freelancerApprove(@PathVariable("pboard_id")Long pboard_id, HttpSession session){
		if(managerCert(session)) return "redirect:/";
		
		managerService.freelancerApprove(pboard_id);
        
        return "redirect:/manager/managerApFreelancer";
    }
	
//	요청 프리랜서 승인 거부하기
	@GetMapping("/freelancerDeny/{pboard_id}")
    public String freelancerDeny(@PathVariable("pboard_id")Long pboard_id, HttpSession session){
		if(managerCert(session)) return "redirect:/";
		
        projectService.deleteProjectRequest(pboard_id);
        
        return "redirect:/manager/managerApFreelancer";
    }
	
//	요청 프로젝트 승인하기
	@PostMapping("projectApprove/{freelancer_id}")
    public String projectApprove(@PathVariable("freelancer_id")Long freelancer_id, HttpSession session){
		if(managerCert(session)) return "redirect:/";
		
		managerService.projectApprove(freelancer_id);
        
        return "redirect:/manager/managerApProject";
    }
	
//	요청 프로젝트 거부하기
	@GetMapping("/projectDeny/{freelancer_id}")
    public String projectDeny(@PathVariable("freelancer_id")Long freelancer_id, HttpSession session){
		if(managerCert(session)) return "redirect:/";
		
        freelancerService.deleteFreelancerRequest(freelancer_id);
        
        return "redirect:/manager/managerApProject";
    }
	
//	공지사항 목록
	@GetMapping("/managerNotice")
	public String managerNotice(HttpServletRequest request, Model model, HttpSession session) {
		if(managerCert(session)) return "redirect:/";
		
		System.out.println("managerNotice");
		
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
		
		List<CommunityDTO> NcoList = managerService.getNcoList(pageDTO);
		
		int count = managerService.getNcoCount(pageDTO);
		
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
		
		model.addAttribute("NcoList", NcoList);
		model.addAttribute("pageDTO", pageDTO);
		
		return "/manager/managerNotice";
	}
	
//질문 게시판 목록
	@GetMapping("/managerQnA")
	public String managerQnA(HttpServletRequest request, Model model, HttpSession session) {
		if(managerCert(session)) return "redirect:/";
		
		System.out.println("managerQnA");
		
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
		
		List<CommunityQnaDTO> QcoList = managerService.getQcoList(pageDTO);
		
		int count = managerService.getQcoCount(pageDTO);
		
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
		
		model.addAttribute("QcoList", QcoList);
		model.addAttribute("pageDTO", pageDTO);
		
		return "/manager/managerQnA";
	}
	
//	회원 리스트 호출
	@GetMapping("/managerUserList")
	public String userList(HttpServletRequest request, Model model, HttpSession session) {
		if(managerCert(session)) return "redirect:/";
		
		System.out.println("managerUserList()");
		
		String pageNum = request.getParameter("pageNum");
		String search = request.getParameter("search");
		
		System.out.println(search);
		
		if(pageNum == null) {
			pageNum = "1";
		}
		
		if(search == null||search == "") {
			search = "0";
		}
		
		int currentPage = Integer.parseInt(pageNum);
		int pageSize = 20;
		
		PageDTO pageDTO = new PageDTO();
		
		pageDTO.setPageNum(pageNum);
		pageDTO.setCurrentPage(currentPage);
		pageDTO.setPageSize(pageSize);
		
		long key = Long.parseLong(search);
		if(key!=0) {
			pageDTO.setKey(key);
		}
		
		List<MemberDTO> userList = managerService.getUserList(pageDTO);
		
		int count = managerService.getUserCount(pageDTO);
		
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
		
		System.out.println(pageDTO.toString());
		
		model.addAttribute("userList", userList);
		model.addAttribute("pageDTO", pageDTO);
		
		return "/manager/managerUserList";
	}
	
//	회원 정보 열람 및 관리
	@GetMapping("/userInfo/{user_no}")
	public String userInfo(@PathVariable("user_no")Long user_no, HttpServletRequest request, Model model, HttpSession session) {
		if(managerCert(session)) return "redirect:/";
		
		System.out.println("managerUserInfo()");
		
		MemberDTO userInfo = managerService.getUserInfo(user_no);
		
		model.addAttribute("userInfo", userInfo);
		
		return "/manager/managerUserInfo";
	}
	
//	회원이 작성한 프로젝트 목록
	@GetMapping("/managerUserProList/{user_no}")
	public String userProList(@PathVariable("user_no")Long user_no, HttpServletRequest request, Model model, HttpSession session) {
		if(managerCert(session)) return "redirect:/";
		
		System.out.println("managerUserProList()");
		
		String pageNum = request.getParameter("pageNum");
		
		if(pageNum == null) {
			pageNum = "1";
		}
		
		int currentPage = Integer.parseInt(pageNum);
		int pageSize = 10;
		
		PageDTO pageDTO = new PageDTO();
		
		pageDTO.setPageNum(pageNum);
		pageDTO.setCurrentPage(currentPage);
		pageDTO.setPageSize(pageSize);
		pageDTO.setKey(user_no);
		
		List<ProjectDTO> projectList = managerService.getUserProList(pageDTO);
		
		int count = managerService.getUserProCount(pageDTO);
		
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
		
		System.out.println(pageDTO.toString());
		
		model.addAttribute("projectList", projectList);
		model.addAttribute("pageDTO", pageDTO);
		
		MemberDTO userInfo = managerService.getUserInfo(user_no);
		
		model.addAttribute("userInfo", userInfo);
		
		return "/manager/managerUserProjectList";
	}
	
//	회원이 작성한 프리랜서 목록
	@GetMapping("/managerUserFreeList/{user_no}")
	public String userFreeList(@PathVariable("user_no")Long user_no, HttpServletRequest request, Model model, HttpSession session) {
		if(managerCert(session)) return "redirect:/";
		
		System.out.println("managerUserFreeList()");
		
		String pageNum = request.getParameter("pageNum");
		
		if(pageNum == null) {
			pageNum = "1";
		}
		
		int currentPage = Integer.parseInt(pageNum);
		int pageSize = 10;
		
		PageDTO pageDTO = new PageDTO();
		
		pageDTO.setPageNum(pageNum);
		pageDTO.setCurrentPage(currentPage);
		pageDTO.setPageSize(pageSize);
		pageDTO.setKey(user_no);
		
		List<FreelancerDTO> freelancerList = managerService.getUserFreeList(pageDTO);
		
		int count = managerService.getUserFreeCount(pageDTO);
		
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
		
		System.out.println(pageDTO.toString());
		
		model.addAttribute("freelancerList", freelancerList);
		model.addAttribute("pageDTO", pageDTO);
		
		MemberDTO userInfo = managerService.getUserInfo(user_no);
		
		model.addAttribute("userInfo", userInfo);
		
		return "/manager/managerUserFreelancerList";
	}
	
//	회원이 작성한 질문 글 목록
	@GetMapping("/managerUserQnaList/{user_no}")
	public String userQnaList(@PathVariable("user_no")Long user_no, HttpServletRequest request, Model model, HttpSession session) {
		if(managerCert(session)) return "redirect:/";
		
		System.out.println("managerUserQnaList()");
		
		String pageNum = request.getParameter("pageNum");
		
		if(pageNum == null) {
			pageNum = "1";
		}
		
		int currentPage = Integer.parseInt(pageNum);
		int pageSize = 10;
		
		PageDTO pageDTO = new PageDTO();
		
		pageDTO.setPageNum(pageNum);
		pageDTO.setCurrentPage(currentPage);
		pageDTO.setPageSize(pageSize);
		pageDTO.setKey(user_no);
		
		List<CommunityQnaDTO> qnaList = managerService.getUserQnaList(pageDTO);
		
		int count = managerService.getUserQnaCount(pageDTO);
		
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
		
		System.out.println(pageDTO.toString());
		
		model.addAttribute("qnaList", qnaList);
		model.addAttribute("pageDTO", pageDTO);
		
		MemberDTO userInfo = managerService.getUserInfo(user_no);
		
		model.addAttribute("userInfo", userInfo);
		
		return "/manager/managerUserQnaList";
	}
	
//	회원을 차단함
	@GetMapping("blackUser/{user_no}")
    public String blackUser(@PathVariable("user_no")Long user_no, HttpSession session){
		if(managerCert(session)) return "redirect:/";
		
		managerService.blackUser(user_no);
        
        return "redirect:/manager/userInfo/{user_no}";
    }
	
//	회원 차단을 해제함
	@GetMapping("whiteUser/{user_no}")
    public String whiteUser(@PathVariable("user_no")Long user_no, HttpSession session){
		if(managerCert(session)) return "redirect:/";
		
		managerService.whiteUser(user_no);
        
        return "redirect:/manager/userInfo/{user_no}";
    }
	
//	차단된 유저 목록
	@GetMapping("/managerBlackList")
	public String blackList(HttpServletRequest request, Model model, HttpSession session) {
		if(managerCert(session)) return "redirect:/";
		
		System.out.println("managerBlackList()");
		
		String pageNum = request.getParameter("pageNum");
		String search = request.getParameter("search");
		
		System.out.println(search);
		
		if(pageNum == null) {
			pageNum = "1";
		}
		
		if(search == null||search == "") {
			search = "0";
		}
		
		int currentPage = Integer.parseInt(pageNum);
		int pageSize = 20;
		
		PageDTO pageDTO = new PageDTO();
		
		pageDTO.setPageNum(pageNum);
		pageDTO.setCurrentPage(currentPage);
		pageDTO.setPageSize(pageSize);
		
		long key = Long.parseLong(search);
		if(key!=0) {
			pageDTO.setKey(key);
		}
		
		List<MemberDTO> blackList = managerService.getBlackList(pageDTO);
		
		int count = managerService.getBlackCount(pageDTO);
		
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
		
		System.out.println(pageDTO.toString());
		
		model.addAttribute("blackList", blackList);
		model.addAttribute("pageDTO", pageDTO);
		
		return "/manager/managerUserBList";
	}
	
//	기술 관리 페이지
	@GetMapping("/managerSkillList")
	public String skillList(HttpServletRequest request, Model model, HttpSession session) {
		if(managerCert(session)) return "redirect:/";
		
		System.out.println("managerSkillList()");
		
		String pageNum = request.getParameter("pageNum");
		String search = request.getParameter("search");
		
		System.out.println(search);
		
		if(pageNum == null) {
			pageNum = "1";
		}
		
		int currentPage = Integer.parseInt(pageNum);
		int pageSize = 10;
		
		PageDTO pageDTO = new PageDTO();
		
		pageDTO.setPageNum(pageNum);
		pageDTO.setCurrentPage(currentPage);
		pageDTO.setPageSize(pageSize);

		if(!(search == null||search == "")) {
			pageDTO.setSearch(search);
		}
		
		List<SkillDTO> skillList = managerService.getSkillList(pageDTO);
		
		int count = managerService.getSkillCount(pageDTO);
		
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
		
		System.out.println(pageDTO.toString());
		
		model.addAttribute("skillList", skillList);
		model.addAttribute("pageDTO", pageDTO);
		
		return "/manager/managerSkillList";
	}
	
//	기술을 삽입함
	@PostMapping("managerInsertSkill")
    public String insertSkill(HttpServletRequest request, HttpSession session){
		if(managerCert(session)) return "redirect:/";
		
		managerService.insertSkill(request.getParameter("newItem"));
        
        return "redirect:/manager/managerSkillList";
    }
	
//	직무 관리 페이지
	@GetMapping("/managerJobList")
	public String jobList(HttpServletRequest request, Model model, HttpSession session) {
		if(managerCert(session)) return "redirect:/";
		
		System.out.println("managerJobList()");
		
		String pageNum = request.getParameter("pageNum");
		String search = request.getParameter("search");
		
		System.out.println(search);
		
		if(pageNum == null) {
			pageNum = "1";
		}
		
		int currentPage = Integer.parseInt(pageNum);
		int pageSize = 10;
		
		PageDTO pageDTO = new PageDTO();
		
		pageDTO.setPageNum(pageNum);
		pageDTO.setCurrentPage(currentPage);
		pageDTO.setPageSize(pageSize);

		if(!(search == null||search == "")) {
			pageDTO.setSearch(search);
		}
		
		List<JobDTO> jobList = managerService.getJobList(pageDTO);
		
		int count = managerService.getJobCount(pageDTO);
		
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
		
		System.out.println(pageDTO.toString());
		
		model.addAttribute("jobList", jobList);
		model.addAttribute("pageDTO", pageDTO);
		
		return "/manager/managerJobList";
	}
	
//	직무를 삽입함
	@PostMapping("managerInsertJob")
    public String insertJob(HttpServletRequest request, HttpSession session){
		if(managerCert(session)) return "redirect:/";
		
		managerService.insertJob(request.getParameter("newItem"));
        
        return "redirect:/manager/managerJobList";
    }
	
//	계정에 관리자 권한 부여
	@GetMapping("/adminOn/{user_no}")
    public String adminOn(@PathVariable("user_no")Long user_no, HttpSession session){
		if(managerCert(session)) return "redirect:/";
		
		managerService.adminOn(user_no);
        
        return "redirect:/manager/userInfo/{user_no}";
    }
	
//	계정에 관리자 권한 해제
	@GetMapping("/adminOff/{user_no}")
    public String adminOff(@PathVariable("user_no")Long user_no, HttpSession session){
		if(managerCert(session)) return "redirect:/";
		
		managerService.adminOff(user_no);
        
        return "redirect:/manager/userInfo/{user_no}";
    }
	
}
