package com.teamproject.dao;


import com.teamproject.domain.ChatMessageDTO;
import com.teamproject.domain.ProjectRequestFileDTO;
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

    private final String nameSpace = "com.teamproject.mapper.ChatMessageMapper.";

    //메세지 저장 전 request_id값 가져오기
    public Long getRequestFreelancerID(Long pboardId) {
        logger.info("-> getRequestFreelancerID()");
        return sqlSession.selectOne(nameSpace + "getRequestFreelancerID", pboardId);
    }



    // 메시지 저장
    public void saveMessage(ChatMessageDTO messageDTO) {
        logger.info("-> saveMessage()");
        sqlSession.insert(nameSpace + "insertMessage", messageDTO);
    }


    // 메세지 불러오기
    public List<ChatMessageDTO> getChatHistory(Long pboardId) {
        logger.info("-> getChatHistory()");
        return sqlSession.selectList(nameSpace + "getChatHistory", pboardId);
    }

    //매칭 취소시 boardState 값 변경 및 isMatching 값 변경
    public void setBoardState(Long pboard_id) {
        logger.info("-> setBoardState()");
        sqlSession.update(nameSpace + "setBoardState", pboard_id);
    }

    //매칭 취소시 request_freelancer 컬럼 값 삭제 및 파일도 삭제
    public void setDeleteRequest(Long pboardId) {
        logger.info("-> setRequestIsAgreeState()");
        sqlSession.delete(nameSpace + "setDeleteRequest", pboardId);
    }

    //매칭 취소시 chat_isMatching 상태 변경
    public void setChatMessageIsMatching(Long pboardId) {
        logger.info("-> setChatMessageIsMatching()");
        sqlSession.update(nameSpace + "setChatMessageIsMatching", pboardId);
    }

    //매칭 완료시 project_board -> state 값 변경
    public void setCompleteState(Long pboard_id) {
        logger.info("-> setCompleteState()");
        sqlSession.update(nameSpace + "setCompleteState", pboard_id);
    }


    //request_from 승인요청 시 보여줄 file 정보도 함께 가져간다
    public ProjectRequestFileDTO getProjectRequestFile(Long pboard_id) {
        logger.info("-> getProjectRequestFile()");
        return sqlSession.selectOne(nameSpace + "getProjectRequestFile", pboard_id);
    }
}
