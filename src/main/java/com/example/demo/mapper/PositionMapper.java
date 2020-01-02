package com.example.demo.mapper;

import com.example.demo.entity.Position;
import com.example.demo.entity.dto.PositionDTO;
import com.example.demo.sqlbuider.PositionSqlBuilder;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.SelectProvider;

import java.util.List;

@Mapper
public interface PositionMapper {

    @SelectProvider(type = PositionSqlBuilder.class ,method = "selectTopPosition")
    @Options(flushCache = Options.FlushCachePolicy.FALSE, timeout = 10000)
    List<PositionDTO> selectTopPosition();


    @SelectProvider(type = PositionSqlBuilder.class ,method = "getPageCount")
    @Options(flushCache = Options.FlushCachePolicy.FALSE, timeout = 10000)
    int getPageCount(@Param(value = "query") String query);



    @SelectProvider(type = PositionSqlBuilder.class ,method = "getPositionList")
    @Options(flushCache = Options.FlushCachePolicy.FALSE, timeout = 10000)
    List<PositionDTO> getPositionList(@Param(value = "startRow")int startRow, @Param(value = "pageSize")int pageSize, @Param(value = "query") String query);


    /**
     * 根据Id查询
     * @param positionId
     * @return
     */
    @SelectProvider(type = PositionSqlBuilder.class ,method = "getById")
    @Options(useCache=true,flushCache= Options.FlushCachePolicy.TRUE,timeout=10000)
    PositionDTO getById(@Param(value = "positionId") int positionId);

    @SelectProvider(type = PositionSqlBuilder.class ,method = "addPosition")
    @Options(useCache=true,flushCache= Options.FlushCachePolicy.TRUE,timeout=10000)
    void addPosition(@Param(value = "entity") Position position);

    @SelectProvider(type = PositionSqlBuilder.class ,method = "queryByPositionId")
    @Options(useCache=true,flushCache= Options.FlushCachePolicy.TRUE,timeout=10000)
    Position queryByPositionId(@Param(value = "positionId") int id);

    @SelectProvider(type = PositionSqlBuilder.class ,method = "updatePosition")
    @Options(useCache=true,flushCache= Options.FlushCachePolicy.TRUE,timeout=10000)
    void updatePosition(@Param(value = "entity") Position position);

    @SelectProvider(type = PositionSqlBuilder.class ,method = "deletePosition")
    @Options(useCache=true,flushCache= Options.FlushCachePolicy.TRUE,timeout=10000)
    void deletePosition(@Param(value = "positionId")int id);

    @SelectProvider(type = PositionSqlBuilder.class ,method = "getDetailById")
    @Options(useCache=true,flushCache= Options.FlushCachePolicy.TRUE,timeout=10000)
    Position getDetailById(@Param(value = "positionId") int id);
}
