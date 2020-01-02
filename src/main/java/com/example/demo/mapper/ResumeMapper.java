package com.example.demo.mapper;

import com.example.demo.entity.Resume;
import com.example.demo.sqlbuider.ResumeSqlBuilder;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.SelectProvider;

import java.util.List;

@Mapper
public interface ResumeMapper {

    @SelectProvider(type = ResumeSqlBuilder.class ,method = "getPageCount")
    @Options(flushCache = Options.FlushCachePolicy.FALSE, timeout = 10000)
    int getPageCount(@Param(value = "query") String query);

    @SelectProvider(type = ResumeSqlBuilder.class ,method = "getResumeList")
    @Options(flushCache = Options.FlushCachePolicy.FALSE, timeout = 10000)
    List<Resume> getResumeList(@Param(value = "startRow")int startRow, @Param(value = "pageSize")int pageSize, @Param(value = "query") String query);

    @SelectProvider(type = ResumeSqlBuilder.class ,method = "queryByResumeId")
    @Options(flushCache = Options.FlushCachePolicy.FALSE, timeout = 10000)
    Resume queryByResumeId(@Param(value = "resumeId") int id);

    @SelectProvider(type = ResumeSqlBuilder.class ,method = "queryByUserId")
    @Options(flushCache = Options.FlushCachePolicy.FALSE, timeout = 10000)
    Resume queryByUserId(@Param(value = "userId") int userId);

    @SelectProvider(type = ResumeSqlBuilder.class ,method = "addResume")
    @Options(flushCache = Options.FlushCachePolicy.FALSE, timeout = 10000)
    void addResume(@Param(value = "entity") Resume resume);

    @SelectProvider(type = ResumeSqlBuilder.class ,method = "updateResume")
    @Options(flushCache = Options.FlushCachePolicy.FALSE, timeout = 10000)
    void updateResume(@Param(value = "entity") Resume resume);
}
