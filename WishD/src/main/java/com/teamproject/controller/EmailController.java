package com.teamproject.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.mail.MessagingException;
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
    public String emailSendCode(@RequestParam("userEmail")String email, Model model) {
        System.out.println(email);
        String code = generateCode();
        model.addAttribute("emailCode", code);

        try {
            System.out.println("이메일전송 try 문");
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");

            //보내는 이메일을 설정값에서 불러오기
            helper.setFrom("furitstore1@gmail.com");
            helper.setTo(email);
            helper.setSubject("WishD 인증코드 입니다.");
            helper.setText("인증코드 입니다 : " + code, true);

            //이메일 전송
            mailSender.send(message);
            System.out.println("이메일전송 완료");
            model.addAttribute("emailCode", code);
            return "success";
        } catch (MessagingException e) {
            e.printStackTrace();
            return "failed";
        }
    }

}
