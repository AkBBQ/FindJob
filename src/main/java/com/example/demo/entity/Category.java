package com.example.demo.entity;

import lombok.Data;

/**
 * 分类类
 * @author xxx
 */

@Data
public class Category {
    /**
     * 分类id
     */
    private int categoryId;

    /**
     * 分类名称
     */
    private String categoryName;

    /**
     * 分类照片
     */
    private String categoryPhoto;
}
