package com.teamproject.controller;

import com.teamproject.domain.ProjectPageDTO;
import com.teamproject.service.ProjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ProjectController {

    @Autowired
    private ProjectService projectService;

    @GetMapping("projectFind")
    public String projectFind(@RequestParam(value = "pageNum", defaultValue = "1") int pageNum,
                              @RequestParam(value = "search", required = false) String search,
                              Model model){
        System.out.println("ProjectController -> projectFind()");
        // 검색어가 빈 문자열이면 null로 처리
        if (search != null && search.trim().isEmpty()) {
            search = null;
        }
        //페이지네이션 처리도 함께 들어가야함

        //한 화면에 보여줄 글 개수 설정
        int pageSize = 10;
        //한 화면에 보여줄 페이지 개수 10 설정
        int pageBlock = 10;
        //PageDTO 객체 생성
        ProjectPageDTO projectPageDTO = new  ProjectPageDTO();
        //pageNum, currentPage, pageSize => 값 저장
        projectPageDTO.setCurrentPage(pageNum);
        projectPageDTO.setPageSize(pageSize);
        projectPageDTO.setPageNum(pageNum + 1);
        //검색어
        projectPageDTO.setSearch(search);


        //프로젝트 등록 개수 전체 가져오기(나중에 state가 진행중인것만 가져와야함!)
        projectPageDTO.setCount(projectService.getProjectCount(projectPageDTO));

        //시작하는 페이지 번호 구하기
        int startPage = ((pageNum - 1) / pageBlock) * pageBlock + 1;
        //끝나는 페이지 번호 구하기
        int endPage = startPage + pageBlock - 1;
        //페이지 카운트 구하기
        int pageCount = projectPageDTO.getCount() / pageBlock + (projectPageDTO.getCount() % pageBlock == 0 ? 0 : 1);
        if (endPage > pageCount) {
            endPage = pageCount;
        }
        projectPageDTO.setStartPage(startPage);
        projectPageDTO.setEndPage(endPage);
        projectPageDTO.setPageCount(pageCount);
        projectPageDTO.setPageBlock(pageBlock);

        //project_find page 스킬별 조회시 필요한 전체 스킬 데이터
        model.addAttribute("projectSkillList", projectService.getSkillList());

        //project_find page 글 개수 10개씩 가져옴
        model.addAttribute("projectDTOList", projectService.getProject(projectPageDTO));
        model.addAttribute("projectPageDTOList", projectPageDTO);
        //



        return "/project/project_find";
    }

    @GetMapping("projectRead")
    public String projectRead(Model model){
        System.out.println("ProjectController -> projectRead()");
        return "/project/project_read";
    }
    @GetMapping("projectWrite")
    public String projectWirte(Model model){
        return "/project/project_write";
    }
}
