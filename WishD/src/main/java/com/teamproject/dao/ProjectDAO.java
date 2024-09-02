package com.teamproject.dao;

import com.teamproject.domain.ProjectDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ProjectDAO {

    //mybatis 객체 생성
    @Autowired
    private SqlSession sqlSession;
    private String projectMapper = "com.teamproject.ProjectMapper.";

    public List<ProjectDTO> getProject_all(){
        return sqlSession.selectList(projectMapper + "selectProject_all");
    }


}
