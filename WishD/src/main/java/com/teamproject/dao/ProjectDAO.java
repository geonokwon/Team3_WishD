package com.teamproject.dao;

import com.teamproject.domain.*;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
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
        System.out.println(projectPageDTO.toString());
        return sqlSession.selectList(nameSpace + "selectProject_all", projectPageDTO);
    }

    //프로젝트 board 에 선택된 스킬들 포함
    public List<ProjectSkillDTO> getProjectSkill(Long pboard_id){
        logger.info("-> getProjectSkill()");
        return sqlSession.selectList(nameSpace + "selectProjectSkill", pboard_id);
    }

    //전체 프로젝트 등록된 개수 가져오기
    public int getProjectCount(ProjectPageDTO projectPageDTO){
        logger.info("-> getProjectCount()");
        return sqlSession.selectOne(nameSpace + "getProjectCount", projectPageDTO);
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
        logger.info("-> insertProject()");
        //등록과 동시에 ProjectDTO 의 pboard_id 값을 반환하여 DTO에 저장한 해준다
        sqlSession.insert(nameSpace + "insertProject", projectDTO);
    }

    //프로젝트 등록시 선택 스킬 projectSkill table 에 삽입
    public void insertProjectSkill(Map<String, Object> projectSkill) {
        logger.info("-> getProjectSkill()");
        sqlSession.insert(nameSpace + "insertProjectSkill", projectSkill);
    }

    //프로젝트 리퀘스트 폼 등록하기
    public void insertProjectRequest(ProjectRequestDTO projectRequestDTO) {
        logger.info("-> getProjectRequest()");
        sqlSession.insert(nameSpace + "insertProjectRequest", projectRequestDTO);
    }
    //프로젝트 리퀘스트 폼 skill 등록하기
    public void insetProjectRequestSkill(Map<String, Object> projectRequestSkillSet) {
        logger.info("-> getProjectRequestSkill()");
        sqlSession.insert(nameSpace + "insetProjectRequestSkill", projectRequestSkillSet);
    }
    //프로젝트 리퀘스트 폼 등록시 pboard_state 값 '진행중' 으로 변경
    public void updateProjectState(Long pboardId) {
        logger.info("-> getProject()");
        sqlSession.update(nameSpace + "updateProjectState", pboardId);
    }

    //프로젝트 리퀘스트 폼 등록시 file 테이블 등록
    public void insetProjectRequestFile(ProjectRequestFileDTO projectRequestFileDTO) {
        logger.info("-> insetProjectRequestFile()");
        sqlSession.insert(nameSpace + "insetProjectRequestFile", projectRequestFileDTO);
    }

    //프로젝트 pboard_state 가 진행중일때 request_freelancer 데이터 가져오기
    public ProjectRequestDTO getRequestFreelancer(Long pboard_id) {
        logger.info("-> getRequestFreelancer()");
        return sqlSession.selectOne(nameSpace + "getRequestFreelancer", pboard_id);
    }

    //request_freelancer 데이터 가져올때 request_skill 테이블에 skill 불러오기
    public List<ProjectSkillDTO> getRequestSkill(Long request_id) {
        logger.info("-> getRequestSkill()");
        return sqlSession.selectList(nameSpace + "getRequestSkill", request_id);
    }

    //request_from 승인요청 시 보여줄 file 정보도 함께 가져간다
    public ProjectRequestFileDTO getProjectRequestFile(Long pboard_id) {
        logger.info("-> getProjectRequestFile()");
        return sqlSession.selectOne(nameSpace + "getProjectRequestFile", pboard_id);
    }

    //매칭 성공시 isMatching true 변경
    public void setProjectIsMatching(Long pboardId) {
        logger.info("-> getProject()");
        sqlSession.update(nameSpace + "setProjectIsMatching", pboardId);
    }

    //request_freelancer 데이터 삭제
    public void deleteProjectRequest(Long pboard_id) {
        logger.info("-> getProject()");
        sqlSession.delete(nameSpace + "deleteProjectRequest", pboard_id);
    }
    //project_board 의 상태값 변경 '모집중'
    public void setBoardState(Long pboardId) {
        logger.info("-> setBoardState()");
        sqlSession.update(nameSpace + "setBoardState", pboardId);
    }

    //session 의 user_no 로 user_name 불러오기
    public String getUserName(Long user_no) {
        logger.info("-> getUserName()");
        return sqlSession.selectOne(nameSpace + "getUserName", user_no);
    }

    //job List 불러오기
    public List<JobDTO> getJobList() {
        logger.info("-> getJobList()");
        return sqlSession.selectList(nameSpace + "getJobList");
    }
}
