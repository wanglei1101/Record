package com.record.dao;

import com.record.model.User;

public interface UserDao {
    //根据用户名获得实体
    User getUserByName(String name);
    //根据用户名查询
    String getUserName(String userName);
    //根据User查询数据库中相应的id的password是否正确。如果正确，返回对应的id，否则返回0
    String getPassWord(String id, String password);
        //向指定的user更新token
    int updateToken(String userId, String token);
    //保存注册信息
    void save(User user);
}
