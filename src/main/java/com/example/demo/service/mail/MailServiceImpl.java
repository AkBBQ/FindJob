package com.example.demo.service.mail;

import com.alibaba.fastjson.JSON;
import com.example.demo.entity.mail.MessageCommand;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import java.util.Date;


/**
 * 邮箱服务实现
 */
@Async
@Service
public class MailServiceImpl implements MailService {

    @Autowired
    private JavaMailSender javaMailSender;


    @Override
    public void sendResultToJobSeeker(MessageCommand messageCommand) {
        try {
            javaMailSender.send(this.build(messageCommand));
            System.out.println("发送成功,发送内容为"+ JSON.toJSONString(messageCommand));
        } catch (MailException e) {
            System.out.println("发送失败");
            e.printStackTrace();
        }
    }

    @Override
    public void sendAttachFile(MessageCommand messageCommand){
        try {
            MimeMessage mimeMessage = javaMailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(mimeMessage,true);
            helper.setSubject("这是一封测试邮件");
            helper.setFrom("1446547537@qq.com");
            helper.setTo("15251800012@163.com");
            helper.setSentDate(new Date());
            helper.setText("这是测试邮件的正文");
//            helper.addAttachment();
            javaMailSender.send(mimeMessage);
        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }
    /**
     * 参数构造
     */
    private SimpleMailMessage build(MessageCommand messageCommand){
        SimpleMailMessage message = new SimpleMailMessage();
        //邮件主题
        message.setSubject(messageCommand.getTopic());
        //邮件发送方
        message.setFrom(messageCommand.getSendAccount());
        //邮件接收者
        message.setTo(messageCommand.getRecieveAccount());
        //邮件内容文本
        message.setText(messageCommand.getTxt());
        //发送时间
        message.setSentDate(new Date());

        return message;
    }
}