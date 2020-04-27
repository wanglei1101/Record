package com.record.controller;

import com.alibaba.fastjson.JSONObject;

import com.record.model.AdminUser;
import com.record.service.IAdminUserService;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import javax.annotation.Resource;

import javax.servlet.http.HttpSession;


/**
 * 登录页面及登录功能和注册的实现   解耦  耦合
 * create by wanglei on 20190316
 */
@Controller
@RequestMapping("/login")
public class LoginController {

    @Resource
    private IAdminUserService adminUserService;

    //用户进入到登录页面
    @RequestMapping("/login")
    public String login(){

        return "login";
    }


    //用户验证用户名及密码是否正确
    @RequestMapping(value = "/login_admin",method = RequestMethod.POST)
    @ResponseBody
    public String loginAdmin(@RequestParam String adminUser, HttpSession httpSession){
        //获取表单提交的信息
        JSONObject adminObject = JSONObject.parseObject(adminUser);
        String loginName = adminObject.getString("loginName");
        String passwd = adminObject.getString("password");
        System.out.println(loginName);
        System.out.print(passwd);
        //用户验证
        int result = adminUserService.getUNameAndPsw(loginName,passwd);
        if(1 ==result){
            //验证成功把用户名密码放入session
            httpSession.setAttribute("loginName",loginName);
            httpSession.setAttribute("passwd",passwd);
            return "success";
        }else if(0 == result){
            return "fail";//验证失败
        }else {
            return "";//没查到用户提示注册
        }

    }

    //用户进入到登录页面
    @RequestMapping("/login_index")
    public String gotoIndex(HttpSession httpSession,Model model){
        //从域中把登录用户名和密码取出来
        String name = (String) httpSession.getAttribute("loginName");
        AdminUser adminUser = adminUserService.getModel(name);
        model.addAttribute("adminUser",adminUser);
        return "home";
    }
    //
    //用户进入到注册页面
    @RequestMapping("/login_register")
    public String gotoRegister(){

        return "registerbody";
    }
    //请求该地址，将注册信息保存到数据库
    @RequestMapping("/login_saveAdmin")
    @ResponseBody
    public String saveAdmin(@RequestParam String adminUser){
        //获取表单提交的信息  将json对象转换成java对象
        AdminUser adminUser1 = JSONObject.parseObject(adminUser,AdminUser.class);

        adminUserService.saveAdminUser(adminUser1);
        return "success";
    }

    //测试git
    public void testGit(){

    }
}
