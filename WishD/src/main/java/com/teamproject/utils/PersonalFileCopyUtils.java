package com.teamproject.utils;

import com.teamproject.domain.ProjectRequestFileDTO;
import org.springframework.util.FileCopyUtils;
import java.io.File;
import java.util.UUID;
import java.util.logging.Logger;

public class PersonalFileCopyUtils {
    private static final Logger logger = Logger.getLogger(PersonalFileCopyUtils.class.getName());

    private final String uploadPath;
    public PersonalFileCopyUtils(String uploadPath) {
        this.uploadPath = uploadPath;
    }

    public void fileCopy(ProjectRequestFileDTO projectRequestFileDTO, Long pboard_id, Long f_request_id) throws Exception {
        //파일DTO 보드id 셋팅
        projectRequestFileDTO.setPboard_id(pboard_id);

        //파일DTO request_id 셋팅
        projectRequestFileDTO.setF_request_id(f_request_id);
        //파일DTO fileOriginName 셋팅
        String originName = projectRequestFileDTO.getFile().getOriginalFilename();
        projectRequestFileDTO.setFileOriginName(originName);
        logger.info("originName : " + originName);

        //파일DTO 파일 name 셋팅
        //파일처리 부분 (파일이름 중복되지 않게 하기 위해 -> (pboard_id)uuid _파일이름
        UUID uuid = UUID.randomUUID();
        projectRequestFileDTO.setP_file_name("(" + projectRequestFileDTO.getPboard_id() + ")" + uuid + "_" + originName);
        logger.info("fileName : " + projectRequestFileDTO.getP_file_name());

        //파일DTO 파일 path 셋팅
        projectRequestFileDTO.setP_file_path(uploadPath);

        //파일 복사
        FileCopyUtils.copy(projectRequestFileDTO.getFile().getBytes(), new File(uploadPath, projectRequestFileDTO.getP_file_name()));
    }
}