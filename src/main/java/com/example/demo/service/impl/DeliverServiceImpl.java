package com.example.demo.service.impl;

import com.example.demo.entity.Deliver;
import com.example.demo.entity.dto.DeliverDTO;
import com.example.demo.mapper.DeliverMapper;
import com.example.demo.service.DeliverService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DeliverServiceImpl implements DeliverService {

    @Autowired
    private DeliverMapper deliverMapper;

    @Override
    public void addDeliver(Deliver deliver) {
        deliverMapper.addDeliver(deliver);
    }

    @Override
    public List<Deliver> queryByPositionId(int positionId, int userId) {
        return deliverMapper.selectByPositionId(positionId, userId);
    }

    @Override
    public int getPageCount(String condition) {
        return deliverMapper.getPageCount(condition);
    }

    @Override
    public List<DeliverDTO> getDeliverList(int startRow, int pageSize, String condition) {
        return deliverMapper.getDeliverList(startRow,pageSize,condition);
    }

    @Override
    public DeliverDTO getById(int id) {
        return deliverMapper.getById(id);
    }

    @Override
    public void updateDeliver(int deliverId, int state) {
        deliverMapper.updateDeliver(deliverId,state);
    }

    @Override
    public void updateFavorite(int deliverId, int favorite) {
        deliverMapper.updateFavourite(deliverId,favorite);
    }
}
