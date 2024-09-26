package com.teamproject.domain;

import com.teamproject.utils.FileCopyIF;
import org.springframework.web.multipart.MultipartFile;

public class ProjectRequestFileDTO implements FileCopyIF {
    private String fileOriginName;

    private Long f_request_id;
    private Long pboard_id;
    private String p_file_name;
    private String p_file_path;

    private MultipartFile file;


    @Override
    public String getFileOriginName() {
        return fileOriginName;
    }

    @Override
    public void setFileOriginName(String fileOriginName) {
        this.fileOriginName = fileOriginName;
    }

    @Override
    public Long getF_request_id() {
        return f_request_id;
    }

    @Override
    public void setF_request_id(Long f_request_id) {
        this.f_request_id = f_request_id;
    }

    @Override
    public Long getPboard_id() {
        return pboard_id;
    }

    @Override
    public void setPboard_id(Long pboard_id) {
        this.pboard_id = pboard_id;
    }

    @Override
    public String getP_file_name() {
        return p_file_name;
    }

    @Override
    public void setP_file_name(String p_file_name) {
        this.p_file_name = p_file_name;
    }

    @Override
    public String getP_file_path() {
        return p_file_path;
    }

    @Override
    public void setP_file_path(String p_file_path) {
        this.p_file_path = p_file_path;
    }

    @Override
    public MultipartFile getFile() {
        return file;
    }

    public void setFile(MultipartFile file) {
        this.file = file;
    }

    @Override
    public String toString() {
        return "ProjectRequestFileDTO{" +
                "f_request_id=" + f_request_id +
                ", pboard_id=" + pboard_id +
                ", p_file_name='" + p_file_name + '\'' +
                ", p_file_path='" + p_file_path + '\'' +
                ", file=" + file +
                ". FileOriginName='" + fileOriginName + '\'' +
                '}';
    }
}
