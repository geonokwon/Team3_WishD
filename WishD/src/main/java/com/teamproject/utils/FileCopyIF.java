package com.teamproject.utils;

import org.springframework.web.multipart.MultipartFile;

public interface FileCopyIF {
    Long getPboard_id();
    void setPboard_id(Long pboard_id);

    Long getF_request_id();
    void setF_request_id(Long f_request_id);

    String getFileOriginName();
    void setFileOriginName(String fileOriginName);

    String getP_file_name();
    void setP_file_name(String p_file_name);

    String getP_file_path();
    void setP_file_path(String p_file_path);

    MultipartFile getFile();  // Assuming you're using Spring's MultipartFile for file handling
}
