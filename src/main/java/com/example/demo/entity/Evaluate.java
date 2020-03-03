package com.example.demo.entity;

import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import lombok.Data;

import java.util.Date;

/**
 * 评价类实体
 * @author xxx
 *
 */

@TableName("complaint")
@Data
public class Evaluate {

    /**
     * 主键ID
     */
    @TableId(value = "complaintId")
    private Integer complaintId;

    /**
     * 用户id
     */
    private Integer userId;

    /**
     * 职位id
     */
    private Integer positionId;

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
    private Date createTime;
}