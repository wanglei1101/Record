package com.record.util;

import com.record.model.AdminUser;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * 自定义拦截器，用于判断用户发送请求时是否处于登录状态
 * 未登录，登录才能进入页面
 */
public class LoginIntercept extends HandlerInterceptorAdapter {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        System.out.println("我是拦截器：我证明我进来了");
        HttpSession session=request.getSession();
        String loginName = (String) session.getAttribute("loginName");
        String passwd = (String) session.getAttribute("passwd");
        if((null == loginName) && (null == passwd))
        {
            System.out.println("用户没有登录");
            response.sendRedirect(request.getContextPath()+"/login/login");
            return false;
        }
        System.out.println("用户已经登录");
        return  true;
    }
}
