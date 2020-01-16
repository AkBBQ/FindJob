package com.example.demo.entity;

import lombok.Data;

/**
 * 简历实体类
 * @author xxx
 */

@Data
public class Resume {

    private int resumeId;

    private String personalPoint;

    private String desirePosition;

    private String workExperience;

    private String projectExp;

    private String eduExperience;

    private int userId;

    private String resumePhoto;

    private String address;

    private String resumeName;

    private String resumeTel;

}
