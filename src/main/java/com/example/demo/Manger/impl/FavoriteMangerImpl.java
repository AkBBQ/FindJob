package com.example.demo.Manger.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.example.demo.Manger.FavoriteManger;
import com.example.demo.entity.Favorite;
import com.example.demo.mapper.FavouriteMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Objects;

/**
 * All rights Reserved, Designed By www.maihaoche.com
 *
 * @Package com.example.demo.Manger.impl
 * @author: angtai（angtai@maihaoche.com）
 * @date: 2020/2/21 4:13 PM
 * @Copyright: 2017-2020 www.maihaoche.com Inc. All rights reserved.
 */

@Service
public class FavoriteMangerImpl implements FavoriteManger {
    @Autowired
    private FavouriteMapper favouriteMapper;

    @Override
    public List<Favorite> findFavourite(Favorite favorite) {

        QueryWrapper<Favorite> wrapper = new QueryWrapper<>();
        wrapper.eq("user_id",favorite.getUserId());
        if(Objects.nonNull(favorite.getCompanyId()) && !Integer.valueOf(0).equals(favorite.getCompanyId())){
            wrapper.eq("company_id",favorite.getCompanyId());
        }
        if(Objects.nonNull(favorite.getPositionId()) && !Integer.valueOf(0).equals(favorite.getPositionId())){
            wrapper.eq("position_id",favorite.getPositionId());
        }
        return favouriteMapper.selectList(wrapper);
    }

    @Override
    public void addFavourite(Favorite favorite) {
        favouriteMapper.insert(favorite);
    }
}