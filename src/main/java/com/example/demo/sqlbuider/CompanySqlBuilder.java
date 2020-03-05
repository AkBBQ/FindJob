package com.example.demo.sqlbuider;

import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.jdbc.SQL;

import java.util.Map;

@Slf4j
public class CompanySqlBuilder {

    private static final String TABLE = "company";

    public String showCompany(){
        String sql = "select * from "+TABLE+" where status = 0 LIMIT 0,12 ";
        return sql;
    }


    public String queryAll(){
        String sql = "select * from "+TABLE+" where status=0";
        return sql;
    }

    public String getPageCount(Map<String,Object> map){
        String conditions = (String) map.get("query");

        String WHERE = " where " + conditions + " and status=0 ";

        String sql = "select count(1) from "+TABLE+WHERE;

        return sql;
    }

    public String getCompanyList(Map<String,Object> map){

        String conditions = (String) map.get("query");

        String WHERE = " where " + conditions + " and status=0 ";

        String sql = "select *  from "+TABLE+WHERE+"limit "+(int)map.get("startRow")+","+(int) map.get("pageSize");

        return sql;
    }

    public String selectByContion(String condition){
        String sql = "select * from "+TABLE+ condition+" and and status=0 ";
        System.out.println(sql);
        return sql;
    }

    public String selectByCompanyNum(Map<String,Object> map){
        String sql = "select * from "+TABLE+" where companyNum='"+map.get("companyNum")+"' and companyPwd='"+map.get("companyPwd")+"'";
        return sql;
    }

    //修改密码
    public String updatePwd () {
        return new SQL() {
            {
                UPDATE(TABLE);
                SET("companyNum=#{companyNum}");
                WHERE("companyPwd=#{companyPwd}");
            }
        }.toString();
    }

    //查询公司详情
    public String selectByCompanyId (int companyId) {
        String sql = "select * from "+TABLE+" where companyId="+companyId;
        return sql;
    }

    //修改信息
    public String update () {
        return new SQL() {
            {
                UPDATE(TABLE);
                SET("companyName=#{entity.companyName},companyPerson=#{entity.companyPerson}," +
                        "companyShort=#{entity.companyShort},companyAddr=#{entity.companyAddr}," +
                        "companyPhoto=#{entity.companyPhoto},companyIntro=#{entity.companyIntro}," +
                        "startTime=#{entity.startTime},registerPrice=#{entity.registerPrice}," +
                        "companyInfo=#{entity.companyInfo},finance=#{entity.finance}," +
                        "releaseName=#{entity.releaseName},releasePosition=#{entity.releasePosition}," +
                        "companyType=#{entity.companyType}" );
                WHERE("companyId=#{entity.companyId}");
            }
        }.toString();
    }

}
