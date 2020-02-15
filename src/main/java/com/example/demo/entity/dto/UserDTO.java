package com.example.demo.entity.dto;

import lombok.Data;

/**
 * 用户信息类 前端展示对象
 * @author xxx
 */

@Data
public class UserDTO {
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

    private String userEmail;

    private String userPhoto;

    private String personalPoint;

    private String desirePosition;

    private String workExperience;

    private String projectExp;

    private String eduExperience;

    private String resumePhoto;

    private String address;

    private String resumeName;

    private String resumeTel;
}
