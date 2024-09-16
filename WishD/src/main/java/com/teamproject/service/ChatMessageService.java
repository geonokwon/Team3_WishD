package com.teamproject.service;


import com.teamproject.dao.ChatMessageDAO;
import com.teamproject.domain.ChatMessageDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.logging.Logger;

@Service
public class ChatMessageService {
    private static final Logger logger = Logger.getLogger(ChatMessageService.class.getName());

    @Autowired
    private ChatMessageDAO chatMessageDAO;

    public void saveMessage(ChatMessageDTO messageDTO) {
        logger.info("-> saveMessage()");
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
}
