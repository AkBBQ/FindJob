package com.example.demo.service;

import com.example.demo.entity.Deliver;
import com.example.demo.entity.dto.DeliverDTO;

import java.util.List;

public interface DeliverService {

    void addDeliver(Deliver deliver);

    List<Deliver> queryByPositionId(int positionId, int userId);

    int getPageCount(String condition);

    List<DeliverDTO> getDeliverList(int startRow, int pageSize, String condition);

    DeliverDTO getById(int id);

    void updateDeliver(int deliverId, int state);
}
