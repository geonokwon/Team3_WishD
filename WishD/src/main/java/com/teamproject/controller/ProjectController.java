package com.teamproject.controller;

import com.teamproject.domain.ProjectDTO;
import com.teamproject.domain.ProjectPageDTO;
import com.teamproject.domain.ProjectRequestDTO;
import com.teamproject.domain.ProjectRequestFileDTO;
import com.teamproject.service.ProjectService;
import com.teamproject.utils.PaginationUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.lang.reflect.Array;
import java.util.Arrays;
import java.util.List;
import java.util.logging.Logger;

@Controller
public class ProjectController {
    private static final Logger logger = Logger.getLogger(ProjectController.class.getName());

    @Autowired
    private ProjectService projectService;



    @GetMapping("/projectFind")
    public String projectFind(@RequestParam(value = "pageNum", defaultValue = "1") int pageNum,
                              @RequestParam(value = "search", required = false) String search,
                              @RequestParam(value = "skill", required = false) Integer skill,
                              @RequestParam(value = "sort", defaultValue = "0") Integer sort,
                              @RequestParam(value = "state", defaultValue = "0") Integer state,
                              Model model){
        logger.info( "-> projectFind()");

        //Map<String, String>으로 사용해서 매핑 받는경우 -> 데이터가 많으면 이렇게 받았을때 깔끔하게 받아볼수 있다!
        //@RequestParam(defaultValue = "0", required = false) Map<String, String> param
        //Integer skill = param.get("skill") == null ? null : Integer.parseInt(param.get("skill")); ;
        //String search = param.get("search") == null ? null : param.get("search");
        //Integer sort = param.get("sort") == null ? null : Integer.parseInt(param.get("sort"));
        //int pageNum = param.get("page") == null ? 1 : Integer.parseInt(param.get("page"));

        //한 화면에 보여줄 글 개수 설정
        int pageSize = 10;
        //한 화면에 보여줄 페이지 개수 10 설정
        int pageBlock = 10;

        //PageDTO 객체 생성
        ProjectPageDTO projectPageDTO = new  ProjectPageDTO();
        //검색어
        projectPageDTO.setSearch(search);
        //스킬 필터
        projectPageDTO.setSkill_id(skill);
        //날짜별 정렬
        projectPageDTO.setCreatedDateFilter(sort);
        //진행중, 모집중 모아보기
        projectPageDTO.setState(state);

        //프로젝트 등록 개수 전체 가져오기(나중에 state 가 진행중인것만 가져와야함!)
        projectPageDTO.setCount(projectService.getProjectCount(projectPageDTO));
        //페이지네이션 처리(utils paginationUtils 클래스)
        PaginationUtils.pagination(projectPageDTO, pageNum, pageSize, pageBlock);

        //page 스킬필터 조회시 필요한 전체 스킬 데이터
        model.addAttribute("projectSkillList", projectService.getSkillList());
        //현재 sort 상태 값 처리
        model.addAttribute("sortState",sort);
        //현재 state 모집중, 진행중 처리
        model.addAttribute("state", state);
        //project_find page 글 개수 10개씩 가져옴
        model.addAttribute("projectDTOList", projectService.getProjectList(projectPageDTO));
        model.addAttribute("projectPageDTOList", projectPageDTO);

        return "/project/project_find";
    }

