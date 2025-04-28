package com.ssg.martgowmsfullstack.mapper;

import com.ssg.martgowmsfullstack.domain.AdminVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface AdminMapper {
    AdminVO findByAdminId(String adminId);
    void updateAdminPassword(@Param("adminId") String adminId,
                             @Param("newPw") String newPw,
                             @Param("salt") String salt);
}
