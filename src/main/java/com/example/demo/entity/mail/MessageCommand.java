package com.example.demo.entity.mail;

import lombok.Builder;
import lombok.Data;

/**
 * 邮件服务类
 */

@Builder
@Data
public class MessageCommand {


    /**
     * 邮件主题
     */
    private String topic;

    /**
     * 邮件正文
     */
    private String txt;

    /**
     * 发送邮件地址
     */
    private String sendAccount;

    /**
     * 收件邮箱地址 支持多个
     */
    private String[] recieveAccount;


}