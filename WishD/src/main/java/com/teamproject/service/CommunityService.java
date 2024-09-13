package com.teamproject.service;

import java.sql.Timestamp;

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
		communityDTO.setNcommunity_num(communityDAO.getMAxNum() + 1);
		
		//날짜
		communityDTO.setNcommunity_date(new Timestamp(System.currentTimeMillis()));
		
		//최근수정일
	}	
		
}
