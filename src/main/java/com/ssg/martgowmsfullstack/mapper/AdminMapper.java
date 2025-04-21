package com.ssg.martgowmsfullstack.mapper;

import com.ssg.martgowmsfullstack.domain.AdminVO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AdminMapper {
    AdminVO findByAdminId(String adminId);
}
