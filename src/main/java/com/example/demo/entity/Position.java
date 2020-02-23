package com.example.demo.entity;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.IdType;
import lombok.Data;

/**
 * 职位实体类
 *
 * @author xxx
 */

@TableName("position")
@Data
public class Position {

    @TableId(value = "position_id", type = IdType.INPUT)
    private Integer positionId;

    @TableField(value = "position_name")
    private String positionName;

    @TableField(value = "position_addr")
    private String positionAddr;

    @TableField(value = "position_request")
    private String positionRequest;

    @TableField(value = "company_id")
    private Integer companyId;

    @TableField(value = "positionDesc")
    private String positionDesc;

//    private Integer categoryId;
//
//    private String positionPrice;
//
//    private String releaseDate;
}
