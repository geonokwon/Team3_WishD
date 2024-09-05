package com.teamproject.controller;

import com.teamproject.domain.ProjectPageDTO;
import com.teamproject.service.ProjectService;
import com.teamproject.utils.PaginationUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.logging.Logger;

@Controller
public class ProjectController {
    private static final Logger logger = Logger.getLogger(ProjectController.class.getName());

    @Autowired
    private ProjectService projectService;

    @GetMapping("projectFind")
    public String projectFind(@RequestParam(value = "pageNum", defaultValue = "1") int pageNum,
                              @RequestParam(value = "search", required = false) String search,
                              @RequestParam(value = "skill", required = false) Integer skill,
                              @RequestParam(value = "sort", defaultValue = "0") Integer sort,
                              Model model){
        logger.info( "-> projectFind()");

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
        model.addAttribute("projectDTOList", projectService.getProject(projectPageDTO));
        model.addAttribute("projectPageDTOList", projectPageDTO);

        return "/project/project_find";
    }

    @GetMapping("projectRead")
    public String projectRead(Model model){
        logger.info("-> projectRead()");
        return "/project/project_read";
    }
    @GetMapping("projectWrite")
    public String projectWrite(Model model){
        return "/project/project_write";
    }
}
