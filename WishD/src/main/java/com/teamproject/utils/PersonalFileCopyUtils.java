package com.teamproject.utils;

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

    public void fileCopy(FileCopyIF RequestFileDTO, Long pboard_id, Long f_request_id) throws Exception {
        //파일DTO 보드id 셋팅
        RequestFileDTO.setPboard_id(pboard_id);

        //파일DTO request_id 셋팅
        RequestFileDTO.setF_request_id(f_request_id);
        //파일DTO fileOriginName 셋팅
        String originName = RequestFileDTO.getFile().getOriginalFilename();
        RequestFileDTO.setFileOriginName(originName);
        logger.info("originName : " + originName);

        //파일DTO 파일 name 셋팅
        //파일처리 부분 (파일이름 중복되지 않게 하기 위해 -> (pboard_id)uuid _파일이름
        UUID uuid = UUID.randomUUID();
        RequestFileDTO.setP_file_name("(" + RequestFileDTO.getPboard_id() + ")" + uuid + "_" + originName);
        logger.info("fileName : " + RequestFileDTO.getP_file_name());

        //파일DTO 파일 path 셋팅
        RequestFileDTO.setP_file_path(uploadPath);

        //파일 복사
        FileCopyUtils.copy(RequestFileDTO.getFile().getBytes(), new File(uploadPath, RequestFileDTO.getP_file_name()));
    }
}
