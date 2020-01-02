package com.example.demo.service;

import com.example.demo.entity.User;
import com.example.demo.entity.dto.UserDTO;

import java.util.List;

public interface UserService {

    User login(String userTel, String userPwd);

    void register(User user);

    User findByTel(String userTel);

    UserDTO findResumeByUser(int userId);

    int getPageCount(String query);

    List<User> getUserList(int startRow, int pageSize, String query);

    int getLastId();

    void updateUser(User user);

    User getById(int userId);
}
