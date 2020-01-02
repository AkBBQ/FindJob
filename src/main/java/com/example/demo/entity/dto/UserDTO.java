package com.example.demo.entity.dto;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class UserDTO {
    private String userName;

    private String userPwd;

    private String userTel;

    private int userAge;

    private String userEdu;

    private int userState;//1.离职-随时到岗  2.在职-考虑机会

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
