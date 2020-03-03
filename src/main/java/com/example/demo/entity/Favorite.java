package com.example.demo.entity;

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

    private int positionId;

    private int companyId;

    private int userId;

    private int status;



}