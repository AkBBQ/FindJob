package com.example.demo.entity.redis;

import com.example.demo.entity.Company;
import lombok.Data;

import java.util.List;

/**
 * 公司
 * Json <=> 实体类
 */

@Data
public class RedisCompanyDTO {

    private List<Company> companyList;
}