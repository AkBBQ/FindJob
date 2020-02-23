package com.example.demo.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.demo.entity.Position;
import com.example.demo.entity.dto.PositionDTO;
import com.example.demo.entity.query.PositionCommand;
import com.example.demo.mapper.PositionMapper;
import com.example.demo.service.PositionService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

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
    public List<PositionDTO> queryPositionList(int current, PositionCommand positionCommand) {
        List<PositionDTO> results = new ArrayList<>();

        QueryWrapper<Position> queryWrapper = new QueryWrapper();
        queryWrapper.in("position_id",positionCommand.getPositionId());
        IPage<Position> page = new Page<>();
        if(Objects.isNull(current)){
          page.setCurrent(1);
        }else {
        page.setCurrent(current);
        }
        page.setSize(10);
        IPage<Position> positionIPage = positionMapper.selectPage(page,queryWrapper);
        List<Position> records = positionIPage.getRecords();
        records.forEach(item->{
            PositionDTO positionDTO = new PositionDTO();
            BeanUtils.copyProperties(item,positionDTO);
            results.add(positionDTO);
        });
        return results;
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
