package com.example.demo.config;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * All rights Reserved, Designed By www.maihaoche.com
 *
 * @Package com.example.demo.config
 * @author: angtai（angtai@maihaoche.com）
 * @date: 2020/3/11 2:58 PM
 * @Copyright: 2017-2020 www.maihaoche.com Inc. All rights reserved.
 */

@Component
public class LoginInteceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        System.out.println(request.getRequestURI());
        return true;
    }
}