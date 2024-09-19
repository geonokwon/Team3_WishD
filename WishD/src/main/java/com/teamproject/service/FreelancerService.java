package com.teamproject.service;

import java.sql.Timestamp;
import java.util.List;
import java.util.logging.Logger;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamproject.dao.FreelancerDAO;
import com.teamproject.domain.FreelancerDTO;
import com.teamproject.domain.FreelancerPageDTO;
import com.teamproject.domain.FreelancerSkillDTO;


@Service
public class FreelancerService {
    public static final Logger logger = Logger.getLogger(FreelancerService.class.getName());
	@Autowired
	private FreelancerDAO freelancerDAO;
	
	//프리랜서 등록
	public void registFreelancer(FreelancerDTO freelancerDTO) {
		System.out.println("FreelancerService RegPro");
		
		//현재 시간 변수에 저장
		Timestamp timestamp = new Timestamp(System.currentTimeMillis());
		//가입날짜 설정
		freelancerDTO.setFreelancer_date(timestamp);
		//최종수정날짜 설정
		freelancerDTO.setFreelancer_update(timestamp);
		
		System.out.println("servece에서 freelancerDTO" + freelancerDTO);
		freelancerDAO.registFreelancer(freelancerDTO);
		
	}
    //전체 job 리스트 가져오기
    public List<FreelancerDTO> getJobList() {
        logger.info("-> getJobList()");
        return freelancerDAO.getJobList();
    }
	
	
    //전체 프리랜서 등록 List 불러오기
    public List<FreelancerDTO> getFreelancerList(FreelancerPageDTO freelancerPageDTO){
        logger.info("-> getFreelancerList()");
        //freelancerDTO 사용자가 등록한 board 를 가져옴
        List<FreelancerDTO> freelancerDTOList = freelancerDAO.getFreelancer_all(freelancerPageDTO);
        

        
        for (FreelancerDTO freelancerDTO : freelancerDTOList) {
            //가져온 freelancerDTO.getfreelancer() board에 선택된 스킬들을 List 형태로 받음
            //skill board_id 값들만 체크해서 list 형태로 저장한 후 반환
        	freelancerDTO.setSkills(freelancerDAO.getFreelancerSkill(freelancerDTO.getFreelancer_id()));
 
        }
        return freelancerDTOList;
    }
	
    //총 프리랜서 등록 개수 가져오기
    public int getFreelancerCount(FreelancerPageDTO freelancerPageDTO){
        logger.info("-> getFreelancerCount()");
        return freelancerDAO.getFreelancerCount(freelancerPageDTO);
    }
    //전체 스킬 리스트 가져오기
    public List<FreelancerSkillDTO> getSkillList() {
        logger.info("-> getSkillList()");
        return freelancerDAO.getFreelancerSkillList();
    }

    //freelancerRead > 선택한 프리랜서 와 선택된 프리랜서 freelancer_id 기준으로 선택된 skill 가져오기
    public FreelancerDTO getFreelancer(Long freelancer_id) {
        logger.info("-> getFreelancer()");
        
        FreelancerDTO freelancerDTO = freelancerDAO.getFreelancer(freelancer_id);
        freelancerDTO.setSkills(freelancerDAO.getSkill(freelancer_id));
        return freelancerDTO;
    }
	

	
	
	


	
	
	
	

}
