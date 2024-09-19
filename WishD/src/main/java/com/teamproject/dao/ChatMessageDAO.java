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

    //매칭 취소시 boardState 값 변경 및 isMatching 값 변경
    public void setBoardState(Long pboard_id) {
        logger.info("-> setBoardState()");
        sqlSession.update(namespace + "setBoardState", pboard_id);
    }

    //매칭 취소시 request_freelancer 컬럼 값 삭제 및 파일도 삭제
    public void setDeleteRequest(Long pboardId) {
        logger.info("-> setRequestIsAgreeState()");
        sqlSession.delete(namespace + "setDeleteRequest", pboardId);
    }

    //매칭 취소시 chat_isMatching 상태 변경
    public void setChatMessageIsMatching(Long pboardId) {
        logger.info("-> setChatMessageIsMatching()");
        sqlSession.update(namespace + "setChatMessageIsMatching", pboardId);
    }
}
