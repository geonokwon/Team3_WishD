package com.teamproject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ProjectFindController {

    @GetMapping("projectFind")
    public String projectFind(){
        return "/project_find/project_find";
    }
    @GetMapping("projectRead")
    public String projectRead(){
        return "/project_find/project_read";
    }
}
