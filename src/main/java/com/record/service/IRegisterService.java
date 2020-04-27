package com.record.service;

import com.record.model.User;
import org.springframework.stereotype.Repository;

@Repository
public interface IRegisterService {

	public int register(User user);
	//public int register(String userNo, String userName, String passWord, String nickName);
}
