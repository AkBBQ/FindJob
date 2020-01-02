package com.example.demo.config;

import java.math.BigDecimal;

/** 
 *  1. 功能：基础配置类
*/

public class BaseConfig {

    /**
     * AES通用请求密钥
     */
    public static final String AES_KEY = "1234567812345678";

    /**
     * TOKEN 秘钥
     */
    public static final String TOKEN_KEY = "LDC!@#456&*()789";

    /**
     * 邮箱AES TOKEN密钥
     */
    public static final String AES_TOKEN_MAIL = "LaiDan!@#456&*()";

    /**
     * 积分规则
     */
    public static final BigDecimal INTEGRAL_RULE = new BigDecimal(10);

    /**
     *  发送短信-联系电话
     */
    public static final String SEND_MESSAGES_TEL = "400-670-1117";

}
