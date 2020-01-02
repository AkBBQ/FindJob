package com.example.demo.service.impl;

import com.example.demo.entity.Position;
import com.example.demo.entity.dto.PositionDTO;
import com.example.demo.mapper.PositionMapper;
import com.example.demo.service.PositionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PositionServiceImpl implements PositionService {

    @Autowired
    private PositionMapper positionMapper;

    @Override
    public List<PositionDTO> FindTopPosition() {
        return positionMapper.selectTopPosition();
    }

    @Override
    public int getPageCount(String query) {
        return positionMapper.getPageCount(query);
    }

    @Override
    public List<PositionDTO> getPositionList(int startRow, int pageSize, String query) {
        return positionMapper.getPositionList(startRow, pageSize, query);
    }

    @Override
    public PositionDTO getDetail(int positionId) {
        return positionMapper.getById(positionId);
    }

    @Override
    public void addPosition(Position position) {
         positionMapper.addPosition(position);
    }

    @Override
    public Position queryByPositionId(int id) {
        return positionMapper.queryByPositionId(id);
    }

    @Override
    public void updatePosition(Position position) {
        positionMapper.updatePosition(position);
    }

    @Override
    public void deletePosition(int id) {
        positionMapper.deletePosition(id);
    }

    @Override
    public Position getById(int id) {
        return positionMapper.getDetailById(id);
    }
}
