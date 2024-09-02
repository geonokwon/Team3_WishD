package com.teamproject.controller;

import com.teamproject.domain.ProjectDTO;
import com.teamproject.service.ProjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
public class ProjectController {

    @Autowired
    private ProjectService projectService;

    @GetMapping("projectFind")
    public String projectFind(Model model){
        //페이지네이션 처리도 함께 들어가야함
//        List<ProjectDTO> projectDTOList = projectService.getProject();
//        model.addAttribute("projectDTOList", projectDTOList);
        return "/project/project_find";
    }
    @GetMapping("projectRead")
    public String projectRead(){
        return "/project/project_read";
    }
}
