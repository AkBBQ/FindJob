package com.example.demo.service;

import com.example.demo.entity.User;
import com.example.demo.entity.dto.UserDTO;

import java.util.List;

/**
 * 用户服务
 * @author xxx
 */
public interface UserService {

    /**
     * 登录
     * @param userTel 手机号
     * @param userPwd 密码
     * @return
     */
    User login(String userTel, String userPwd);

    /**
     * 注册
     * @param user
     */
    void register(User user);

    /**
     * 根据手机号查找
     * @param userTel
     * @return
     */
    User findByTel(String userTel);

    /**
     * 根据用户id查找用户详情
     * @param userId
     * @return
     */
    UserDTO findResumeByUser(int userId);

    /**
     * 页数统计
     * @param query
     * @return
     */
    int getPageCount(String query);

    /**
     * 分页查看用户列表
     * @param startRow
     * @param pageSize
     * @param query
     * @return
     */
    List<User> getUserList(int startRow, int pageSize, String query);


    /**
     * 获取最新的用户id
     * @return
     */
    int getLastId();

    /**
     * 更新用户
     * @param user
     */
    void updateUser(User user);

    /**
     * 根据用户地查找用户信息
     * @param userId
     * @return
     */
    User getById(int userId);
}
