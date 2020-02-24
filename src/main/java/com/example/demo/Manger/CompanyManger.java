package com.example.demo.Manger;

import com.example.demo.entity.Company;

/**
 * All rights Reserved, Designed By www.maihaoche.com
 *
 * @Package com.example.demo.Manger
 * @author: angtai（angtai@maihaoche.com）
 * @date: 2020/2/21 4:13 PM
 * @Copyright: 2017-2020 www.maihaoche.com Inc. All rights reserved.
 */
public interface CompanyManger {

    /**
     * 根据公司账号查找公司
     */
    Company findCompanyByCompanyNum(String companyNum);

    /**
     * 注册公司
     */
    void addCompany(Company company);



}
