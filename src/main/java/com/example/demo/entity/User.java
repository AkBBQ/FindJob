package com.example.demo.entity;

import lombok.Data;

/**
 * 用户实体类
 * @author xxx
 */

@Data
public class User {
    /**
     * 用户id 数据库自增
     */
    private int userId;

    /**
     * 用户名
     */
    private String userName;

    /**
     * 用户密码
     */
    private String userPwd;

    /**
     * 手机号(登陆用)
     */
    private String userTel;

    /**
     * 年纪
     */
    private int userAge;

    /**
     * 教育
     */
    private String userEdu;

    /**
     * 1.离职-随时到岗  2.在职-考虑机会
     */
    private int userState;

    /**
     * 性别
     */
    private String userSex;

    /**
     * 生日
     */
    private String userBirth;

    /**
     * 工作日期
     */
    private String userWorkDate;

    /**
     * 关联的简历ID
     */
    private int resumeId;

    /**
     * 用户email
     */
    private String userEmail;

    /**
     * 用户照片
     */
    private String userPhoto;

}
