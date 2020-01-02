package com.example.demo.service;

import com.example.demo.entity.Company;

import java.util.List;

public interface CompanyService {

    List<Company> showCompany();

    List<Company> queryAll();

    int getPageCount(String query);

    List<Company> getCompanyList(int startRow, int pageSize,  String query);

    List<Company> selectByContion(String condition);

    Company backLogin(String companyNum, String companyPwd);

    void updatePwd(String companyNum, String companyPwd);

    Company queryByCompanyId(int id);

    int update(Company company);

    Company getDetail(int id);
}
