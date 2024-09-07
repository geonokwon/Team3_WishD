package com.teamproject.service;

import com.teamproject.dao.ProjectDAO;
import com.teamproject.domain.ProjectDTO;
import com.teamproject.domain.ProjectPageDTO;
import com.teamproject.domain.ProjectSkillDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;
import java.util.logging.Logger;

@Service
public class ProjectService {
    public static final Logger logger = Logger.getLogger(ProjectService.class.getName());
    @Autowired
    private ProjectDAO projectDAO;

    //전체 프로젝트 등록 List 불러오기
    public List<ProjectDTO> getProjectList(ProjectPageDTO projectPageDTO){
        logger.info("-> getProjectList()");
        //projectDTO 사용자가 등록한 board 를 가져옴
        List<ProjectDTO> projectDTOList = projectDAO.getProject_all(projectPageDTO);
        for (ProjectDTO projectDTO : projectDTOList) {
            //가져온 projectDTO.getPboard() board에 선택된 스킬들을 List 형태로 받음
            //skill board_id 값들만 체크해서 list 형태로 저장한 후 반환
            projectDTO.setSkills(projectDAO.getProjectSkill(projectDTO.getPboard_id()));
        }
        return projectDTOList;
    }
    //총 프로젝트 등록 개수 가져오기
    public int getProjectCount(ProjectPageDTO projectPageDTO){
        logger.info("-> getProjectCount()");
        return projectDAO.getProjectCount(projectPageDTO);
    }
    //전체 스킬 리스트 가져오기
    public List<ProjectSkillDTO> getSkillList() {
        logger.info("-> getSkillList()");
        return projectDAO.getProjectSkillList();
    }

    //projectRead > 선택한 프로젝트 와 선택된 프로젝트 pboard_id 기준으로 선택된 skill 가져오가
    public ProjectDTO getProject(Long pboard_id) {
        logger.info("-> getProject()");
        ProjectDTO projectDTO = projectDAO.getProject(pboard_id);
        projectDTO.setSkills(projectDAO.getSkill(pboard_id));
        return projectDTO;
    }

    //프로젝트 등록(insertProject)
    @Transactional
    public void insertProject(ProjectDTO projectDTO) {
        logger.info("-> getProject()");
        //등록하고 등록한 pboard_id값 반환받아서 그 아이디 값으로 project_skill 테이블에 저장
        int pboard_id = projectDAO.insertProject(projectDTO);

        String[] skillList = projectDTO.getSkillList().split(",");

        for (String skill_id : skillList) {
            Map<String, Integer> projectSkillSet = new HashMap<>();
            projectSkillSet.put("pboard_id", pboard_id);
            projectSkillSet.put("skill_id", Integer.parseInt(skill_id));
            projectDAO.insertProjectSkill(projectSkillSet);
        }
    }
}
