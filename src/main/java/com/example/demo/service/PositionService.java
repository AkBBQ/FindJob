package com.example.demo.service;

import com.example.demo.entity.Position;
import com.example.demo.entity.dto.PositionDTO;
import com.example.demo.entity.query.PositionCommand;

import java.util.List;


/**
 * 职位服务
 *
 * @author xxx
 */
public interface PositionService {

    /**
     * 最新发布的职业
     *
     * @return
     */
    List<PositionDTO> FindTopPosition();

    int getPageCount(String query);

    /**
     * 分页获取职位列表
     *
     * @param startRow
     * @param pageSize
     * @param query
     * @return
     */
    List<PositionDTO> getPositionList(int startRow, int pageSize, String query);

    /**
     * 分页获取职位列表
     * Mybatis_plus实现
     */
    List<PositionDTO> queryPositionList(int current, PositionCommand positionCommand);


    /**
     * 根据职位ID获取职位详情
     *
     * @param positionId
     * @return
     */
    PositionDTO getDetail(int positionId);

    /**
     * 添加职位
     *
     * @param position
     */
    void addPosition(Position position);

    /**
     * 根据职位ID查询职位
     *
     * @param id
     * @return
     */
    Position queryByPositionId(int id);

    /**
     * 更新职位
     *
     * @param position
     */
    void updatePosition(Position position);

    /**
     * 删除职位
     *
     * @param id
     */
    void deletePosition(int id);

    /**
     * 根据职位ID查询职位
     *
     * @param id
     * @return
     */
    Position getById(int id);
}
