package com.example.demo;

import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.context.annotation.Bean;
import org.springframework.web.multipart.MultipartResolver;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

public class ServletInitializer extends SpringBootServletInitializer {

    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
        return application.sources(DemoApplication.class);
    }
    @Bean(name = "multipartResolver")
    public MultipartResolver multipartResolver() {

        //return  new StandardServletMultipartResolver();
        CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver();
        multipartResolver.setResolveLazily(false);
        multipartResolver.setMaxUploadSizePerFile(10485760); //10MB
        multipartResolver.setDefaultEncoding("UTF-8");

        return multipartResolver;
    }
}

