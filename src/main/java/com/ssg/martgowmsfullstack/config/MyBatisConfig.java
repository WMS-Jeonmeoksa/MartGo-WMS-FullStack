package com.ssg.martgowmsfullstack.config;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Configuration;

@Configuration
@MapperScan(basePackages = "com.ssg.martgowmsfullstack.mapper")
public class MyBatisConfig {
}
