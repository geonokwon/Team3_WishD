package com.teamproject.dao;

import java.util.List;
import java.util.Map;
import java.util.logging.Logger;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.teamproject.domain.FreelancerDTO;
import com.teamproject.domain.FreelancerPageDTO;
import com.teamproject.domain.FreelancerSkillDTO;



@Repository
public class FreelancerDAO {
	public static final Logger logger = Logger.getLogger(FreelancerDAO.class.getName());
	
	//마이바티스 객체생성
	@Autowired
	private SqlSession sqlSession;
	private final String nameSpace = "com.teamproject.mapper.FreelancerMapper.";
	
	
	
    //프로젝트 전체 가져오기
    public List<FreelancerDTO> getFreelancer_all(FreelancerPageDTO freelancerPageDTO){
        logger.info("-> getFreelancer_all()");
        return sqlSession.selectList(nameSpace + "selectFreelancer_all", freelancerPageDTO);
    }

    //전체 프로젝트 등록된 개수 가져오기
    public int getFreelancerCount(FreelancerPageDTO freelancerPageDTO){
        logger.info("-> getFreelancerCount()");
        return sqlSession.selectOne(nameSpace + "getFreelancerCount", freelancerPageDTO);
    }

    //프로젝트 board 에 선택된 스킬들 포함
    public List<FreelancerSkillDTO> getFreelancerSkill(Long freelancer_id){
        logger.info("-> getFreelancerSkill()");
        return sqlSession.selectList(nameSpace + "selectFreelancerSkill", freelancer_id);
    }

    //전체 스킬 리스트 반환
    public List<FreelancerSkillDTO> getFreelancerSkillList() {
        logger.info("-> getFreelancerSkillList()");
        return sqlSession.selectList(nameSpace + "getFreelancerSkillList");
    }

    //freelancerRead 선택된 프로젝트 가져오기
    public FreelancerDTO getFreelancer(Long freelancer_id){
        logger.info("-> getFreelancer()");
        return sqlSession.selectOne(nameSpace + "getFreelancer", freelancer_id);
    }
    //freelancerRead 선택된 프로젝트에 등록된 스킬 가져오기
    public List<FreelancerSkillDTO> getSkill(Long freelancer_id) {
        logger.info("-> getSkill()");
        return sqlSession.selectList(nameSpace + "getSkill", freelancer_id);
    }

	//프리랜서 등록
	public void registFreelancer(FreelancerDTO freelancerDTO) {
		System.out.println("FreelancerDAO regist");
		
		
		sqlSession.insert(nameSpace + "resistFreelancer", freelancerDTO);
	}
	
    //프로젝트 등록시 선택 스킬 freelancerSkill table 에 삽입
    public void insertFreelancerSkill(Map<String, Object> freelancerSkill) {
        sqlSession.insert(nameSpace + "insertFreelancerSkill", freelancerSkill);
    }
    


	
	
	
}