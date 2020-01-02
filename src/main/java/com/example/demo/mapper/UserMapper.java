package com.example.demo.mapper;

import com.example.demo.entity.User;
import com.example.demo.entity.dto.UserDTO;
import com.example.demo.sqlbuider.UserSqlBuider;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.SelectProvider;

import java.util.List;

@Mapper
public interface UserMapper {

    @SelectProvider(type = UserSqlBuider.class ,method = "selectUserByName")
    @Options(flushCache = Options.FlushCachePolicy.FALSE, timeout = 10000)
    User selectUserByName(@Param(value = "userTel") String userTel, @Param(value = "userPwd") String userPwd);

    @SelectProvider(type = UserSqlBuider.class ,method = "getPageCount")
    @Options(flushCache = Options.FlushCachePolicy.FALSE, timeout = 10000)
    int getPageCount(@Param(value = "query") String query);


    @SelectProvider(type = UserSqlBuider.class ,method = "getUserList")
    @Options(flushCache = Options.FlushCachePolicy.FALSE, timeout = 10000)
    List<User> getUserList(@Param(value = "startRow")int startRow, @Param(value = "pageSize")int pageSize, @Param(value = "query") String query);

    @SelectProvider(type = UserSqlBuider.class ,method = "addUser")
    @Options(flushCache = Options.FlushCachePolicy.FALSE, timeout = 10000)
    void addUser(@Param(value = "entity")User user);

    @SelectProvider(type = UserSqlBuider.class ,method = "selectUserByTel")
    @Options(flushCache = Options.FlushCachePolicy.FALSE, timeout = 10000)
    User selectUserByTel(@Param(value = "userTel") String userTel);

    @SelectProvider(type = UserSqlBuider.class ,method = "getResumeByUser")
    @Options(flushCache = Options.FlushCachePolicy.FALSE, timeout = 10000)
    UserDTO getResumeByUser(@Param(value = "userId") int userId);

    @SelectProvider(type = UserSqlBuider.class ,method = "getLastId")
    @Options(flushCache = Options.FlushCachePolicy.FALSE, timeout = 10000)
    int getLastId();

    @SelectProvider(type = UserSqlBuider.class ,method = "updateUser")
    @Options(flushCache = Options.FlushCachePolicy.FALSE, timeout = 10000)
    void updateUser(@Param(value = "entity")User user);

    @SelectProvider(type = UserSqlBuider.class ,method = "getById")
    @Options(flushCache = Options.FlushCachePolicy.FALSE, timeout = 10000)
    User getById(@Param(value = "userId") int userId);
}
