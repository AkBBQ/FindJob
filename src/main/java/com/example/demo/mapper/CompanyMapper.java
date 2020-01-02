package com.example.demo.mapper;

import com.example.demo.entity.Company;
import com.example.demo.sqlbuider.CompanySqlBuilder;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.SelectProvider;

import java.util.List;

@Mapper
public interface CompanyMapper {

    @SelectProvider(type = CompanySqlBuilder.class ,method = "showCompany")
    @Options(flushCache = Options.FlushCachePolicy.FALSE, timeout = 10000)
    List<Company> showCompany();

    @SelectProvider(type = CompanySqlBuilder.class ,method = "queryAll")
    @Options(flushCache = Options.FlushCachePolicy.FALSE, timeout = 10000)
    List<Company> queryAll();

    @SelectProvider(type = CompanySqlBuilder.class ,method = "getPageCount")
    @Options(flushCache = Options.FlushCachePolicy.FALSE, timeout = 10000)
    int getPageCount(@Param(value = "query") String query);

    @SelectProvider(type = CompanySqlBuilder.class ,method = "getCompanyList")
    @Options(flushCache = Options.FlushCachePolicy.FALSE, timeout = 10000)
    List<Company> getCompanyList(@Param(value = "startRow")int startRow, @Param(value = "pageSize")int pageSize, @Param(value = "query") String query);

    @SelectProvider(type = CompanySqlBuilder.class ,method = "selectByContion")
    @Options(flushCache = Options.FlushCachePolicy.FALSE, timeout = 10000)
    List<Company> selectByContion(@Param(value = "condition")String condition);

    @SelectProvider(type = CompanySqlBuilder.class ,method = "selectByCompanyNum")
    @Options(flushCache = Options.FlushCachePolicy.FALSE, timeout = 10000)
    Company queryByCompanyNum(@Param(value = "companyNum")String companyNum, @Param(value = "companyPwd")String companyPwd);

    @SelectProvider(type = CompanySqlBuilder.class ,method = "updatePwd")
    @Options(flushCache = Options.FlushCachePolicy.FALSE, timeout = 10000)
    void updatePwd(@Param(value = "companyNum")String companyNum, @Param(value = "companyPwd")String companyPwd);

    @SelectProvider(type = CompanySqlBuilder.class ,method = "selectByCompanyId")
    @Options(flushCache = Options.FlushCachePolicy.FALSE, timeout = 10000)
    Company selectByCompanyId(@Param(value = "companyId")int companyId);

    @SelectProvider(type = CompanySqlBuilder.class ,method = "update")
    @Options(flushCache = Options.FlushCachePolicy.FALSE, timeout = 10000)
    int update(@Param(value = "entity")Company company);

}
