package com.example.demo.service;

import com.example.demo.entity.Resume;

import java.util.List;

public interface ResumeService {
    
    int getPageCount(String condition);

    List<Resume> getResumeList(int startRow, int pageSize, String condition);

    Resume queryByResumeId(int id);

    Resume queryByUserId(int userId);

    void addResume(Resume resume);

    void updateResume(Resume resume);
}
