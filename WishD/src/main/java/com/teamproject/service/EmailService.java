package com.teamproject.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

@Service
public class EmailService {

    @Autowired
    private JavaMailSender mailSender;

    public Map<String, Object> sendMail(String email) {
        int code = generateCode();
        Map<String, Object> result = new HashMap<>();
        try {
            System.out.println("이메일전송 try 문");
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");

            //보내는 이메일을 설정값에서 불러오기
            helper.setFrom("furitstore1@gmail.com");
            helper.setTo(email);
            helper.setSubject("WishD 인증코드 입니다.");
            //본문내용
            String body = "";
            body += "<h3>" + "요청하신 인증 번호입니다." + "</h3>";
            body += "<h3>" + code + "</h1>";
            body += "<h3>" + "감사합니다!" + "</h3>";
            helper.setText(body, true);

            //이메일 전송
            mailSender.send(message);
            System.out.println("이메일전송 완료");
            result.put("status", "success");
            result.put("code", code);
        } catch (MessagingException e) {
            e.printStackTrace();
        }
        return result;
    }

    //인증코드 생성 메서드
    private int generateCode(){
        Random random = new Random();
        return random.nextInt(899999) + 100000;
    }
}
