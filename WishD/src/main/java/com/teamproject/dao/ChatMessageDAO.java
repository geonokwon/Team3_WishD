package com.teamproject.dao;


import com.teamproject.domain.ChatMessageDTO;
import com.teamproject.service.ChatMessageService;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.logging.Logger;

@Repository
public class ChatMessageDAO {

    private static final Logger logger = Logger.getLogger(ChatMessageDAO.class.getName());

    @Autowired
    private SqlSession sqlSession;

    private final String namespace = "com.teamproject.mapper.ChatMessageMapper.";

    //메세지 저장 전 request_id값 가져오기
    public Long getRequestFreelancerID(Long pboardId) {
        logger.info("-> getRequestFreelancerID()");
        return sqlSession.selectOne(namespace + "getRequestFreelancerID", pboardId);
    }


    // 메시지 저장
    public void saveMessage(ChatMessageDTO messageDTO) {
        logger.info("-> saveMessage()");
        sqlSession.insert(namespace + "insertMessage", messageDTO);
    }


    // 메세지 불러오기
    public List<ChatMessageDTO> getChatHistory(Long pboardId) {
        logger.info("-> getChatHistory()");
        return sqlSession.selectList(namespace + "getChatHistory", pboardId);
    }


}
