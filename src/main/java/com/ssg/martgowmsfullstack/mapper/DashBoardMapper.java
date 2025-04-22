package com.ssg.martgowmsfullstack.mapper;

import com.ssg.martgowmsfullstack.domain.*;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface DashBoardMapper {
    // 창고 용적률
    double getWarehouseUsageRate(@Param("admin_id") String admin_id);

    // 섹터 용적률
    List<SectorUsageVO> getSectorUsageList(@Param("admin_id") String admin_id);

    // 총 회원수
    int getTotalUserCount();

    // 담당 회원수
    int getAdminUserCount(@Param("admin_id") String admin_id);

    // 월별 실적 저장
    List<MonthlyRentVO> getMonthlyRentTotal();

    List<WareHouseUsageVO> getAllWareHouseUsageList();

    List<UserAdminVO> getUserAdminList(@Param("user_id")String user_id);
    int getRemainingDays(@Param("user_id")String user_id);
    List<RentSectorWarehouseVO> getRentSectorWarehouseList(@Param("user_id")String user_id);
    List<SectorUsageVO> getUserSectorUsage(@Param("user_id") String user_id);
}
