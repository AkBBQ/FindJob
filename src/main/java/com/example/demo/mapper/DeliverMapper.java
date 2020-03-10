package com.example.demo.mapper;

import com.example.demo.entity.Deliver;
import com.example.demo.entity.dto.DeliverDTO;
import com.example.demo.sqlbuider.DeliverSqlBuilder;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface DeliverMapper {

    /**
     * 投递简历
     * @param deliver
     */
    @Insert("INSERT into deliver(userId,positionId,companyId,resumeId) values(#{userId},#{positionId},#{companyId},#{resumeId})")
    void addDeliver(Deliver deliver);

    /**
     * 查询用户的投递详情
     * @param positionId
     * @param userId
     * @return
     */
    @Select("select * from deliver where positionId=#{positionId} and userId =#{userId}")
    List<Deliver> selectByPositionId(@Param(value = "positionId") int positionId, @Param(value = "userId") int userId);

    @SelectProvider(type = DeliverSqlBuilder.class ,method = "getPageCount")
    @Options(flushCache = Options.FlushCachePolicy.FALSE, timeout = 10000)
    int getPageCount(@Param(value = "condition") String condition);

    @SelectProvider(type = DeliverSqlBuilder.class ,method = "getDeliverList")
    @Options(flushCache = Options.FlushCachePolicy.FALSE, timeout = 10000)
    List<DeliverDTO> getDeliverList(@Param(value = "startRow")int startRow, @Param(value = "pageSize")int pageSize, @Param(value = "condition")String condition);


    /**
     * 根据投递id查询相关信息
     * @param deliverId
     * @return
     */
    @Select("select *  from deliver,user,resume where user.userId = deliver.userId and deliver.resumeId = resume.resumeId and deliverId=#{deliverId}")
    DeliverDTO getById(@Param(value = "deliverId") int deliverId);

    @SelectProvider(type = DeliverSqlBuilder.class ,method = "updateDeliver")
    @Options(flushCache = Options.FlushCachePolicy.FALSE, timeout = 10000)
    void updateDeliver(@Param(value = "deliverId")int deliverId, @Param(value = "state")int state);
}
