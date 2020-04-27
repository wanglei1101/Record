package com.record.service.impl;

import com.record.dao.UserDao;
import com.record.model.Test;
import com.record.model.User;
import com.record.service.IUserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class UserServiceImpl implements IUserService {
    @Resource
    private UserDao userDao;

    @Override
    public User getUserByName(String name) {
        return userDao.getUserByName(name);
    }
}