package com.teamproject.service;

import com.teamproject.dao.ProjectDAO;
import com.teamproject.domain.*;
import com.teamproject.utils.PersonalFileCopyUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.*;
import java.util.logging.Logger;
import java.util.stream.Collectors;

@Service
public class ProjectService {
    public static final Logger logger = Logger.getLogger(ProjectService.class.getName());

    @Resource(name = "uploadPath")
    private String uploadPath;

    @Autowired
    private ProjectDAO projectDAO;

    //전체 프로젝트 등록 List 불러오기
    public List<ProjectDTO> getProjectList(ProjectPageDTO projectPageDTO){
        logger.info("-> getProjectList()");
        //projectDTO 사용자가 등록한 board 를 가져옴
        List<ProjectDTO> projectDTOList = projectDAO.getProject_all(projectPageDTO);
        for (ProjectDTO projectDTO : projectDTOList) {
            //가져온 projectDTO.getPboard() board에 선택된 스킬들을 List 형태로 받음
            //skill board_id 값들만 체크해서 list 형태로 저장한 후 반환
            projectDTO.setSkills(projectDAO.getProjectSkill(projectDTO.getPboard_id()));
        }
        return projectDTOList;
    }
    //총 프로젝트 등록 개수 가져오기
    public int getProjectCount(ProjectPageDTO projectPageDTO){
        logger.info("-> getProjectCount()");
        return projectDAO.getProjectCount(projectPageDTO);
    }
    //전체 스킬 리스트 가져오기
    public List<ProjectSkillDTO> getSkillList() {
        logger.info("-> getSkillList()");
        return projectDAO.getProjectSkillList();
    }

    //projectRead > 선택한 프로젝트 와 선택된 프로젝트 pboard_id 기준으로 선택된 skill 가져오가
    public ProjectDTO getProject(Long pboard_id) {
        logger.info("-> getProject()");
        ProjectDTO projectDTO = projectDAO.getProject(pboard_id);
        projectDTO.setSkills(projectDAO.getSkill(pboard_id));
        return projectDTO;
    }

    //프로젝트 등록(insertProject)
    @Transactional
    public void insertProject(ProjectDTO projectDTO) {
        logger.info("-> getProject()");
        //등록하고 등록한 pboard_id값 반환받아서 그 아이디 값으로 project_skill 테이블에 저장
        projectDAO.insertProject(projectDTO);

        //map 에 object 타입은 getPboard_id 는 int를 가지고, skillList는 List<integer>를 가진다 .
        Map<String, Object> projectSkillSet = new HashMap<>();
        projectSkillSet.put("pboard_id", projectDTO.getPboard_id());
        projectSkillSet.put("skill_id", getSkillList(projectDTO.getSkillList()));
        projectDAO.insertProjectSkill(projectSkillSet);
    }

    //project_request form insert (board , skill , file)
    @Transactional
    public void insertProjectRequest(ProjectRequestDTO projectRequestDTO,
                                     ProjectRequestFileDTO projectRequestFileDTO) throws Exception {
        logger.info("-> getProjectRequest()");
        //프로젝트 리퀘스트 폼 저장
        System.out.println(projectRequestDTO.toString());
        projectDAO.insertProjectRequest(projectRequestDTO);

        //프로젝트 리퀘스트 스킬리스트 부분 request_skill table 저장
        Map<String, Object> projectRequestSkillSet = new HashMap<>();
        projectRequestSkillSet.put("f_request_id", projectRequestDTO.getF_request_id());
        projectRequestSkillSet.put("skill_id", getSkillList(projectRequestDTO.getSkillList()));
        System.out.println(projectRequestSkillSet);
        projectDAO.insetProjectRequestSkill(projectRequestSkillSet);

        //처리할때 project_board 의 state -> 를 진행중으로 변경
        System.out.println(projectRequestDTO.toString());
        projectDAO.updateProjectState(projectRequestDTO.getPboard_id());

        //프로젝트 리퀘스트 file 부분 request_file table 저장
        //파일 Copy 처리 utils class -> Resources/upload/fileCopy
        PersonalFileCopyUtils personalFileCopyUtils = new PersonalFileCopyUtils(uploadPath);
        personalFileCopyUtils.fileCopy(projectRequestFileDTO, projectRequestDTO.getPboard_id(), projectRequestDTO.getF_request_id());
        System.out.println(projectRequestDTO.toString());
        projectDAO.insetProjectRequestFile(projectRequestFileDTO);

    }

    //진행중인 board 가 있다면 request form의 값을 가져오기
    public ProjectRequestDTO getRequestFreelancer(Long pboardId) {
        ProjectRequestDTO projectRequestDTO = projectDAO.getRequestFreelancer(pboardId);
        projectRequestDTO.setSkills(projectDAO.getRequestSkill(projectRequestDTO.getPboard_id()));
        return projectRequestDTO;
    }

    public ProjectRequestFileDTO getProjectRequestFile(Long pboard_id) {
        logger.info("-> getProjectRequestFile()");
        return projectDAO.getProjectRequestFile(pboard_id);

    }

    //매칭성공시 project_board 테이블 isMatching = true 변경
    public void setProjectIsMatching(Long pboard_id) {
        logger.info("-> getProjectIsMatching()");
        projectDAO.setProjectIsMatching(pboard_id);
    }

    //승인와료후 프로젝트 등록자가 requestForm만 보고 취소시
    @Transactional
    public void deleteProjectRequest(Long pboard_id) {
        logger.info("-> getProjectRequest()");
        projectDAO.setBoardState(pboard_id);
        projectDAO.deleteProjectRequest(pboard_id);
    }

    //user_no 로 user_name 가져오기
    public String getUserName(Long user_no) {
        logger.info("-> getUserName()");
        return projectDAO.getUserName(user_no);
    }

//============================================================================================================
    //skillList String -> List  형태로 반환하는 메서드
    public List<Integer> getSkillList(String str_skillList){
        logger.info("-> getSkillList()");
        //map(Integer::parseInt) -> 각 문자열을 Integer로 변환 Stream<String> 을 Stream<Integer>로 변환
        //collect -> 스트림 결과를 List<Integer> 로 반환.
        return Arrays.stream(str_skillList.split(","))
                .map(Integer::parseInt)
                .collect(Collectors.toList());
    }



}
