package com.example.demo.entity;

import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import lombok.Data;

/**
 * 公司实体类
 * @author xxx
 */
@TableName("company")
@Data
public class Company {
    /**
     * 公司id
     */
    @TableId(value = "companyId")
    private Integer companyId;

    /**
     * 公司名称
     */
    @TableId(value = "companyName")
    private String companyName;

    /**
     * 公司账号
     */
    @TableId(value = "companyNum")
    private String companyNum;

    /**
     * 公司密码
     */
    @TableId(value = "companyPwd")
    private String companyPwd;

    /**
     * 公司人数
     */
    @TableId(value = "companyPerson")
    private String companyPerson;

    /**
     * 公司简介
     */
    @TableId(value = "companyShort")
    private String companyShort;

    /**
     * 地址
     */
    @TableId(value = "companyAddr")
    private String companyAddr;

    /**
     * 照片
     */
    @TableId(value = "companyPhoto")
    private String companyPhoto;

    /**
     * 公司介绍
     */
    @TableId(value = "companyIntro")
    private String companyIntro;

    /**
     * 成立时间
     */
    @TableId(value = "startTime")
    private String startTime;

    /**
     * 注册地址
     */
    @TableId(value = "registerPrice")
    private float registerPrice;

    /**
     * 发布人姓名
     */
    @TableId(value = "releaseName")
    private String releaseName;

    /**
     * 发布人照片
     */
    @TableId(value = "releasePhoto")
    private String releasePhoto;

    /**
     * 发布人职位
     */
    @TableId(value = "releasePosition")
    private String releasePosition;

    /**
     * 公司介绍
     */
    @TableId(value = "companyInfo")
    private String companyInfo;

    /**
     * 融资情况
     */
    @TableId(value = "finance")
    private String finance;

    /**
     * 公司类型
     */
    @TableId(value = "companyType")
    private String companyType;

    /**
     * 状态
     */
    @TableId(value = "status")
    private int status;

}
