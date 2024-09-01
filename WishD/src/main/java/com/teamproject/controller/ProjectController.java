package com.teamproject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ProjectController {

    @GetMapping("projectFind")
    public String projectFind(){
        return "/project/project_find";
    }
    @GetMapping("projectRead")
    public String projectRead(){
        return "/project/project_read";
    }
}
