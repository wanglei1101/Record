package com.record.service.impl;




import com.record.dao.UserDao;
import com.record.model.LoginPare;
import com.record.service.ILoginService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.sql.Connection;

@Service
public class LoginServiceImpl implements ILoginService {
	@Resource
	private UserDao userDao;
	
	public UserDao getUserDao() {
		return userDao;
	}

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	private static final int RESULT_NULL_USERNAME = 1,RESULT_WRONG_PASSWORD = 2;

	@Override
	public LoginPare login(String userName, String passWord) {
		
		Connection connection = null;
		LoginPare result = new LoginPare();
		
			//1、先判断是否有相应的用户名
			String id = userDao.getUserName(userName);
			if (id == null) {
				result.setCode(RESULT_NULL_USERNAME);
				return result;
			}
			
			//2、在判断密码是否正确
			String userId = userDao.getPassWord(id, passWord);
			if (userId == null) {
				result.setCode(RESULT_WRONG_PASSWORD);
				return result;
			}
			
			//3、设置相应的token
			long currentTime  = System.currentTimeMillis();
			String token = userId+"_"+currentTime;
			
			int updateResult = userDao.updateToken(userId, token);
			if (updateResult == 0) {
				result.setCode(100);
				
			} else {
				result.setCode(0);
				result.setToken(token);
			}
			
			return result;
	}
	
}
