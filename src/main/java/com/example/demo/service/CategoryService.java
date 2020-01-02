package com.example.demo.service;

import com.example.demo.entity.Category;

import java.util.List;

public interface CategoryService {

    int getPageCount(String query);

    List<Category> getCategoryList(int startRow, int pageSize, String query);

    Category queryByCategoryId(int id);

    int update(Category category);

    List<Category> queryAll();
}
