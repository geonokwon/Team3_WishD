package com.teamproject.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.teamproject.dao.CommunityDAO;
import com.teamproject.domain.CommunityDTO;

@Service
public class CommunityService {

	@Inject
	private CommunityDAO communityDAO;
	
	public void insertCommunity(CommunityDTO communityDTO) {
		System.out.println("CommunityService insertCommunity");
		
		//글 번호
		communityDAO.insertCommunity(communityDTO);
		
	}	
		
}
