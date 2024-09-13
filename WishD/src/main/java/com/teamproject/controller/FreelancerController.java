package com.teamproject.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.teamproject.domain.FreelancerDTO;
import com.teamproject.domain.FreelancerPageDTO;
import com.teamproject.service.FreelancerService;




@Controller
@RequestMapping("/")
public class FreelancerController {

	@Autowired
	private FreelancerService freelancerService;
	
	// 프리랜서 등록 페이지 이동
	@GetMapping("/freelancer_reg")
	public String freelancer_reg(Model model) {
		System.out.println("freelancer_controller freelancer_reg()");
		//전체스킬 조회시 필요한 전체 스킬 데이터
		model.addAttribute("freelancerSkillList", freelancerService.getSkillList());
		
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
	
	@GetMapping("/freelancerFind")
	public String freelancerFind(@RequestParam(value = "pageNum", defaultValue = "1") int pageNum,
						            @RequestParam(value = "search", required = false) String search,
						            @RequestParam(value = "skill", required = false) Integer skill,
						            @RequestParam(value = "sort", defaultValue = "0") Integer sort,
						            Model model) {
		
		System.out.println("freelancer_controller freelancerFind()");
		
		
//		db에서 등록된 프리랜서들의 정보를 가지고 jsp 이동
//        한 화면에 보여줄 글 개수 설정
        int pageSize = 10;
//        한 화면에 보여줄 페이지 개수 10 설정
        int pageBlock = 10;

        //PageDTO 객체 생성
        FreelancerPageDTO freelancerPageDTO = new  FreelancerPageDTO();
        //검색어
        freelancerPageDTO.setSearch(search);
        //스킬 필터
        freelancerPageDTO.setSkill_id(skill);
        //날짜별 정렬
        freelancerPageDTO.setCreatedDateFilter(sort);

//        프로젝트 등록 개수 전체 가져오기(나중에 state 가 진행중인것만 가져와야함!)
        freelancerPageDTO.setCount(freelancerService.getFreelancerCount(freelancerPageDTO));
        
        
        //pageNum, currentPage, pageSize => 값 저장
        freelancerPageDTO.setCurrentPage(pageNum);
        freelancerPageDTO.setPageSize(pageSize);
        freelancerPageDTO.setPageNum(pageNum + 1);

        //시작하는 페이지 번호 구하기
        int startPage = ((pageNum - 1) / pageBlock) * pageBlock + 1;
        //끝나는 페이지 번호 구하기
        int endPage = startPage + pageBlock - 1;
        //페이지 카운트 구하기
        int pageCount = freelancerPageDTO.getCount() / pageBlock + (freelancerPageDTO.getCount() % pageBlock == 0 ? 0 : 1);
        if (endPage > pageCount) {
            endPage = pageCount;
        }
        //projectPageDTO 셋팅
        freelancerPageDTO.setStartPage(startPage);
        freelancerPageDTO.setEndPage(endPage);
        freelancerPageDTO.setPageCount(pageCount);
        freelancerPageDTO.setPageBlock(pageBlock);

        // 시작하는 행 번호 구하기
        int startRow = (pageNum - 1) * pageSize + 1;
        // 끝나는 행 번호 구하기
        int endRow = startRow + pageSize - 1;
        // DB에 Limit 시작하는 행 번호 - 1, 글 개수 설정
        freelancerPageDTO.setStartRow(startRow - 1);
        freelancerPageDTO.setEndRow(endRow);
		
    	


        //page 스킬필터 조회시 필요한 전체 스킬 데이터
        model.addAttribute("freelancerSkillList", freelancerService.getSkillList());
       
        //현재 sort 상태 값 처리
        model.addAttribute("sortState",sort);
        //project_find page 글 개수 10개씩 가져옴
        model.addAttribute("freelancerDTOList", freelancerService.getFreelancerList(freelancerPageDTO));
        model.addAttribute("freelancerPageDTOList", freelancerPageDTO);
       
        
        System.out.println(freelancerPageDTO.getCurrentPage());
		return "freelancer/freelancer_find";
	}
	
	
}
