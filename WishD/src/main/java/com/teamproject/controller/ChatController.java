package com.teamproject.controller;

import com.teamproject.domain.ChatMessageDTO;
import com.teamproject.domain.ProjectDTO;
import com.teamproject.service.ChatMessageService;
import com.teamproject.service.ProjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.converter.SimpleMessageConverter;
import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.messaging.handler.annotation.SendTo;
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

        //선택된 pboard_id 값으로 프로젝트 등록 글 가져오기
        ProjectDTO projectDTO = projectService.getProject(pboard_id);
        model.addAttribute("projectDTO", projectDTO);
        model.addAttribute("projectSkillList", projectService.getSkillList());

        //채팅 내역 가져올때 상대방꺼도 가져와야함 .. 그냥 채팅방 기준(pboard_id) 으로 다가져와서 user_no 에 따라 나눠야 할거같은데?
        //채팅내역 가져오기
        List<ChatMessageDTO> chatHistory = chatMessageService.getChatHistory(pboard_id);
        model.addAttribute("chatHistory", chatHistory);


        return "chatting/chatting";
    }

    @MessageMapping("/send/{pboard_id}")
    public void sendMessage(@Payload ChatMessageDTO chatMessageDTO, @DestinationVariable Long pboard_id){
        logger.info( "-> sendMessage()");
        //메세지 저장
        chatMessageDTO.setPboard_id(pboard_id);
        chatMessageService.saveMessage(chatMessageDTO);
        System.out.println("Received message: " + chatMessageDTO.toString());

        //메세지 보내기
        messagingTemplate.convertAndSend("/topic/board/" + pboard_id, chatMessageDTO);
    }
}
