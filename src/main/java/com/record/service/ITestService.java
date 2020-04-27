package com.record.service;

import com.record.model.Test;
import org.springframework.stereotype.Repository;

@Repository
public interface ITestService {
    public Test getModelById(int id);
}