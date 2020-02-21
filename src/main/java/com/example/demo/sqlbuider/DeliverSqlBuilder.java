package com.example.demo.sqlbuider;

import org.apache.ibatis.jdbc.SQL;

import java.util.Map;

public class DeliverSqlBuilder {

    private static final String TABLE = "deliver";


    //增加信息
    public String addDeliver () {
        return new SQL() {
            {
                INSERT_INTO(TABLE);
                VALUES("userId", "#{entity.userId}");
                VALUES("positionId", "#{entity.positionId}");
                VALUES("companyId", "#{entity.companyId}");
                VALUES("resumeId", "#{entity.resumeId}");
            }
        }.toString();
    }

    //查询详情
    public String selectByPositionId (int positionId, int userId) {
        String sql = "select * from "+TABLE+" where positionId="+positionId+" and userId="+userId;
        return sql;
    }

    public String getPageCount(Map<String,Object> map){
        String conditions = (String) map.get("condition");

        String WHERE = " where user.userId = deliver.userId and deliver.resumeId = resume.resumeId and " + conditions + " ";

        String sql = "select count(1) from "+TABLE+", user,resume"+WHERE;

        return sql;
    }

    public String getDeliverList(Map<String,Object> map){

        String conditions = (String) map.get("condition");

        String WHERE = " where user.userId = deliver.userId and deliver.resumeId = resume.resumeId and " + conditions + " ";

        String sql = "select *  from "+TABLE+", user,resume"+WHERE+" order by deliverTime desc limit "+(int)map.get("startRow")+","+(int) map.get("pageSize");

        return sql;
    }

    public String getById(int deliverId){

        String WHERE = " where user.userId = deliver.userId and deliver.resumeId = resume.resumeId and deliverId="+deliverId;

        String sql = "select *  from "+TABLE+", user,resume"+WHERE;

        return sql;
    }

    //修改信息
    public String updateDeliver () {
        return new SQL() {
            {
                UPDATE(TABLE);
                SET("state=#{state} "
                );
                WHERE("deliverId=#{deliverId}");
            }
        }.toString();
    }
}