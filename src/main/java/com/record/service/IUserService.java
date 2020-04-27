package com.record.service;

import com.record.model.User;
import org.springframework.stereotype.Repository;

@Repository
public interface IUserService {
    public User getUserByName(String name);
}
