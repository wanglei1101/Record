package com.record.service.impl;

import com.record.dao.TestDao;
import com.record.model.Test;
import com.record.service.ITestService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class TestServiceImpl implements ITestService {
    @Resource
    private TestDao testDao;

    @Override
    public Test getModelById(int id) {
        return testDao.getModelById(id);
    }
}