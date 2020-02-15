package com.example.demo.entity;

import lombok.Data;

/**
 * 公司实体类
 * @author xxx
 */
@Data
public class Company {
    /**
     * 公司id
     */
    private Integer companyId;

    /**
     * 公司名称
     */
    private String companyName;

    /**
     * 公司电话
     */
    private String companyNum;

    /**
     * 公司密码
     */
    private String companyPwd;

    /**
     * 公司人数
     */
    private String companyPerson;

    /**
     * 公司简介
     */
    private String companyShort;

    /**
     * 地址
     */
    private String companyAddr;

    /**
     * 照片
     */
    private String companyPhoto;

    /**
     * 公司介绍
     */
    private String companyIntro;

    /**
     * 成立时间
     */
    private String startTime;

    /**
     * 注册地址
     */
    private float registerPrice;

    /**
     * 发布人姓名
     */
    private String releaseName;

    /**
     * 发布人照片
     */
    private String releasePhoto;

    /**
     * 发布人职位
     */
    private String releasePosition;

    /**
     * 公司介绍
     */
    private String companyInfo;

    /**
     * 融资情况
     */
    private String finance;

    /**
     * 公司类型
     */
    private String companyType;

    /**
     * 状态
     */
    private int status;

}
