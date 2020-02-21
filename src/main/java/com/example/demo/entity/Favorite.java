package com.example.demo.entity;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.IdType;
import lombok.Builder;
import lombok.Data;

/**
 * 我的收藏 实体类
 * @author xxx
 */
@Builder
@Data
@TableName("Favorite")
public class Favorite {

    @TableId(value = "id", type = IdType.INPUT)
    private int id;

    @TableField(value = "position_id")
    private int positionId;

    @TableField(value = "company_id")
    private int companyId;

    @TableField(value = "user_id")
    private int userId;

    @TableField(value = "status")
    private int status;



}