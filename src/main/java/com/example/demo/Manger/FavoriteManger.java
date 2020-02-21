package com.example.demo.Manger;

import com.example.demo.entity.Favorite;

/**
 * All rights Reserved, Designed By www.maihaoche.com
 *
 * @Package com.example.demo.Manger
 * @author: angtai（angtai@maihaoche.com）
 * @date: 2020/2/21 4:13 PM
 * @Copyright: 2017-2020 www.maihaoche.com Inc. All rights reserved.
 */
public interface FavoriteManger {
    /**
     * 根据用户ID、公司id/职位id 查看是否收藏
     */
    Favorite findFavourite(Favorite favorite);

    /**
     * 新增我的收藏
     * @param favorite
     */
    void addFavourite(Favorite favorite);
}
