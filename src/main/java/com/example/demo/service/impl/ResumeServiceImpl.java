package com.example.demo.service.impl;

import com.example.demo.entity.Resume;
import com.example.demo.mapper.ResumeMapper;
import com.example.demo.service.ResumeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ResumeServiceImpl implements ResumeService {

    @Autowired
    private ResumeMapper resumeMapper;

    @Override
    public int getPageCount(String condition) {
        return resumeMapper.getPageCount(condition);
    }

    @Override
    public List<Resume> getResumeList(int startRow, int pageSize, String condition) {
        return resumeMapper.getResumeList(startRow, pageSize, condition);
    }

    @Override
    public Resume queryByResumeId(int id) {
        return resumeMapper.queryByResumeId(id);
    }

    @Override
    public Resume queryByUserId(int userId) {
        return resumeMapper.queryByUserId(userId);
    }

    @Override
    public void addResume(Resume resume) {
        resumeMapper.addResume(resume);
    }

    @Override
    public void updateResume(Resume resume) {
        resumeMapper.updateResume(resume);
    }
}
