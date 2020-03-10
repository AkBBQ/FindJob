package com.example.demo;

import com.example.demo.entity.mail.MessageCommand;
import com.example.demo.service.mail.MailService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

@MapperScan("com.example.demo.mapper")
@RunWith(SpringRunner.class)
@SpringBootTest
public class DemoApplicationTests {
    @Autowired
    private MailService mailService;

    @Test
    public void contextLoads() {
        mailService.sendAttachFile(MessageCommand.builder().build());
    }

}
