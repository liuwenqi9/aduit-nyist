package com.nyist.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.web.servlet.MultipartConfigFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import javax.servlet.MultipartConfigElement;

/**
 * Created by Administrator on 2018/5/28/028.
 */
@Configuration
public class FileUploadConfig {
    @Bean
    public MultipartConfigElement multipartConfigElement()
//            @Value("${multipart.maxFileSize}") String maxFileSize,
//            @Value("${multipart.maxRequestSize}") String maxRequestSize)
    {
        MultipartConfigFactory factory = new MultipartConfigFactory();
        // 单个文件最大
        factory.setMaxFileSize(1024L * 1024L);
        // 设置总上传数据总大小
        factory.setMaxRequestSize(1024L * 1024L);
        return factory.createMultipartConfig();
    }
}
