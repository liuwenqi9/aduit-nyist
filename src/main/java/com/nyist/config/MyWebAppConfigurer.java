package com.nyist.config;

import com.nyist.interceptor.InterceptorConfig;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

/**
 * Created by Administrator on 2018/5/26/026.
 */
@Configuration
public class MyWebAppConfigurer extends WebMvcConfigurerAdapter {
    public void addInterceptors(InterceptorRegistry registry) {
        InterceptorRegistration ir=registry.addInterceptor(new InterceptorConfig());
        ir.addPathPatterns("/**");
        ir.excludePathPatterns("/user/tologin");
        ir.excludePathPatterns("/user/login");
        ir.excludePathPatterns("/user/index");
    }
}
