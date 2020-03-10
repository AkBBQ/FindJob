package com.example.demo.service.impl;

import com.example.demo.entity.Company;
import com.example.demo.mapper.CompanyMapper;
import com.example.demo.service.CompanyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CompanyServiceImpl implements CompanyService {

    @Autowired
    private CompanyMapper companyMapper;

    @Override
    public List<Company> showCompany() {
        return companyMapper.showCompany();
    }

    @Override
    public int getPageCount(String query) {
        return companyMapper.getPageCount(query);
    }

    @Override
    public List<Company> getCompanyList(int startRow, int pageSize, String query) {
        return companyMapper.getCompanyList(startRow, pageSize, query);
    }

    @Override
    public List<Company> selectByContion(String condition) {
        return companyMapper.selectByContion(condition);
    }

    @Override
    public Company backLogin(String companyNum, String companyPwd) {
        return companyMapper.queryByCompanyNum(companyNum, companyPwd);
    }

    @Override
    public Company queryByCompanyId(int id) {
        return companyMapper.selectByCompanyId(id);
    }

    @Override
    public void update(Company company) {
         companyMapper.update(company);
    }

    @Override
    public Company getDetail(int id) {
        return companyMapper.selectByCompanyId(id);
    }
}
