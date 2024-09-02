package com.teamproject.service;

import com.teamproject.dao.ProjectDAO;
import com.teamproject.domain.ProjectDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProjectService {

    @Autowired
    private ProjectDAO projectDAO;

    public List<ProjectDTO> getProject(){
        return projectDAO.getProject_all();
    }


}
