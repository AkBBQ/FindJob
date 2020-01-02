package com.example.demo.service.impl;

import com.example.demo.entity.User;
import com.example.demo.entity.dto.UserDTO;
import com.example.demo.mapper.UserMapper;
import com.example.demo.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

    @Override
    public User login(String userTel, String userPwd) {
        return userMapper.selectUserByName(userTel,userPwd);
    }

    @Override
    public void register(User user) {
        userMapper.addUser(user);
    }

    @Override
    public User findByTel(String userTel) {
        return userMapper.selectUserByTel(userTel);
    }

    @Override
    public UserDTO findResumeByUser(int userId) {
        return userMapper.getResumeByUser(userId);
    }

    @Override
    public int getPageCount(String query) {
        return userMapper.getPageCount(query);
    }

    @Override
    public List<User> getUserList(int startRow, int pageSize, String query) {
        return userMapper.getUserList(startRow, pageSize, query);
    }

    @Override
    public int getLastId() {
        return userMapper.getLastId();
    }

    @Override
    public void updateUser(User user) {
        userMapper.updateUser(user);
    }

    @Override
    public User getById(int userId) {
        return userMapper.getById(userId);
    }
}
