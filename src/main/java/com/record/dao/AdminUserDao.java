package com.record.dao;

import com.record.model.AdminUser;


public interface AdminUserDao {
    //用于验证用户名和密码是否匹配
    AdminUser getUNameAndPsw(String userName);
    //根据id获取Adminuser
    AdminUser getAdminByNO(String no);
    AdminUser getModel(String name);
    //保存Adminuser到数据库
    void saveAdminUser(AdminUser adminUser);
    //修改AdminUser
    void updateAdminUser(AdminUser adminUser);

}
