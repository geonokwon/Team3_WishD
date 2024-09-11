package com.teamproject.dao;

import com.teamproject.domain.ProjectDTO;
import com.teamproject.domain.ProjectPageDTO;
import com.teamproject.domain.ProjectRequestDTO;
import com.teamproject.domain.ProjectSkillDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;
import java.util.logging.Logger;

@Repository
public class ProjectDAO {
    public static final Logger logger = Logger.getLogger(ProjectDAO.class.getName());

    //mybatis 객체 생성
    @Autowired
    private SqlSession sqlSession;
    private final String nameSpace = "com.teamproject.mapper.ProjectMapper.";

    //프로젝트 전체 가져오기
    public List<ProjectDTO> getProject_all(ProjectPageDTO projectPageDTO){
        logger.info("-> getProject_all()");
        return sqlSession.selectList(nameSpace + "selectProject_all", projectPageDTO);
    }

    //전체 프로젝트 등록된 개수 가져오기
    public int getProjectCount(ProjectPageDTO projectPageDTO){
        logger.info("-> getProjectCount()");
        return sqlSession.selectOne(nameSpace + "getProjectCount", projectPageDTO);
    }

    //프로젝트 board 에 선택된 스킬들 포함
    public List<ProjectSkillDTO> getProjectSkill(Long pboard_id){
        logger.info("-> getProjectSkill()");
        return sqlSession.selectList(nameSpace + "selectProjectSkill", pboard_id);
    }

    //전체 스킬 리스트 반환
    public List<ProjectSkillDTO> getProjectSkillList() {
        logger.info("-> getProjectSkillList()");
        return sqlSession.selectList(nameSpace + "getProjectSkillList");
    }

    //projectRead 선택된 프로젝트 가져오기
    public ProjectDTO getProject(Long pboard_id){
        logger.info("-> getProject()");
        return sqlSession.selectOne(nameSpace + "getProject", pboard_id);
    }
    //projectRead 선택된 프로젝트에 등록된 스킬 가져오기
    public List<ProjectSkillDTO> getSkill(Long pboard_id) {
        logger.info("-> getSkill()");
        return sqlSession.selectList(nameSpace + "getSkill", pboard_id);
    }

    //projectWrite 프로젝트 등록하기
    public void insertProject(ProjectDTO projectDTO) {
        logger.info("-> getProject()");
        //등록과 동시에 ProjectDTO 의 pboard_id 값을 반환하여 DTO에 저장한 해준다
        sqlSession.insert(nameSpace + "insertProject", projectDTO);
    }

    //프로젝트 등록시 선택 스킬 projectSkill table 에 삽입
    public void insertProjectSkill(Map<String, Object> projectSkill) {
        sqlSession.insert(nameSpace + "insertProjectSkill", projectSkill);
    }

    //프로젝트 리퀘스트 폼 등록하기
    public void insertProjectRequest(ProjectRequestDTO projectRequestDTO) {
        sqlSession.insert(nameSpace + "insertProjectRequest", projectRequestDTO);
    }

    public void insetProjectRequestSkill(Map<String, Object> projectRequestSkillSet) {
        sqlSession.insert(nameSpace + "insetProjectRequestSkill", projectRequestSkillSet);
    }

    public void updateProjectState(Long pboardId) {
        sqlSession.update(nameSpace + "updateProjectState", pboardId);
    }
}
