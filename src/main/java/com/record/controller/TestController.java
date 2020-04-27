package com.record.controller;

import com.record.model.Test;
import com.record.service.ITestService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/test")
public class TestController {

    @Resource
    private ITestService testService;

    @RequestMapping("/index_page")
    public String showIndex(HttpServletRequest request, Model model) {
        int id = Integer.parseInt(request.getParameter("id"));
        Test test = this.testService.getModelById(id);
        String name = "zhangsan";
        String name1 = name;
        //绑定对象到test/index.jsp
        model.addAttribute("test", test);
        return "home";
    }

    @RequestMapping("/index_api")
    @ResponseBody
    public Test Index(HttpServletRequest request,Model model) {
        int id = Integer.parseInt(request.getParameter("id"));
        return this.testService.getModelById(id);
    }

    @RequestMapping("index")
    public String delete(ModelMap map){
        String mes="你好！";
        int a=2;
        map.put("a",a);
        map.put("mes", mes);
        return "hello";
    }

}