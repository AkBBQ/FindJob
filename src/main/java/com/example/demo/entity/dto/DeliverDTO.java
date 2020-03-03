package com.example.demo.entity.dto;

import lombok.Data;

/**
 * 投递简历DTO
 * @author xxx
 */
@Data
public class DeliverDTO {

    private int deliverId;

    private String userName;

    private Integer resumeId;

    private String personalPoint;

    private String desirePosition;

    private String workExperience;

    private String projectExp;

    private String eduExperience;

    private String resumePhoto;

    private String address;

    private String resumeName;

    private String resumeTel;

    /**
     * 投递状态 1,已同意 2 已拒绝 3 已投递
     */
    private int state;

    /**
     * 描述
     */
    private String stateDesc;



    private String deliverTime;

    /**
     * 职位名称
     */
    private String positionName;

    /**
     * 职位id
     */
    private Integer positionId;

    /**
     * 公司名称
     */
    private String companyName;
}
