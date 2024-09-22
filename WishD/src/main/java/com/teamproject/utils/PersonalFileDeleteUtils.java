package com.teamproject.utils;

import java.io.File;
import java.util.logging.Logger;

public class PersonalFileDeleteUtils {
    public static final Logger logger = Logger.getLogger(PersonalFileDeleteUtils.class.getName());

    // 파일 삭제 메서드 추가
    public static void deleteFile(String fileName, String uploadPath) {
        File file = new File(uploadPath, fileName);
        if (file.exists()) {
            boolean deleted = file.delete();
            if (deleted) {
                logger.info("파일 삭제 성공: " + file.getAbsolutePath());
            } else {
                logger.warning("파일 삭제 실패: " + file.getAbsolutePath());
            }
        } else {
            logger.warning("파일이 존재하지 않습니다: " + file.getAbsolutePath());
        }
    }
}
