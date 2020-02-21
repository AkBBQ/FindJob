package com.example.demo.mapper;

import com.example.demo.entity.Deliver;
import com.example.demo.entity.dto.DeliverDTO;
import com.example.demo.sqlbuider.DeliverSqlBuilder;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.SelectProvider;

import java.util.List;

@Mapper
public interface DeliverMapper {

    @SelectProvider(type = DeliverSqlBuilder.class ,method = "addDeliver")
    @Options(flushCache = Options.FlushCachePolicy.FALSE, timeout = 10000)
    void addDeliver(@Param(value = "entity") Deliver deliver);

    @SelectProvider(type = DeliverSqlBuilder.class ,method = "selectByPositionId")
    @Options(flushCache = Options.FlushCachePolicy.FALSE, timeout = 10000)
    List<Deliver> selectByPositionId(@Param(value = "positionId") int positionId, @Param(value = "userId")int userId);

    @SelectProvider(type = DeliverSqlBuilder.class ,method = "getPageCount")
    @Options(flushCache = Options.FlushCachePolicy.FALSE, timeout = 10000)
    int getPageCount(@Param(value = "condition") String condition);

    @SelectProvider(type = DeliverSqlBuilder.class ,method = "getDeliverList")
    @Options(flushCache = Options.FlushCachePolicy.FALSE, timeout = 10000)
    List<DeliverDTO> getDeliverList(@Param(value = "startRow")int startRow, @Param(value = "pageSize")int pageSize, @Param(value = "condition")String condition);

    @SelectProvider(type = DeliverSqlBuilder.class ,method = "getById")
    @Options(flushCache = Options.FlushCachePolicy.FALSE, timeout = 10000)
    DeliverDTO getById(@Param(value = "deliverId") int deliverId);

    @SelectProvider(type = DeliverSqlBuilder.class ,method = "updateDeliver")
    @Options(flushCache = Options.FlushCachePolicy.FALSE, timeout = 10000)
    void updateDeliver(@Param(value = "deliverId")int deliverId, @Param(value = "state")int state);
}
