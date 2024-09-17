package com.teamproject.controller;

import com.teamproject.domain.ChatMessageDTO;
import com.teamproject.domain.ProjectDTO;
import com.teamproject.domain.ProjectRequestDTO;
import com.teamproject.service.ChatMessageService;
import com.teamproject.service.ProjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.logging.Logger;


@Controller
public class ChatController {
    private final SimpMessagingTemplate messagingTemplate;
    private static final Logger logger = Logger.getLogger(ChatController.class.getName());

    @Autowired
    private ProjectService projectService;

    @Autowired
    private ChatMessageService chatMessageService;

    public ChatController(SimpMessagingTemplate messagingTemplate){
        this.messagingTemplate = messagingTemplate;
    }

    @GetMapping("/chatting/{pboard_id}")
    public String chatPage(@PathVariable("pboard_id") Long pboard_id, HttpSession session, Model model){
        logger.info( "-> chatPage()");
        ProjectDTO projectDTO = projectService.getProject(pboard_id);


        Long user_no = (Long) session.getAttribute("user_no");

        if (user_no != null && projectDTO.getPboard_state().equals("진행중")) {
            projectService.setProjectIsMatching(pboard_id);
            ProjectRequestDTO projectRequestDTO = projectService.getRequestFreelancer(pboard_id);
            if (projectDTO.getUser_no().longValue() == user_no || projectRequestDTO.getUser_no().longValue() == user_no) {
                //선택된 pboard_id 값으로 프로젝트 등록 글 가져오기
                model.addAttribute("projectDTO", projectDTO);
                model.addAttribute("projectSkillList", projectService.getSkillList());

                //채팅 내역 가져올때 상대방꺼도 가져와야함 .. 그냥 채팅방 기준(pboard_id) 으로 다가져와서 user_no 에 따라 나눠야 할거같은데?
                //채팅내역 가져오기
                //pboard_id로 가져오면 다른 채팅도 올수있는데 ?
                //pboard_id로 매칭하고  취소하면 다시 채팅방이 열리는데 그러면 이전 내용까지 다불러 올껀데 ;;
                //pboard_id 와 request_form_id를 같이 불러와야겠네 .
                //request_id 를 어떻게 가져오지 ? pboar_id 를 기준으로 request_freelancer 테이블 을 조회한후
                //request_freelancer 테이블에 같은 pboard_id 를 검색하고 그중에서도 chat_message 테이블의 isMatching 이 true 인애만 가져오기
                List<ChatMessageDTO> chatHistory = chatMessageService.getChatHistory(pboard_id);
                model.addAttribute("chatHistory", chatHistory);
                return "chatting/chatting";
            }
        }
        return "redirect:/projectFind";
    }

    @MessageMapping("/send/{pboard_id}")
    public void sendMessage(@Payload ChatMessageDTO chatMessageDTO, @DestinationVariable Long pboard_id){
        logger.info( "-> sendMessage()");
        //메세지 저장
        chatMessageDTO.setPboard_id(pboard_id);
        //리퀘스트 프리렌서 폼 아이디를 가져와야함 어떻게 가져오지 ? 뭘 기준으로 ?
        chatMessageDTO.setF_request_id(chatMessageService.getRequestFreelancerID(pboard_id));
        chatMessageService.saveMessage(chatMessageDTO);
        System.out.println("Received message: " + chatMessageDTO.toString());

        //메세지 보내기
        messagingTemplate.convertAndSend("/topic/board/" + pboard_id, chatMessageDTO);
    }


    //매칭 취소시
    @GetMapping("matchingEnd/{pboard_id}")
    public String matchingEnd(@PathVariable("pboard_id")Long pboard_id){
        logger.info( "-> matchingEnd()");
        chatMessageService.setBoardState(pboard_id);
        return "redirect:/projectRead/" + pboard_id;
    }


}