    @GetMapping("/projectRead/{pboard_id}")
    public String projectRead(@PathVariable("pboard_id")Long pboard_id,
                              HttpSession session,
                              Model model){
        logger.info("-> projectRead()");

        //선택된 pboard_id 값으로 프로젝트 등록 글 가져오기
        ProjectDTO projectDTO = projectService.getProject(pboard_id);
        System.out.println(projectDTO.toString());
        model.addAttribute("projectDTO", projectDTO);
        model.addAttribute("projectSkillList", projectService.getSkillList());
        model.addAttribute("projectJobList", projectService.getJobList());

        //session 에서 user_no 가져오기
        Long user_no = (Long) session.getAttribute("user_no");

        if (user_no != null) {
            if (projectDTO.getPboard_state().equals("완료")){
                return "redirect:/chatting/" + pboard_id;
            }

            //선택된 pboard_id 가 진행중 인지 모집중 인지 조회
            //그러면 먼저 여기 페이지 올때 디비 pboard_id로 조회해서 state 값이 '모집중' '진행중' 인지 확인하기.
            if (projectDTO.getPboard_state().equals("진행중")) {
                //진행중 이라면 ?
                //request_freelancer 테이블에 작성을 했으니
                //매칭하기 버튼 안뜨고 바로 폼테그 보여주면서용 input 안에 값들을 전부 채워넣기 modal 로 DTO 넘겨주기(내가 요청한 글)
                //매칭 상태인지 체크 매칭 상태라면 바로 chatting 으로 넘어가기
                if (projectDTO.getPboard_isMatching()){
                    return "redirect:/chatting/" + pboard_id;
                }

                ProjectRequestDTO projectRequestDTO = projectService.getRequestFreelancer(pboard_id);

                //user_no 가 글 작성자 인지 판단!
                if (projectDTO.getUser_no().longValue() == user_no || projectRequestDTO.getUser_no().longValue() == user_no) {
                    //projectRequest_file 도 불러와서 같이 줘야한다
                    ProjectRequestFileDTO projectRequestFileDTO = projectService.getProjectRequestFile(pboard_id);

                    System.out.println(projectRequestFileDTO.toString());
                    //여기서 페이지 로 올때 확인하고 있으니까 ? 진행중일때 불러와서 modal에 담아서 front 단으로 넘기자
                    System.out.println(projectRequestDTO.toString());
                    model.addAttribute("projectRequestDTO", projectRequestDTO);
                    model.addAttribute("projectRequestFileDTO", projectRequestFileDTO);
                }
                else {
                    return "redirect:/projectFind";
                }
            }
        }
        return "/project/project_read";
    }

    //비동기 처리
    //request_freelancer 저장
    @PostMapping("/projectReadReq/{pboard_id}")
    @ResponseBody
    public String projectReadRequest(@PathVariable("pboard_id")Long pboard_id,
                                     HttpSession session,
                                     ProjectRequestFileDTO projectRequestFileDTO,
                                     ProjectRequestDTO projectRequestDTO,
                                     Model model) throws Exception {
        logger.info("-> projectReadRequest()");
        projectRequestDTO.setPboard_id(pboard_id);
        projectRequestDTO.setUser_no((Long) session.getAttribute("user_no"));
        projectService.insertProjectRequest(projectRequestDTO, projectRequestFileDTO);
        return "true";
    }

    //프로젝트 request 관리자 승인후 form 데이터 보고 취소시
    @GetMapping("/projectReqFalse/{pboard_id}")
    public String projectReqFalse(@PathVariable("pboard_id")Long pboard_id){
        logger.info("-> projectReqFalse()");

        projectService.deleteProjectRequest(pboard_id);
        return "redirect:/projectRead/" + pboard_id;
    }

    @GetMapping("/projectWrite")
    public String projectWrite(HttpSession session,Model model){
        logger.info("-> projectWrite()");
        if (session.getAttribute("user_no") != null) {
            //전체스킬 조회시 필요한 전체 스킬 데이터
            model.addAttribute("projectSkillList", projectService.getSkillList());
            model.addAttribute("projectJobList", projectService.getJobList());
        }
        else {
            return "redirect:/login";
        }
        return "/project/project_write";
    }

    @PostMapping("/projectWrite")
    public String projectWrite(ProjectDTO projectDTO,
                               HttpSession session,
                               Model model){
        logger.info("-> projectWrite()");
        System.out.println(projectDTO.toString());
        projectDTO.setUser_no((Long) session.getAttribute("user_no"));
        projectService.insertProject(projectDTO);
        System.out.println(projectDTO.toString());
        return "redirect:/projectFind";
    }



}
