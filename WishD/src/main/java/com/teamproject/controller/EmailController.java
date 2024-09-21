package com.teamproject.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.mail.internet.MimeMessage;
import java.util.Random;

@Controller
public class EmailController {
    @Autowired
    private JavaMailSender mailSender;

    //인증코드 생성 메서드
    private String generateCode(){
        Random random = new Random();
        int code = random.nextInt(899999) + 100000;
        return String.valueOf(code);
    }

    @PostMapping("/emailSendCode")
    @ResponseBody
    public String emailSendCode(@RequestParam("email") String email, Model model) {
        String code = generateCode();
        model.addAttribute("emailCode", code);

        MimeMessage message = mailSender.createMimeMessage();

        return "";
    }
}
