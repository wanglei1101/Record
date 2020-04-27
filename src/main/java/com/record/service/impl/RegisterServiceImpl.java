package com.record.service.impl;

import com.record.dao.UserDao;
import com.record.model.User;
import com.record.service.IRegisterService;

import com.record.util.ConnectionFactory;
import org.springframework.stereotype.Service;


import javax.annotation.Resource;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.UUID;

/**
 * 负责注册插入数据库操作的逻辑类，包括错误判断，出错时数据库回滚等操作
 * 
 * create by wanglei on 20181220
 *
 */
@Service
public class RegisterServiceImpl implements IRegisterService {

	@Resource
	private UserDao userDao;

	public UserDao getUserDao() {
		return userDao;
	}

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	@Override
	public int register(User user) {
		Connection connection =  ConnectionFactory.getInstance().makeConnection();
		try {
			//使用事务，先禁止其自动提交
			connection.setAutoCommit(false);
			String id = UUID.randomUUID().toString().replaceAll("-","");//使用UUID产生唯一标示
			user.setId(id);
			userDao.save(user);
			connection.commit();
			return 0;
		} catch (SQLException e) {
			System.out.println("插入失败" + "\n错误码为" + e.getErrorCode() + "\n错误信息为" + e.getMessage());

			//插入失败，需要回滚
			try {
				connection.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}

			// mysql重复插入的错误码为1062，如果是重复插入，Message会为Duplicate entry 'xxx' for key
			// 'name'
			// 即最后一个为列名，我们可以根据此来得到重复插入的列的名称1062
			if (e.getErrorCode() == 1062) {
				String errorMessage = e.getMessage();
				// 说明用户名重复了，根据接口，应该返回1
				if (errorMessage.endsWith("'name'")) {
					return 1;
				}
				// 其它应该就是nickname重复了，根据接口，应该返回2
				else {
					return 2;
				}

			} else {
				return 100;
			}
		}
	}
}
