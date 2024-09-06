package com.teamproject.controller;

import com.teamproject.domain.ProjectDTO;
import com.teamproject.domain.ProjectPageDTO;
import com.teamproject.service.ProjectService;
import com.teamproject.utils.PaginationUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

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

        //프로젝트 등록 개수 전체 가져오기(나중에 state 가 진행중인것만 가져와야함!)
        projectPageDTO.setCount(projectService.getProjectCount(projectPageDTO));
        //페이지네이션 처리(utils paginationUtils 클래스)
        PaginationUtils.pagination(projectPageDTO, pageNum, pageSize, pageBlock);


        //page 스킬필터 조회시 필요한 전체 스킬 데이터
        model.addAttribute("projectSkillList", projectService.getSkillList());
        //현재 sort 상태 값 처리
        model.addAttribute("sortState",sort);
        //project_find page 글 개수 10개씩 가져옴
        model.addAttribute("projectDTOList", projectService.getProjectList(projectPageDTO));
        model.addAttribute("projectPageDTOList", projectPageDTO);

        return "/project/project_find";
    }

    @GetMapping("/projectRead/{pboard_id}")
    public String projectRead(@PathVariable("pboard_id")Long pboard_id, Model model){
        logger.info("-> projectRead()");
        //선택된 pboard_id 값으로 프로젝트 등록 글 가져오기
        ProjectDTO projectDTO = projectService.getProject(pboard_id);
        model.addAttribute("projectDTO", projectDTO);
        return "/project/project_read";
    }

    @GetMapping("/projectWrite")
    public String projectWrite(Model model){
        logger.info("-> projectWrite()");
        //전체스킬 조회시 필요한 전체 스킬 데이터
        model.addAttribute("projectSkillList", projectService.getSkillList());
        return "/project/project_write";
    }
    @PostMapping("/projectWritePro")
    public String projectWirtePro(ProjectDTO projectDTO, Model model){
        logger.info("-> projectWrite()");
        System.out.println(projectDTO.toString());

        return "redirect:/projectFind";
    }
}
