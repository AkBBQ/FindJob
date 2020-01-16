package com.example.demo.entity;

import lombok.Data;

/**
 * 用户实体类
 * @author xxx
 */

@Data
public class User {
    private int userId;

    private String userName;

    private String userPwd;

    private String userTel;

    private int userAge;

    private String userEdu;

    /**
     * 1.离职-随时到岗  2.在职-考虑机会
     */
    private int userState;

    private String userSex;

    private String userBirth;

    private String userWorkDate;

    private int resumeId;

    private String userEmail;

    private String userPhoto;

}
