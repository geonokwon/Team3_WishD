package com.teamproject.controller;

import com.teamproject.service.EmailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Map;

@Controller
public class EmailController {

    @Autowired
    private EmailService emailService;



    @PostMapping("/emailSendCode")
    @ResponseBody
    public Object emailSendCode(@RequestParam("userEmail")String email) {
        System.out.println("EmailController -> emailSendCode()");

        Map<String, Object> result = emailService.sendMail(email);
//        System.out.println(result.get("code"));
        if (result.get("status").equals("success")) {
            return result.get("code");
        }
        return result.get("status").toString();
    }

}
