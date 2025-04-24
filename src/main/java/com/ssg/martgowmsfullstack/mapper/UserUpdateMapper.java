package com.ssg.martgowmsfullstack.mapper;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserUpdateMapper {
    void updateExpiredUsers();
    void resetSectorStatus();
}
