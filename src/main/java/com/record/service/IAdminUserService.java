package com.record.service;

import com.record.model.AdminUser;
import org.springframework.stereotype.Repository;

@Repository
public interface IAdminUserService {
    public int getUNameAndPsw(String name,String passWord);
    public AdminUser getModel(String name);
    public void saveAdminUser(AdminUser adminUser);
}
