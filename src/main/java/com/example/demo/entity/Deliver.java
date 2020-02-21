package com.example.demo.entity;


import lombok.Data;

/**
 * 投递职位记录实体类
 * @author xxx
 */

@Data
public class Deliver {
    private int deliverId;

    /**
     * 用户id
     */
    private int userId;

    /**
     * 职位id
     */
    private int positionId;

    /**
     * 公司id
     */
    private int companyId;

    /**
     * 简历id
     */
    private int resumeId;

    /**
     * 投递状态 1,已同意 2 已拒绝 3 已投递
     */
    private int state;

    /**
     * 投递时间
     */
    private String deliverTime;
}
