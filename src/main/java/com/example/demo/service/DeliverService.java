package com.example.demo.service;

import com.example.demo.entity.Deliver;
import com.example.demo.entity.dto.DeliverDTO;

import java.util.List;

public interface DeliverService {

    /**
     * 添加投递记录
     */
    void addDeliver(Deliver deliver);

    /**
     * 根据职位和用户id查询投递详情
     */
    List<Deliver> queryByPositionId(int positionId, int userId);

    /**
     *  查看用户投递记录
     */
    List<Deliver> queryUserDeliverHistory(int userId);

    /**
     * 页数统计
     */
    int getPageCount(String condition);

    /**
     * 分页查询投递记录
     */
    List<DeliverDTO> getDeliverList(int startRow, int pageSize, String condition);

    /**
     * 根据id获取投递详情
     * @param id
     * @return
     */
    DeliverDTO getById(int id);

    /**
     * 更新投递记录
     */
    void updateDeliver(int deliverId, int state);



}
