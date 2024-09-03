package com.teamproject.service;

import com.teamproject.dao.ProjectDAO;
import com.teamproject.domain.ProjectDTO;
import com.teamproject.domain.ProjectSkillDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class ProjectService {

    @Autowired
    private ProjectDAO projectDAO;

    public List<ProjectDTO> getProject(){
        //projectDTO 사용자가 등록한 board 를 가져옴
        List<ProjectDTO> projectDTOList = projectDAO.getProject_all();
        for (ProjectDTO projectDTO : projectDTOList) {
            //가져온 projectDTO.getPboard() board에 선택된 스킬들을 List 형태로 받음
            List<ProjectSkillDTO> projectSkillDTOList = projectDAO.getProjectSkill_all(projectDTO.getPboard_id());
            //skill 값들만 체크해서 list 형태로 저장한 후 반환
            projectDTO.setSkills(projectSkillDTOList);
        }
        return projectDTOList;
    }

    public int getProjectCount(){
        return projectDAO.getProjectCount();
    }



}
