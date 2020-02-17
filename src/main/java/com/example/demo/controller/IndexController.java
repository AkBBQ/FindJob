package com.example.demo.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 启动重定向到网站首页地址
 * @author xxx
 */
@Controller
public class IndexController {

    /**
     * 启动重定向到网站首页地址
     * @return
     */
    @RequestMapping("/")
    public String index() {
        return "redirect:/user/index";
    }

}
