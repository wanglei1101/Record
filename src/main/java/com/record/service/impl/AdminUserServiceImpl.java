package com.record.service.impl;

import com.record.dao.AdminUserDao;
import com.record.dao.UserDao;
import com.record.model.AdminUser;
import com.record.model.User;
import com.record.service.IAdminUserService;
import com.record.service.IUserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.UUID;

@Service
public class AdminUserServiceImpl implements IAdminUserService {
    @Resource
    private AdminUserDao adminUserDao;


    @Override
    public int getUNameAndPsw(String name,String passWord) {
        AdminUser adminUser = adminUserDao.getUNameAndPsw(name);
        if(adminUser !=null){
            if(adminUser.getPassword().equals(passWord)){
                //传入密码与数据库取出的密码进行比对
                System.out.print("密码正确");
                return 1;//密码正确返回1
            }else {
                return 0;//密码错误确返回1
            }
        }else {
            return -1;//没查到
        }
    }

    @Override
    public AdminUser getModel(String name) {
        return adminUserDao.getModel(name);
    }

    //用于保存注册的信息
    @Override
    public void saveAdminUser(AdminUser adminUser) {
       //保存之前，验证此人员有没有注册过
        //先根据no去数据库查询，查询成功则说明注册过，没查到则是新用户
         AdminUser adminUser1 = adminUserDao.getAdminByNO(adminUser.getNo());
         if(null == adminUser1){
             //没查到
             //使用uuid产生id作为唯一标示
             String id = UUID.randomUUID().toString().replaceAll("-","");//使用UUID产生唯一标示
             adminUser.setId(id);
             adminUserDao.saveAdminUser(adminUser);
         }else{
             //查到了
             System.out.print("已经注册了该用户");
         }

    }
}