package com.teamproject.controller;



import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.teamproject.domain.FreelancerDTO;
import com.teamproject.domain.FreelancerPageDTO;
import com.teamproject.domain.FreelancerRequestDTO;
import com.teamproject.domain.FreelancerRequestFileDTO;
import com.teamproject.service.FreelancerService;




@Controller
@RequestMapping("/")
public class FreelancerController {

	@Autowired
	private FreelancerService freelancerService;
	
	// 프리랜서 등록 페이지 이동
	@GetMapping("/freelancer_reg")
	public String freelancer_reg(Model model, HttpSession session) {
		System.out.println("freelancer_controller freelancer_reg()");
		
		//회원인 경우에만 프리랜서 등록 가능
        if (session.getAttribute("user_no") != null) {
    		//job 조회시 필요한 모든 job 데이터
    		model.addAttribute("jobList", freelancerService.getJobList());
    		
    		//전체스킬 조회시 필요한 전체 스킬 데이터
    		model.addAttribute("freelancerSkillList", freelancerService.getSkillList());
        }
        else { //회원이 아니면 로그인 페이지로 이동
            return "redirect:/login";
        }
		

		
		return "freelancer/freelancer_reg";
	}
	
	// 프리랜서 등록 처리
	@PostMapping("/freelancer_regPro") 
		public String freelancer_regPro(FreelancerDTO freelancerDTO, HttpSession session) {
		System.out.println("freelancer_controller freelancer_regPro()");
		System.out.println(freelancerDTO);
		
		// 세션에 있는 회원번호를 DTO에 저장
		freelancerDTO.setUser_no((Long) session.getAttribute("user_no"));
		// 프리랜서 등록 처리
		freelancerService.registFreelancer(freelancerDTO);
		
		return "redirect:/";
	}
	
	//프리랜서 찾기 페이지
	@GetMapping("/freelancerFind")
	public String freelancerFind(@RequestParam(value = "pageNum", defaultValue = "1") int pageNum,
						            @RequestParam(value = "search", required = false) String search,
						            @RequestParam(value = "skill", required = false) Integer skill,
						            @RequestParam(value = "sort", defaultValue = "0") Integer sort,
						            @RequestParam(value = "state", defaultValue = "0") Integer state,
						            Model model) {
		
		System.out.println("freelancer_controller freelancerFind()");
		
		
		//db에서 등록된 프리랜서들의 정보를 가지고 jsp 이동
		//한 화면에 보여줄 글 개수 설정
        int pageSize = 10;
        //한 화면에 보여줄 페이지 개수 10 설정
        int pageBlock = 10;

        //PageDTO 객체 생성
        FreelancerPageDTO freelancerPageDTO = new FreelancerPageDTO();
        //검색어
        freelancerPageDTO.setSearch(search);
        //스킬 필터
        freelancerPageDTO.setSkill_id(skill);
        //날짜별 정렬
        freelancerPageDTO.setCreatedDateFilter(sort);
        //진행중, 구직중 모아보기
        freelancerPageDTO.setState(state);
        System.out.println("sort = " + freelancerPageDTO.getCreatedDateFilter());
        System.out.println("state = " + freelancerPageDTO.getState());
       

        //프리랜서 등록 개수 전체 가져오기(나중에 state 가 구직중인것만 가져와야함!)
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
        //freelancerPageDTO 셋팅
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
        model.addAttribute("sort",sort);
        //현재 state 구직중, 진행중 처리
        model.addAttribute("state", state);
        //freelancer_find page 글 개수 10개씩 가져옴
        model.addAttribute("freelancerDTOList", freelancerService.getFreelancerList(freelancerPageDTO));
        model.addAttribute("freelancerPageDTOList", freelancerPageDTO);
       
        
        System.out.println(freelancerPageDTO.getCurrentPage());
		return "freelancer/freelancer_find";
	}
	
	//프리랜서 읽기 페이지
    @GetMapping("/freelancerRead/{freelancer_id}")
    public String freelancerRead(@PathVariable("freelancer_id")Long freelancer_id,
                              HttpSession session,
                              Model model){
        System.out.println("FreelancerController freelancerRead");

        //선택된 freelancer_id 값으로 프로젝트 등록 글 가져오기
        FreelancerDTO freelancerDTO = freelancerService.getFreelancer(freelancer_id);
        model.addAttribute("freelancerDTO", freelancerDTO);
        model.addAttribute("freelancerSkillList", freelancerService.getSkillList());

        //session 에서 user_no 가져오기
        session.setAttribute("user_no", 1L);
        Long user_no = (Long) session.getAttribute("user_no");
        System.out.println("프리랜서 읽기 freelancerDTO" + freelancerDTO);
        if (user_no != null) {
            //선택된 freelancer_id 가 진행중 인지 구직중 인지 조회

            if (freelancerDTO.getFreelancer_state().equals("진행중")) {
                //진행중 이라면 ?
                //request_client 테이블에 작성을 했으니
                //매칭하기 버튼 안뜨고 바로 폼테그 보여주면서 input 안에 값들을 전부 채워넣기 modal 이용해서 DTO 넘겨주기
                //그러면 먼저 여기 페이지 올때 디비 freelancer_id로 조회해서 state 값이 '구직중' '진행중' 인지 확인하기.
                FreelancerRequestDTO freelancerRequestDTO = freelancerService.getRequestClient(freelancer_id);
                System.out.println(freelancerRequestDTO.toString());

                //user_no 가 글 작성자 인지 판단!
                if (freelancerDTO.getUser_no().longValue() == user_no || freelancerRequestDTO.getUser_no().longValue() == user_no) {
                    //freelancerRequest_file 도 불러와서 같이 줘야한다
                    FreelancerRequestFileDTO freelancerRequestFileDTO = freelancerService.getFreelancerRequestFile(freelancer_id);
                    System.out.println(freelancerRequestFileDTO.toString());
                    //여기서 페이로 올때 확인하고 있으니까 ? 진행중일때 불러와서 modal에 담아서 front 단으로 넘기자
                    model.addAttribute("freelancerRequestDTO", freelancerRequestDTO);
                    model.addAttribute("freelancerRequestFileDTO", freelancerRequestFileDTO);
                }
                else {
                    return "redirect:/freelancerFind";
                }
            }
        }
        //없다면 매칭하기 버튼 뜨고 빈 폼테그 보여주기



        return "/freelancer/freelancer_read";
    }

}