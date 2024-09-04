package com.teamproject.dao;

import com.teamproject.domain.ProjectDTO;
import com.teamproject.domain.ProjectPageDTO;
import com.teamproject.domain.ProjectSkillDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ProjectDAO {

    //mybatis 객체 생성
    @Autowired
    private SqlSession sqlSession;

    private final String projectMapper = "com.teamproject.mapper.ProjectMapper.";

    //프로젝트 전체 가져오기
    public List<ProjectDTO> getProject_all(ProjectPageDTO projectPageDTO){
        return sqlSession.selectList(projectMapper + "selectProject_all", projectPageDTO);
    }
    //전체 프로젝트 등록된 개수 가져오기
    public int getProjectCount(ProjectPageDTO projectPageDTO){
        return sqlSession.selectOne(projectMapper + "getProjectCount", projectPageDTO);
    }

    //가져올 프로젝트에 선택된 스킬들 포함
    public List<ProjectSkillDTO> getProjectSkill(Long pboard_id){
        return sqlSession.selectList(projectMapper + "selectProjectSkill", pboard_id);
    }
    //전체 스킬 리스트 반환
    public List<ProjectSkillDTO> getProjectSkillList() {
        return sqlSession.selectList(projectMapper + "getProjectSkillList");
    }
}
