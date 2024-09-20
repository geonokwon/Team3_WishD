package com.teamproject.dao;

import java.util.List;
import java.util.Map;
import java.util.logging.Logger;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.teamproject.domain.FreelancerDTO;
import com.teamproject.domain.FreelancerPageDTO;
import com.teamproject.domain.FreelancerRequestDTO;
import com.teamproject.domain.FreelancerRequestFileDTO;
import com.teamproject.domain.FreelancerSkillDTO;




@Repository
public class FreelancerDAO {
	public static final Logger logger = Logger.getLogger(FreelancerDAO.class.getName());
	
	//마이바티스 객체생성
	@Autowired
	private SqlSession sqlSession;
	private final String nameSpace = "com.teamproject.mapper.FreelancerMapper.";
	
	
	//프리랜서 등록
	public void registFreelancer(FreelancerDTO freelancerDTO) {
		System.out.println("FreelancerDAO regist");
		
		//프리랜서 등록테이블에서 freelancer_id의 max값 구하기
		Long maxNum = sqlSession.selectOne(nameSpace + "getFreelancerMaxNum");

		freelancerDTO.setFreelancer_id(maxNum + 1);
		
		//프리랜서 등록
		sqlSession.insert(nameSpace + "resistFreelancer", freelancerDTO);
		//프리랜서 스킬등록
		sqlSession.insert(nameSpace + "resistFreelancerSkill", freelancerDTO);
	}
	
    //전체 job 반환
    public List<FreelancerDTO> getJobList() {
        logger.info("-> getJobList()");
        return sqlSession.selectList(nameSpace + "getJobList");
    }
	
	
    //freelancer_find - 프리랜서 전체를 가져오면서 각 프리랜서의 이름도 마스킹처리하여 가져오기
    public List<FreelancerDTO> getFreelancer_all(FreelancerPageDTO freelancerPageDTO){
        logger.info("-> getFreelancer_all()");
        return sqlSession.selectList(nameSpace + "selectFreelancer_all", freelancerPageDTO);
    }

    //전체 프리랜서 등록된 개수 가져오기
    public int getFreelancerCount(FreelancerPageDTO freelancerPageDTO){
        logger.info("-> getFreelancerCount()");
        return sqlSession.selectOne(nameSpace + "getFreelancerCount", freelancerPageDTO);
    }

    //프리랜서 board 에 선택된 스킬들 포함
    public List<FreelancerSkillDTO> getFreelancerSkill(Long freelancer_id){
        logger.info("-> getFreelancerSkill()");
        return sqlSession.selectList(nameSpace + "selectFreelancerSkill", freelancer_id);
    }

    //전체 스킬 리스트 반환
    public List<FreelancerSkillDTO> getFreelancerSkillList() {
        logger.info("-> getFreelancerSkillList()");
        return sqlSession.selectList(nameSpace + "getFreelancerSkillList");
    }

    //freelancerRead 선택된 프리랜서 가져오기
    public FreelancerDTO getFreelancer(Long freelancer_id){
        logger.info("-> getFreelancer()");
        return sqlSession.selectOne(nameSpace + "getFreelancer", freelancer_id);
    }
    //freelancerRead 선택된 프리랜서에 등록된 스킬 가져오기
    public List<FreelancerSkillDTO> getSkill(Long freelancer_id) {
        logger.info("-> getSkill()");
        return sqlSession.selectList(nameSpace + "getSkill", freelancer_id);
    }

	
    //프리랜서 등록시 선택 스킬 freelancerSkill table 에 삽입
    public void insertFreelancerSkill(Map<String, Object> freelancerSkill) {
        sqlSession.insert(nameSpace + "insertFreelancerSkill", freelancerSkill);
    }

    
    //선택한 프리랜서의 이름 구하기
	public String getFreelancerName(Long freelancer_id) {
		
		return sqlSession.selectOne(nameSpace + "getFreelancerName", freelancer_id);	
	}
	
	//선택한 프리랜서의 직군(job) 구하기
	public String getFreelancerJobName(Long freelancer_id) {
		
		return sqlSession.selectOne(nameSpace + "getFreelancerJobName", freelancer_id);
	}
	
	
	 //프리랜서 리퀘스트 폼 등록하기
    public void insertFreelancerRequest(FreelancerRequestDTO freelancerRequestDTO) {
        logger.info("-> getFreelancerRequest()");
        sqlSession.insert(nameSpace + "insertFreelancerRequest", freelancerRequestDTO);
    }
    //프리랜서 리퀘스트 폼 skill 등록하기
    public void insetFreelancerRequestSkill(Map<String, Object> freelancerRequestSkillSet) {
        logger.info("-> getFreelancerRequestSkill()");
        sqlSession.insert(nameSpace + "insetFreelancerRequestSkill", freelancerRequestSkillSet);
    }
    //프리랜서 리퀘스트 폼 등록시 freelancer_state 값 '진행중' 으로 변경
    public void updateFreelancerState(Long freelancerId) {
        logger.info("-> getFreelancer()");
        sqlSession.update(nameSpace + "updateFreelancerState", freelancerId);
    }

    //프리랜서 리퀘스트 폼 등록시 file 테이블 등록
    public void insetFreelancerRequestFile(FreelancerRequestFileDTO freelancerRequestFileDTO) {
        logger.info("-> insetFreelancerRequestFile()");
        sqlSession.insert(nameSpace + "insetFreelancerRequestFile", freelancerRequestFileDTO);
    }

    //프리랜서 freelancer_state 가 진행중일때 request_client 데이터 가져오기
    public FreelancerRequestDTO getRequestClient(Long freelancer_id) {
        logger.info("-> getRequestClient()");
        return sqlSession.selectOne(nameSpace + "getRequestClient", freelancer_id);
    }

    //request_client 데이터 가져올때 request_skill 테이블에 skill 불러오기
    public List<FreelancerSkillDTO> getRequestSkill(Long freelancerId) {
        logger.info("-> getRequestSkill()");
        return sqlSession.selectList(nameSpace + "getRequestSkill", freelancerId);
    }

    //request_from 승인요청 시 보여줄 file 정보도 함께 가져간다
    public FreelancerRequestFileDTO getFreelancerRequestFile(Long freelancer_id) {
        logger.info("-> getFreelancerRequestFile()");
        return sqlSession.selectOne(nameSpace + "getFreelancerRequestFile", freelancer_id);
    }

    //매칭 성공시 isMatching true 변경
    public void setFreelancerIsMatching(Long freelancerId) {
        logger.info("-> getFreelancer()");
        sqlSession.update(nameSpace + "setFreelancerIsMatching", freelancerId);
    }

    //request_client 데이터 삭제
    public void deleteFreelancerRequest(Long freelancer_id) {
        logger.info("-> deleteFreelancer()");
        sqlSession.update(nameSpace + "deleteFreelancerRequest", freelancer_id);
    }
    //Freelancer_board 의 상태값 변경 '모집중'
    public void setBoardState(Long freelancerId) {
        logger.info("-> setBoardState()");
        sqlSession.update(nameSpace + "setBoardState", freelancerId);
    }

    //session 의 user_no 로 user_name 불러오기
    public String getUserName(Long user_no) {
        logger.info("-> getUserName()");
        return sqlSession.selectOne(nameSpace + "getUserName", user_no);
    }


}

	
	
	
