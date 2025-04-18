package com.ssg.martgowmsfullstack.mapper;

import com.ssg.martgowmsfullstack.dto.MonthlyRentDTO;
import com.ssg.martgowmsfullstack.dto.SectorUsageDTO;
import com.ssg.martgowmsfullstack.dto.WareHouseUsageDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface DashBoardMapper {
    // 창고 용적률
    double getWarehouseUsageRate(@Param("admin_id") String admin_id);

    // 섹터 용적률
    List<SectorUsageDTO> getSectorUsageList(@Param("admin_id") String admin_id);

    // 총 회원수
    int getTotalUserCount();

    // 담당 회원수
    int getAdminUserCount(@Param("admin_id") String admin_id);

    // 월별 실적 저장
    List<MonthlyRentDTO> getMonthlyRentTotal();

    List<WareHouseUsageDTO> getAllWareHouseUsageList();
}
