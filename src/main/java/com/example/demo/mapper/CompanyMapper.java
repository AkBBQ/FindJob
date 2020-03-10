package com.example.demo.mapper;

import com.example.demo.entity.Company;
import com.example.demo.sqlbuider.CompanySqlBuilder;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface CompanyMapper {
    /**
     * 查询前十二家公司
     * @return
     */
    @Select("select * from company where status = 0 LIMIT 0,12")
    List<Company> showCompany();

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


    /**
     * 根据公司id查看公司信息
     * @param companyId
     * @return
     */
    @Select("select * from company where companyId=#{companyId}")
    Company selectByCompanyId(@Param(value = "companyId")int companyId);

    @SelectProvider(type = CompanySqlBuilder.class ,method = "update")
    @Options(flushCache = Options.FlushCachePolicy.FALSE, timeout = 10000)
    void update(@Param(value = "entity")Company company);

}
