package com.example.demo.sqlbuider;

import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.jdbc.SQL;

import java.util.Map;

@Slf4j
public class PositionSqlBuilder {

    private static final String TABLE = "position";

    public String selectTopPosition(){
        String sql = "select * from "+TABLE+", company where company.companyId = position.companyId limit 0 , 9 ";
        System.out.println(sql);
        return sql;
    }

    public String getPageCount(Map<String,Object> map){
        String conditions = (String) map.get("query");

        String WHERE = " where " + conditions + " ";

        String sql = "select count(1) from "+TABLE+WHERE;

        return sql;
    }

    public String getPositionList(Map<String,Object> map){

        String conditions = (String) map.get("query");

        String WHERE = " where company.companyId = position.companyId and " + conditions + " ";

        String sql = "select *  from "+TABLE+", company "+WHERE+" order by releaseDate desc limit "+(int)map.get("startRow")+","+(int) map.get("pageSize");

        return sql;
    }

    public String getById () {
        return new SQL() {
            {
                SELECT("*");
                FROM(TABLE+",company,category ");
                WHERE("company.companyId = position.companyId and category.categoryId = position.categoryId and position.positionId=#{positionId}");
            }
        }.toString();
    }

    //增加信息
    public String addPosition () {
        return new SQL() {
            {
                INSERT_INTO(TABLE);
                VALUES("positionName", "#{entity.positionName}");
                VALUES("positionAddr", "#{entity.positionAddr}");
                VALUES("positionRequest", "#{entity.positionRequest}");
                VALUES("companyId", "#{entity.companyId}");
                VALUES("positionDesc", "#{entity.positionDesc}");
                VALUES("categoryId", "#{entity.categoryId}");
                VALUES("positionPrice", "#{entity.positionPrice}");
            }
        }.toString();
    }
    public String queryByPositionId () {
        return new SQL() {
            {
                SELECT("*");
                FROM(TABLE);
                WHERE("positionId=#{positionId}");
            }
        }.toString();
    }

    //修改信息
    public String updatePosition () {
        return new SQL() {
            {
                UPDATE(TABLE);
                SET("positionName=#{entity.positionName},positionAddr=#{entity.positionAddr}," +
                        "positionRequest=#{entity.positionRequest},positionDesc=#{entity.positionDesc}," +
                        "categoryId=#{entity.categoryId},positionPrice=#{entity.positionPrice}" );
                WHERE("positionId=#{entity.positionId}");
            }
        }.toString();
    }

    public String deletePosition(){
       String sql = "delete from "+TABLE+" where positionId=#{positionId}";
       return sql;
    }

    public String getDetailById () {
        return new SQL() {
            {
                SELECT("*");
                FROM(TABLE);
                WHERE("positionId=#{positionId}");
            }
        }.toString();
    }
}
