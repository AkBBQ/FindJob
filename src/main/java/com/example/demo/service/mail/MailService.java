package com.example.demo.service.mail;


import com.example.demo.entity.mail.MessageCommand;

/**
 * 邮件发送服务
 */
public interface MailService {


     /**
      * 给求职者发消息
      * @param messageCommand
      */
     void sendResultToJobSeeker(MessageCommand messageCommand);

     /**
      * 有附件的邮件发送
      * @param messageCommand
      */
     void sendAttachFile(MessageCommand messageCommand);
}
