package com.teamproject.service;

import com.teamproject.dao.ProjectDAO;
import com.teamproject.domain.ProjectDTO;
import com.teamproject.domain.ProjectPageDTO;
import com.teamproject.domain.ProjectSkillDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class ProjectService {

    @Autowired
    private ProjectDAO projectDAO;

    //전체 프로젝트 등록 List 불러오기
    public List<ProjectDTO> getProject(ProjectPageDTO projectPageDTO){
        System.out.println("projectService -> getProject()");
        //시작하는 행 번호 구하기
        int startRow = (projectPageDTO.getCurrentPage() - 1) * projectPageDTO.getPageSize() + 1;
        //끝나는 행 번호 구하기
        int endRow = startRow + projectPageDTO.getPageSize() - 1;
        //DB 에 Limit 시작하는 행번호 - 1, 글개수
        projectPageDTO.setStartRow(startRow - 1);
        projectPageDTO.setEndRow(endRow);

        //projectDTO 사용자가 등록한 board 를 가져옴
        List<ProjectDTO> projectDTOList = projectDAO.getProject_all(projectPageDTO);
        for (ProjectDTO projectDTO : projectDTOList) {
            //가져온 projectDTO.getPboard() board에 선택된 스킬들을 List 형태로 받음
            List<ProjectSkillDTO> projectSkillDTOList = projectDAO.getProjectSkill(projectDTO.getPboard_id());
            //skill board_id 값들만 체크해서 list 형태로 저장한 후 반환
            projectDTO.setSkills(projectSkillDTOList);
        }
        return projectDTOList;
    }

    //총 프로젝트 등록 개수 가져오기
    public int getProjectCount(ProjectPageDTO projectPageDTO){
        System.out.println("projectService -> getProjectCount()");
        return projectDAO.getProjectCount(projectPageDTO);
    }
    public List<ProjectSkillDTO> getSkillList() {
        return projectDAO.getProjectSkillList();
    }
}
