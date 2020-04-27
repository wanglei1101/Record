package com.record.controller;

import com.alibaba.fastjson.JSON;
import com.record.model.LoginPare;
import com.record.model.User;
import com.record.service.ILoginService;
import com.record.service.IRegisterService;
import com.record.service.IUserService;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


import javax.annotation.Resource;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/user")
public class UserController {



    @Resource
    private IUserService userService;
    @Resource
    private ILoginService loginService;
    @Resource
    private IRegisterService registerService;



    //登录接口
    @RequestMapping(value ="/user_login",method= RequestMethod.POST)
    @ResponseBody
    public String login(@RequestBody Map<String, String> map) {
        String userName =  map.get("uname");
        String passWord = map.get("upwd");
        System.out.println("请求的userName为" + userName + "\n请求的passWord为" + passWord);

        User user = this.userService.getUserByName(userName);
        LoginPare loginPare = loginService.login(userName, passWord);
        Map<String, Object> dataMap01 = new HashMap<>();
        dataMap01.put("result", loginPare.getCode());
        // 如果成功，还需要加上token
        if (loginPare.getCode() == 0) {
            Map<String, Object> dataMap02 = new HashMap<>();
            dataMap02.put("token", loginPare.getToken());

            dataMap01.put("data", dataMap02);
        }

        String result = JSON.toJSONString(dataMap01);
        System.out.println("结果为" + result);
        return result;

    }

    //注册接口
    @RequestMapping(value="/user_register",method= RequestMethod.POST)
    @ResponseBody
    public String register(@RequestBody Map<String, String> map) {

        User user = new User();
        user.setName(map.get("uname"));
        user.setNo(map.get("uno"));
        user.setPassword(map.get("upwd"));
        user.setNickname(map.get("nkname"));
        System.out.println("请求的userName为" + user.getName() + "\n请求的passWord为" + user.getPassword() + "\nnickName为" + user.getNickname());
        int code = registerService.register(user);
        System.out.println("插入的code为" + code);
        map.put("result","0");
        if (0==code) {
            map.put("result", "0");
        }

        String result = JSON.toJSONString(map);
        System.out.println("结果为" + result);
        return result;

    }

}
