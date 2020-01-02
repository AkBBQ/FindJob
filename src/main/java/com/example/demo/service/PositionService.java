package com.example.demo.service;

import com.example.demo.entity.Position;
import com.example.demo.entity.dto.PositionDTO;

import java.util.List;


/**
 * 职位服务
 */
public interface PositionService {

    /**
     * 最热职业
     * @return
     */
    List<PositionDTO> FindTopPosition();

    int getPageCount(String query);

    List<PositionDTO> getPositionList(int startRow, int pageSize,  String query);

    PositionDTO getDetail(int positionId);

    void addPosition(Position position);

    Position queryByPositionId(int id);

    void updatePosition(Position position);

    void deletePosition(int id);

    Position getById(int id);
}
