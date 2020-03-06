package com.example.demo.entity.redis;

import com.example.demo.entity.dto.PositionDTO;
import lombok.Data;

import java.util.List;

/**
 * 职位
 * Json <=> 实体类
 */

@Data
public class RedisPositionDTO {

    private List<PositionDTO> positionList;
}