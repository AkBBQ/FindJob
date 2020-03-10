package com.example.demo.Manger.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.example.demo.Manger.DeliverManger;
import com.example.demo.entity.Deliver;
import com.example.demo.mapper.MpMapper.MpDeliverMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * MP
company CRUD
 @author xxx
 */

@Slf4j
@Service
public class DeliverMangerImpl implements DeliverManger {

    @Autowired
    private MpDeliverMapper mpDeliverMapper;

    @Override
    public List<Deliver> queryUserDeliverHistory(Deliver deliver) {
        QueryWrapper<Deliver> wrapper = new QueryWrapper<>();
        wrapper.eq("userId",deliver.getUserId());
        return mpDeliverMapper.selectList(wrapper);
    }
}