package com.example.demo.service.impl;

import com.example.demo.entity.Category;
import com.example.demo.mapper.CategoryMapper;
import com.example.demo.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CategoryServiceImpl implements CategoryService {

    @Autowired
    private CategoryMapper categoryMapper;

    @Override
    public int getPageCount(String query) {
        return categoryMapper.getPageCount(query);
    }

    @Override
    public List<Category> getCategoryList(int startRow, int pageSize, String query) {
        return categoryMapper.getCategoryList(startRow, pageSize, query);
    }

    @Override
    public Category queryByCategoryId(int id) {
        return categoryMapper.queryByCategoryId(id);
    }

    @Override
    public void update(Category category) {
         categoryMapper.update(category);
    }

    @Override
    public List<Category> queryAll() {
        return categoryMapper.queryAll();
    }
}
