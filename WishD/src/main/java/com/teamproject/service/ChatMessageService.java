package com.teamproject.service;


import com.teamproject.dao.ChatMessageDAO;
import com.teamproject.domain.ChatMessageDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.logging.Logger;

@Service
public class ChatMessageService {
    private static final Logger logger = Logger.getLogger(ChatMessageService.class.getName());

    @Autowired
    private ChatMessageDAO chatMessageDAO;

    public void saveMessage(ChatMessageDTO messageDTO) {
        logger.info("-> saveMessage()");
        messageDTO.setChat_isMatching(true);
        chatMessageDAO.saveMessage(messageDTO);
    }

    //pboard_id 기준으로 채팅내용 가져오기
    public List<ChatMessageDTO> getChatHistory(Long pboard_id) {
        logger.info("-> getChatHistory()");
        return chatMessageDAO.getChatHistory(pboard_id);
    }

    public Long getRequestFreelancerID(Long pboardId) {
        logger.info("-> getRequestFreelancerID()");
        return chatMessageDAO.getRequestFreelancerID(pboardId);
    }


    //pboard_id 기준으로 매칭 취소시 state 값 변경
    @Transactional
    public void setBoardState(Long pboardId) {
        logger.info("-> setBoardState()");
        //현재 등록된 프로젝트 의 상태를 모집중으로 변경  및 pboard_isMatching = false 변경
        chatMessageDAO.setBoardState(pboardId);
        //사용하였던 메세지 내용을 false 로 변경
        chatMessageDAO.setChatMessageIsMatching(pboardId);
        //기존에 왔던 request_form 삭제
        chatMessageDAO.setDeleteRequest(pboardId);
    }
}
