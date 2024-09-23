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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.teamproject.domain.FreelancerDTO;
import com.teamproject.domain.FreelancerPageDTO;
import com.teamproject.domain.FreelancerRequestDTO;
import com.teamproject.domain.FreelancerRequestFileDTO;
import com.teamproject.domain.ProjectRequestDTO;
import com.teamproject.domain.ProjectRequestFileDTO;
import com.teamproject.service.FreelancerService;
import com.teamproject.utils.PaginationUtils;




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
        
        //페이지네이션 처리(utils paginationUtils 클래스)
        PaginationUtils.pagination(freelancerPageDTO, pageNum, pageSize, pageBlock);


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
        model.addAttribute("freelancerJobList", freelancerService.getJobList());
        
        //session 에서 user_no 가져오기
        Long user_no = (Long) session.getAttribute("user_no");
        
        System.out.println("프리랜서 읽기 freelancerDTO" + freelancerDTO);
        if (user_no != null) {
            if (freelancerDTO.getFreelancer_state().equals("완료")){
            	System.out.println("완료");
                return "redirect:/chatting/" + freelancer_id;
            }
            //선택된 freelancer_id 가 진행중 인지 구직중 인지 조회
            System.out.println("user_no != null");
            if (freelancerDTO.getFreelancer_state().equals("진행중")) {
                //진행중 이라면 ?
                //request_client 테이블에 작성을 했으니
                //매칭하기 버튼 안뜨고 바로 폼테그 보여주면서 input 안에 값들을 전부 채워넣기 modal 이용해서 DTO 넘겨주기
                //그러면 먼저 여기 페이지 올때 디비 freelancer_id로 조회해서 state 값이 '구직중' '진행중' 인지 확인하기.
                FreelancerRequestDTO freelancerRequestDTO = freelancerService.getRequestClient(freelancer_id);
                System.out.println("freelancerRequestDTO.toString()" + freelancerRequestDTO.toString());

                //user_no 가 글 작성자 인지 판단!
                if (freelancerDTO.getUser_no().longValue() == user_no || freelancerRequestDTO.getUser_no().longValue() == user_no) {
                    //freelancerRequest_file 도 불러와서 같이 줘야한다
                    FreelancerRequestFileDTO freelancerRequestFileDTO = freelancerService.getFreelancerRequestFile(freelancer_id);
                    System.out.println(freelancerRequestFileDTO.toString());
                    //여기서 페이로 올때 확인하고 있으니까 ? 진행중일때 불러와서 modal에 담아서 front 단으로 넘기자
                    model.addAttribute("freelancerRequestDTO", freelancerRequestDTO);
                    System.out.println("freelancerRequestDTO = " +freelancerRequestDTO);
                    model.addAttribute("freelancerRequestFileDTO", freelancerRequestFileDTO);
                }
                else {
                    return "redirect:/freelancerFind";
                }
            }
        }
        
        return "/freelancer/freelancer_read";
    }

    //비동기 처리
    //request_freelancer 저장
    @PostMapping("/freelancerReadReq/{freelancer_id}")
    @ResponseBody
    public String freelancerReadRequest(@PathVariable("freelancer_id")Long freelancer_id,
                                     HttpSession session,
                                     FreelancerRequestFileDTO freelancerRequestFileDTO,
                                     FreelancerRequestDTO freelancerRequestDTO,
                                     Model model) throws Exception {
        System.out.println("비동기 freelancerReadReq");
        System.out.println("비동기에서 freelancerRequestDTO = " + freelancerRequestDTO);
        System.out.println("비동기에서 freelancerRequestFileDTO= " + freelancerRequestFileDTO);
        freelancerRequestDTO.setFreelancer_id(freelancer_id);
        freelancerRequestDTO.setUser_no((Long) session.getAttribute("user_no"));
        freelancerService.insertFreelancerRequest(freelancerRequestDTO, freelancerRequestFileDTO);
        return "true";
    }
    
    //프로젝트 request 관리자 승인후 form 데이터 보고 취소시
    @GetMapping("/freelancerReqFalse/{freelancer_id}")
    public String freelancerReqFalse(@PathVariable("freelancer_id")Long freelancer_id){
        

    	freelancerService.deleteFreelancerRequest(freelancer_id);
        return "redirect:/freelancerRead/" + freelancer_id;
    }
}