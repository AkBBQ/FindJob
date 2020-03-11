package com.example.demo.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurationSupport;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

/**
 * All rights Reserved, Designed By www.maihaoche.com
 *
 * @Package com.example.demo.config
 * @author: angtai（angtai@maihaoche.com）
 * @date: 2020/3/11 2:58 PM
 * @Copyright: 2017-2020 www.maihaoche.com Inc. All rights reserved.
 */

@Configuration
public class InteceptorConfig extends WebMvcConfigurationSupport {

    @Autowired
    private LoginInteceptor loginInteceptor;

    /**
     *  视图前缀
     */
    private static final String VIEW_PREFIX = "/WEB-INF/jsp/";
    /**
     * 视图后缀
     */
    private static final String VIEW_SUFFIX = ".jsp";

    /**
     * 视图的内容类型
     */
    private static final String VIEW_CONTENT_TYPE = "text/html;charset=UTF-8";

    @Override
    protected void addInterceptors(InterceptorRegistry registry) {
        // 多个拦截器组成一个拦截器链
        // addPathPatterns 用于添加拦截规则，/**表示拦截所有请求
        // excludePathPatterns 用户排除拦截
        String[] paths = {"/**/*.js", "/**/*.css", "/**/*.png", "/**/*.gif", "/**/*.jpg", "/**/*.jpeg",
                "/webapp/**"};

        registry.addInterceptor(loginInteceptor).addPathPatterns("/**")
                .excludePathPatterns(paths);
        super.addInterceptors(registry);
    }

    @Override
    protected void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/*/assets").addResourceLocations("webapp/assets/")
                .addResourceLocations("classpath:/backStyle/")
                .addResourceLocations("classpath:/calendar/")
                .addResourceLocations("classpath:/css/")
                .addResourceLocations("classpath:/images/")
                .addResourceLocations("classpath:/js/")
                .addResourceLocations("classpath:/css/style");
        super.addResourceHandlers(registry);

    }

    /**
     * 使用Springboot2.0通过重载WebMvcConfigurationSupport
     * 和使用注解@Configuration的方法添加自定义拦截器后会出现一个bug，
     * 就是我们在application.properties配置的视图解析失效
     *
     * 配置 视图解析器
     * @return
     */
    @Bean
    public ViewResolver viewResolver() {

        InternalResourceViewResolver resolver = new InternalResourceViewResolver();
        resolver.setCache(true);
        resolver.setPrefix(VIEW_PREFIX);
        resolver.setSuffix(VIEW_SUFFIX);
        resolver.setExposeContextBeansAsAttributes(true);
        resolver.setContentType(VIEW_CONTENT_TYPE);
        return resolver;
    }

}