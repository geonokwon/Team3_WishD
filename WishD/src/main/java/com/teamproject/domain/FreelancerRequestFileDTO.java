package com.teamproject.domain;

import org.springframework.web.multipart.MultipartFile;

import com.teamproject.utils.FileCopyIF;

public class FreelancerRequestFileDTO implements FileCopyIF{

	 private String fileOriginName;

	 private Long request_num;
	 private Long freelancer_id;
	 private String f_file_name;
	 private String f_file_path;

	 private MultipartFile file;

	 

	public Long getRequest_num() {
		return request_num;
	}

	public void setRequest_num(Long request_num) {
		this.request_num = request_num;
	}

	public Long getFreelancer_id() {
		return freelancer_id;
	}

	public void setFreelancer_id(Long freelancer_id) {
		this.freelancer_id = freelancer_id;
	}

	public String getF_file_name() {
		return f_file_name;
	}

	public void setF_file_name(String f_file_name) {
		this.f_file_name = f_file_name;
	}

	public String getF_file_path() {
		return f_file_path;
	}

	public void setF_file_path(String f_file_path) {
		this.f_file_path = f_file_path;
	}

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
	        return request_num;
	    }

	    @Override
	    public void setF_request_id(Long f_request_id) {
	        this.request_num = f_request_id;
	    }

	    @Override
	    public Long getPboard_id() {
	        return freelancer_id;
	    }

	    @Override
	    public void setPboard_id(Long pboard_id) {
	        this.freelancer_id = pboard_id;
	    }

	    @Override
	    public String getP_file_name() {
	        return f_file_name;
	    }

	    @Override
	    public void setP_file_name(String p_file_name) {
	        this.f_file_name = p_file_name;
	    }

	    @Override
	    public String getP_file_path() {
	        return f_file_path;
	    }

	    @Override
	    public void setP_file_path(String p_file_path) {
	        this.f_file_path = p_file_path;
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
			return "FreelancerRequestFileDTO [fileOriginName=" + fileOriginName + ", request_num=" + request_num
					+ ", freelancer_id=" + freelancer_id + ", f_file_name=" + f_file_name + ", f_file_path="
					+ f_file_path + ", file=" + file + "]";
		}
	


	 

	
	
	
}
