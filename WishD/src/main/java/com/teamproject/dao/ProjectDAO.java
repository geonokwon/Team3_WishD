package com.teamproject.dao;

import com.teamproject.domain.ProjectDTO;
import com.teamproject.domain.ProjectSkillDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Objects;

@Repository
public class ProjectDAO {

    //mybatis 객체 생성
    @Autowired
    private SqlSession sqlSession;

    private final String projectMapper = "com.teamproject.mapper.ProjectMapper.";

    //프로젝트 전체 가져오기
    public List<ProjectDTO> getProject_all(){
        return sqlSession.selectList(projectMapper + "selectProject_all");
    }
    //가져올 프로젝트에 선택된 스킬들 포함
    public List<ProjectSkillDTO> getProjectSkill_all(Long pboard_id){
        return sqlSession.selectList(projectMapper + "selectProjectSkill_all", pboard_id);
    }
    //전체 프로젝트 등록된 개수 가져오기
    public int getProjectCount(){
        return sqlSession.selectOne(projectMapper + "getProjectCount");
    }

}
