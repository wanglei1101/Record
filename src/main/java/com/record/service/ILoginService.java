package com.record.service;

import com.record.model.LoginPare;
import org.springframework.stereotype.Repository;

@Repository
public interface ILoginService {

    public LoginPare login(String userName, String passWord);
}
