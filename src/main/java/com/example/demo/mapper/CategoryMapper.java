package com.example.demo.mapper;

import com.example.demo.entity.Category;
import com.example.demo.sqlbuider.CategorySqlBuilder;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.SelectProvider;

import java.util.List;

@Mapper
public interface CategoryMapper {

    @SelectProvider(type = CategorySqlBuilder.class ,method = "getPageCount")
    @Options(flushCache = Options.FlushCachePolicy.FALSE, timeout = 10000)
    int getPageCount(@Param(value = "query") String query);

    @SelectProvider(type = CategorySqlBuilder.class ,method = "getCategoryList")
    @Options(flushCache = Options.FlushCachePolicy.FALSE, timeout = 10000)
    List<Category> getCategoryList(@Param(value = "startRow")int startRow, @Param(value = "pageSize")int pageSize, @Param(value = "query") String query);

    @SelectProvider(type = CategorySqlBuilder.class ,method = "queryByCategoryId")
    @Options(flushCache = Options.FlushCachePolicy.FALSE, timeout = 10000)
    Category queryByCategoryId(@Param(value = "categoryId") int id);

    @SelectProvider(type = CategorySqlBuilder.class ,method = "update")
    @Options(flushCache = Options.FlushCachePolicy.FALSE, timeout = 10000)
    int update(@Param(value = "entity") Category category);

    @SelectProvider(type = CategorySqlBuilder.class ,method = "queryAll")
    @Options(flushCache = Options.FlushCachePolicy.FALSE, timeout = 10000)
    List<Category> queryAll();
}
