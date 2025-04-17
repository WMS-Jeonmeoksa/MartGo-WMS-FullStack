package com.ssg.martgowmsfullstack.mapper;

import com.ssg.martgowmsfullstack.dto.MonthlyRentDTO;
import com.ssg.martgowmsfullstack.dto.SectorUsageDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface DashBoardMapper {
    // 창고 용적률
    double getWarehouseUsageRate(@Param("admin_id") String adminId);
    // 섹터 용적률
    List<SectorUsageDTO> getSectorUsageList(@Param("admin_id") String adminId);
    // 총 회원수
    int getTotalUserCount(@Param("admin_id") String adminId);
    // 담당 회원수
    int getAdminUserCount(@Param("admin_id") String adminId);
}
