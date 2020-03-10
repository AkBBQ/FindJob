package com.example.demo.Manger;

import com.example.demo.entity.Deliver;

import java.util.List;

/**
 * All rights Reserved, Designed By www.maihaoche.com
 *
 * @Package com.example.demo.Manger
 * @author: angtai（angtai@maihaoche.com）
 * @date: 2020/2/21 4:13 PM
 * @Copyright: 2017-2020 www.maihaoche.com Inc. All rights reserved.
 */
public interface DeliverManger {
    /**
     * 根据用户ID 查看投递历史
     */
    List<Deliver> queryUserDeliverHistory(Deliver deliver);



}
