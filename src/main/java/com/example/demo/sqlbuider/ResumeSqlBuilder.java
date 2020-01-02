package com.example.demo.sqlbuider;

import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.jdbc.SQL;

import java.util.Map;

@Slf4j
public class ResumeSqlBuilder {

    private static final String TABLE = "resume";

    public String getPageCount(Map<String,Object> map){
        String conditions = (String) map.get("query");

        String WHERE = " where " + conditions + " ";

        String sql = "select count(1) from "+TABLE+WHERE;

        return sql;
    }

    public String getResumeList(Map<String,Object> map){

        String conditions = (String) map.get("query");

        String WHERE = " where " + conditions + " ";

        String sql = "select *  from "+TABLE+WHERE+"limit "+(int)map.get("startRow")+","+(int) map.get("pageSize");

        return sql;
    }
    //查询详情
    public String queryByResumeId (int resumeId) {
        String sql = "select * from "+TABLE+" where resumeId="+resumeId;
        return sql;
    }

    //查询详情
    public String queryByUserId (int userId) {
        String sql = "select * from "+TABLE+" where userId="+userId;
        return sql;
    }

    //增加信息
    public String addResume () {
        return new SQL() {
            {
                INSERT_INTO(TABLE);
                VALUES("personalPoint", "#{entity.personalPoint}");
                VALUES("desirePosition", "#{entity.desirePosition}");
                VALUES("workExperience", "#{entity.workExperience}");
                VALUES("projectExp", "#{entity.projectExp}");
                VALUES("eduExperience", "#{entity.eduExperience}");
                VALUES("userId", "#{entity.userId}");
                VALUES("address", "#{entity.address}");
                VALUES("resumeName", "#{entity.resumeName}");
                VALUES("resumePhoto", "#{entity.resumePhoto}");
                VALUES("resumeTel", "#{entity.resumeTel}");
            }
        }.toString();
    }

    //修改信息
    public String updateResume () {
        return new SQL() {
            {
                UPDATE(TABLE);
                SET("personalPoint=#{entity.personalPoint},desirePosition=#{entity.desirePosition}," +
                        "workExperience=#{entity.workExperience},projectExp=#{entity.projectExp}," +
                        "address=#{entity.address},resumeName=#{entity.resumeName}," +
                        "resumeName=#{entity.resumeName},resumePhoto=#{entity.resumePhoto},resumeTel=#{entity.resumeTel}");
                WHERE("resumeId=#{entity.resumeId}");
            }
        }.toString();
    }
}
