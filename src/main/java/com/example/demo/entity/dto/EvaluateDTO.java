package com.example.demo.entity.dto;

import lombok.Data;

/**
 * 评价交互对象
 * @author xxx
 *
 */

@Data
public class EvaluateDTO {

    /**
     * 用户id
     */
    private Integer userId;

    /**
     * 用户名字
     */
    private String userName;

    /**
     * 职位id
     */
    private Integer positionId;

    /**
     * 职位名称
     */
    private String positionName;

    /**
     * 公司id
     */
    private Integer companyId;

    /**
     * 评星
     */
    private String star;

    /**
     * 评论
     */
    private String content;

    /**
     * 评价是时间
     */
    private String createTime;
}