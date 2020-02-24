package com.example.demo.Manger.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.example.demo.Manger.CompanyManger;
import com.example.demo.entity.Company;
import com.example.demo.mapper.MpMapper.MpCompanyMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * MP
company CRUD
 @author xxx
 */

@Slf4j
@Service
public class CompanyMangerImpl implements CompanyManger {

    @Autowired
    private MpCompanyMapper mpCompanyMapper;

    @Override
    public Company findCompanyByCompanyNum(String companyNum) {
        QueryWrapper<Company> wrapper = new QueryWrapper<>();
        wrapper.eq("companyNum",companyNum);
        return  mpCompanyMapper.selectOne(wrapper);
    }

    @Override
    public void addCompany(Company company) {
        try {
            mpCompanyMapper.insert(company);
        } catch (Exception e) {
            log.error("新增公司失败",e);
        }

    }
}