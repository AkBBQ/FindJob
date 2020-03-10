package com.example.demo.mapper;

import com.example.demo.entity.Resume;
import com.example.demo.sqlbuider.ResumeSqlBuilder;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface ResumeMapper {

    @SelectProvider(type = ResumeSqlBuilder.class ,method = "getPageCount")
    @Options(flushCache = Options.FlushCachePolicy.FALSE, timeout = 10000)
    int getPageCount(@Param(value = "query") String query);

    @SelectProvider(type = ResumeSqlBuilder.class ,method = "getResumeList")
    @Options(flushCache = Options.FlushCachePolicy.FALSE, timeout = 10000)
    List<Resume> getResumeList(@Param(value = "startRow")int startRow, @Param(value = "pageSize")int pageSize, @Param(value = "query") String query);

    /**
     * 根据简历id查找简历
     * @param resumeId
     * @return
     */
    @Select("select * from resume where resumeId= #{resumeId}")
    Resume queryByResumeId(@Param(value = "resumeId") int resumeId);

    /**
     * 根据用户ID查找用户简历
     * @param userId
     * @return
     */
    @Select("select * from resume where userId = #{userId}")
    Resume queryByUserId(int userId);

    @SelectProvider(type = ResumeSqlBuilder.class ,method = "addResume")
    @Options(flushCache = Options.FlushCachePolicy.FALSE, timeout = 10000)
    void addResume(@Param(value = "entity") Resume resume);

    @SelectProvider(type = ResumeSqlBuilder.class ,method = "updateResume")
    @Options(flushCache = Options.FlushCachePolicy.FALSE, timeout = 10000)
    void updateResume(@Param(value = "entity") Resume resume);
}
