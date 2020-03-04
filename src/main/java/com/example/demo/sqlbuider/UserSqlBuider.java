package com.example.demo.sqlbuider;

import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.jdbc.SQL;

import java.util.Map;

@Slf4j
public class UserSqlBuider {
    private static final String TABLE = "user";

    public String selectUserByName(Map<String,Object> map){
        String sql = "select * from "+TABLE+" where userTel='"+map.get("userTel")+"' and userPwd='"+map.get("userPwd")+"'";
        return sql;
    }

    public String selectUserByTel(Map<String,Object> map){
        String sql = "select * from "+TABLE+" where userTel='"+map.get("userTel")+"'";
        return sql;
    }

    public String getLastId(){
        String sql = "select userId from "+TABLE+" order by userId desc limit 1";
        return sql;
    }

    public String getPageCount(Map<String,Object> map){
        String conditions = (String) map.get("query");

        String WHERE = " where " + conditions + " ";

        String sql = "select count(1) from "+TABLE+WHERE;

        return sql;
    }

    public String getUserList(Map<String,Object> map){

        String conditions = (String) map.get("query");

        String WHERE = " where " + conditions + " ";

        String sql = "select *  from "+TABLE+WHERE+"limit "+(int)map.get("startRow")+","+(int) map.get("pageSize");

        return sql;
    }

    public String getResumeByUser(Map<String,Object> map){
        String sql = "select *  from "+TABLE+", resume "+" where user.resumeId = resume.resumeId and user.userId =  "+(int)map.get("userId");
        return sql;
    }

    //注册用户
    public String addUser () {
        return new SQL() {
            {
                INSERT_INTO(TABLE);
                VALUES("userName", "#{entity.userName}");
                VALUES("userPwd", "#{entity.userPwd}");
                VALUES("userTel", "#{entity.userTel}");
                VALUES("userAge", "#{entity.userAge}");
                VALUES("userEdu", "#{entity.userEdu}");
                VALUES("userState", "#{entity.userState}");
                VALUES("userSex", "#{entity.userSex}");
                VALUES("userBirth", "#{entity.userBirth}");
                VALUES("userWorkDate", "#{entity.userWorkDate}");
                VALUES("resumeId", "#{entity.resumeId}");
                VALUES("userEmail", "#{entity.userEmail}");
                VALUES("userPhoto", "#{entity.userPhoto}");
            }
        }.toString();
    }

    //修改信息
    public String updateUser () {
        return new SQL() {
            {
                UPDATE(TABLE);
                SET("userName=#{entity.userName},userTel=#{entity.userTel}," +
                        "userAge=#{entity.userAge},userEdu=#{entity.userEdu}," +
                        "userBirth=#{entity.userBirth},userWorkDate=#{entity.userWorkDate}," +
                        "userEmail=#{entity.userEmail},userPhoto=#{entity.userPhoto},resumeId=#{entity.resumeId},userSex=#{entity.userSex}");
                WHERE("userId=#{entity.userId}");
            }
        }.toString();
    }

    public String getById(){
        String sql = "select *  from "+TABLE+" where  userId = #{userId}";
        return sql;
    }

}
