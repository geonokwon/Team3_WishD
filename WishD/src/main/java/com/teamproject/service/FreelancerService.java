package com.teamproject.service;

import java.io.File;
import java.sql.Timestamp;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.logging.Logger;
import java.util.stream.Collectors;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.FileCopyUtils;

import com.teamproject.dao.FreelancerDAO;
import com.teamproject.domain.FreelancerDTO;
import com.teamproject.domain.FreelancerPageDTO;
import com.teamproject.domain.FreelancerRequestDTO;
import com.teamproject.domain.FreelancerRequestFileDTO;
import com.teamproject.domain.FreelancerSkillDTO;




@Service
public class FreelancerService {
    public static final Logger logger = Logger.getLogger(FreelancerService.class.getName());
    
    @Resource(name = "uploadPath")
    private String uploadPath;
    
    
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
        	System.out.println(freelancerDTO.getSkills());
        	
        	freelancerDTO.setJob_name(freelancerDAO.getFreelancerJobName(freelancerDTO.getFreelancer_id()));
        	System.out.println(freelancerDTO.getJob_name());
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
        freelancerDTO.setJob_name(freelancerDAO.getFreelancerJobName(freelancer_id));
        freelancerDTO.setUser_name(freelancerDAO.getFreelancerName(freelancer_id));
        freelancerDTO.setSkills(freelancerDAO.getSkill(freelancer_id));
        return freelancerDTO;
    }
    
    //freelancer_request form insert (board , skill , file)
    @Transactional
    public void insertFreelancerRequest(FreelancerRequestDTO freelancerRequestDTO,
                                     FreelancerRequestFileDTO freelancerRequestFileDTO) throws Exception {
        logger.info("-> getFreelancerRequest()");
        //프로젝트 리퀘스트 폼 저장
        System.out.println(freelancerRequestDTO.toString());
        freelancerDAO.insertFreelancerRequest(freelancerRequestDTO);

        //프로젝트 리퀘스트 스킬리스트 부분 request_skill table 저장
        Map<String, Object> freelancerRequestSkillSet = new HashMap<>();
        freelancerRequestSkillSet.put("request_num", freelancerRequestDTO.getRequest_num());
        freelancerRequestSkillSet.put("skill_id", getSkillList(freelancerRequestDTO.getSkillList()));
        System.out.println(freelancerRequestSkillSet);
        freelancerDAO.insetFreelancerRequestSkill(freelancerRequestSkillSet);

        //처리할때 freelancer_board 의 state -> 를 진행중으로 변경
        System.out.println(freelancerRequestDTO.toString());
        freelancerDAO.updateFreelancerState(freelancerRequestDTO.getFreelancer_id());

        //프로젝트 리퀘스트 file 부분 request_file table 저장
        //파일 Copy 처리 utils class -> Resources/upload/fileCopy

        freelancerFileCopy(freelancerRequestFileDTO, freelancerRequestDTO.getFreelancer_id(), freelancerRequestDTO.getRequest_num());
        System.out.println(freelancerRequestDTO.toString());
        freelancerDAO.insetFreelancerRequestFile(freelancerRequestFileDTO);

    }
	

    //진행중인 board 가 있다면 request form의 값을 가져오기
    public FreelancerRequestDTO getRequestClient(Long freelancerId) {
        FreelancerRequestDTO freelancerRequestDTO = freelancerDAO.getRequestClient(freelancerId);
        freelancerRequestDTO.setSkills(freelancerDAO.getRequestSkill(freelancerRequestDTO.getFreelancer_id()));
        return freelancerRequestDTO;
    }
	
    public FreelancerRequestFileDTO getFreelancerRequestFile(Long pboard_id) {
        logger.info("-> getFreelancerRequestFile()");
        return freelancerDAO.getFreelancerRequestFile(pboard_id);

    }

    //매칭성공시 freelancer_board 테이블 isMatching = true 변경
    public void setFreelancerIsMatching(Long pboard_id) {
        logger.info("-> getFreelancerIsMatching()");
        freelancerDAO.setFreelancerIsMatching(pboard_id);
    }

    //승인와료후 프로젝트 등록자가 requestForm만 보고 취소시
    @Transactional
    public void deleteFreelancerRequest(Long pboard_id) {
        logger.info("-> getFreelancerRequest()");
        freelancerDAO.setBoardState(pboard_id);
        freelancerDAO.deleteFreelancerRequest(pboard_id);
    }

    //user_no 로 user_name 가져오기
    public String getUserName(Long user_no) {
        logger.info("-> getUserName()");
        return freelancerDAO.getUserName(user_no);
    }

    //skillList String -> List  형태로 반환하는 메서드
    public List<Integer> getSkillList(String str_skillList){
        logger.info("-> getSkillList()");
        //map(Integer::parseInt) -> 각 문자열을 Integer로 변환 Stream<String> 을 Stream<Integer>로 변환
        //collect -> 스트림 결과를 List<Integer> 로 반환.
        return Arrays.stream(str_skillList.split(","))
                .map(Integer::parseInt)
                .collect(Collectors.toList());
    }
	
	//파일복사util
    public void freelancerFileCopy(FreelancerRequestFileDTO freelancerRequestFileDTO, Long freelancer_id, Long request_num) throws Exception {
        //파일DTO 보드id 셋팅
        freelancerRequestFileDTO.setFreelancer_id(freelancer_id);

        //파일DTO request_id 셋팅
        freelancerRequestFileDTO.setRequest_num(request_num);
        //파일DTO fileOriginName 셋팅
        String originName = freelancerRequestFileDTO.getFile().getOriginalFilename();
        freelancerRequestFileDTO.setFileOriginName(originName);
        logger.info("originName : " + originName);

        //파일DTO 파일 name 셋팅
        //파일처리 부분 (파일이름 중복되지 않게 하기 위해 -> (pboard_id)uuid _파일이름
        UUID uuid = UUID.randomUUID();
        freelancerRequestFileDTO.setF_file_name("(" + freelancerRequestFileDTO.getFreelancer_id() + ")" + uuid + "_" + originName);
        logger.info("fileName : " + freelancerRequestFileDTO.getF_file_name());

        //파일DTO 파일 path 셋팅
        freelancerRequestFileDTO.setF_file_path(uploadPath);

        //파일 복사
        FileCopyUtils.copy(freelancerRequestFileDTO.getFile().getBytes(), new File(uploadPath, freelancerRequestFileDTO.getF_file_name()));
    }
	

}