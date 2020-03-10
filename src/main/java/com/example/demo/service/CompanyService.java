package com.example.demo.service;

import com.example.demo.entity.Company;

import java.util.List;

public interface CompanyService {

    List<Company> showCompany();

    int getPageCount(String query);

    List<Company> getCompanyList(int startRow, int pageSize,  String query);

    List<Company> selectByContion(String condition);

    Company backLogin(String companyNum, String companyPwd);

    Company queryByCompanyId(int id);

    void update(Company company);

    /**
     * 根据公司id查看公司详情
     * @param id
     * @return
     */
    Company getDetail(int id);
}
