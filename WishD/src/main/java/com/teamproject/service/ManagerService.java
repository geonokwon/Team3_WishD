package com.teamproject.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.teamproject.dao.ManagerDAO;
import com.teamproject.domain.*;

@Service
public class ManagerService {
	
	@Inject
	private ManagerDAO managerDAO;
	
//	요청 프리랜서 리스트
	public List<ProjectRequestDTO> getRqfList(PageDTO pageDTO){
		
		int startRow = (pageDTO.getCurrentPage()-1) * pageDTO.getPageSize() + 1;
		
		int endRow = startRow + pageDTO.getPageSize() - 1;
		
		pageDTO.setStartRow(startRow - 1);
		pageDTO.setEndRow(endRow);
		
		return managerDAO.getRqfList(pageDTO);
	}
	
//	요청 프리랜서 수
	public int getRqfCount(PageDTO pageDTO) {
		
		return managerDAO.getRqfCount(pageDTO);
	}

	public List<FreelancerRequestDTO> getRqcList(PageDTO pageDTO) {
		
		int startRow = (pageDTO.getCurrentPage()-1) * pageDTO.getPageSize() + 1;
		
		int endRow = startRow + pageDTO.getPageSize() - 1;
		
		pageDTO.setStartRow(startRow - 1);
		pageDTO.setEndRow(endRow);
		
		return managerDAO.getRqcList(pageDTO);
	}

	public int getRqcCount(PageDTO pageDTO) {
		
		return managerDAO.getRqcCount(pageDTO);
	}
	
}
