package com.example.demo.sqlbuider;

import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.jdbc.SQL;

import java.util.Map;

@Slf4j
public class CategorySqlBuilder {

    private static final String TABLE = "category";

    public String getPageCount(Map<String,Object> map){
        String conditions = (String) map.get("query");

        String WHERE = " where " + conditions + " ";

        String sql = "select count(1) from "+TABLE+WHERE;

        return sql;
    }

    public String getCategoryList(Map<String,Object> map){

        String conditions = (String) map.get("query");

        String WHERE = " where " + conditions + " ";

        String sql = "select *  from "+TABLE+WHERE+"limit "+(int)map.get("startRow")+","+(int) map.get("pageSize");

        return sql;
    }

    //查询详情
    public String queryByCategoryId (int categoryId) {
        String sql = "select * from "+TABLE+" where categoryId="+categoryId;
        return sql;
    }

    public String queryAll () {
        String sql = "select * from "+TABLE;
        return sql;
    }

    //修改房屋信息
    public String update () {
        return new SQL() {
            {
                UPDATE(TABLE);
                SET("categoryName=#{entity.categoryName},categoryPhoto=#{entity.categoryPhoto} "
                         );
                WHERE("categoryId=#{entity.categoryId}");
            }
        }.toString();
    }
}
