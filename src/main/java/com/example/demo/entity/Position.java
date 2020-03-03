package com.example.demo.entity;

import com.baomidou.mybatisplus.annotations.TableName;
import lombok.Data;

/**
 * 职位实体类
 *
 * @author xxx
 */

@TableName("position")
@Data
public class Position {

    private Integer positionId;

    private String positionName;

    private String positionAddr;

    private String positionRequest;

    private Integer companyId;

    private String positionDesc;

    private Integer categoryId;

    private String positionPrice;

    private String releaseDate;
}
