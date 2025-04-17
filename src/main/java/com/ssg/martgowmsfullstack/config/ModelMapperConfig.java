package com.ssg.martgowmsfullstack.config;

import org.modelmapper.ModelMapper;
import org.modelmapper.convention.MatchingStrategies;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class ModelMapperConfig {

    // getMapper() 는 ModelMapper 반환하도록 설계
    // @Bean 해당 getMapper()의 실행 결과로 반환된 객체를 스프링의 빈(Bean)으로 등록시키는 역할

    @Bean
    public ModelMapper getMapper(){
        ModelMapper modelMapper = new ModelMapper();
        modelMapper.getConfiguration()
                .setFieldMatchingEnabled(true)
                .setFieldAccessLevel(org.modelmapper.config.Configuration.AccessLevel.PRIVATE)
                .setMatchingStrategy(MatchingStrategies.STRICT);
        return  modelMapper;
    }
}
