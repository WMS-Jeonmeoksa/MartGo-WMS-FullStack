package com.ssg.martgowmsfullstack.mapper;

import com.ssg.martgowmsfullstack.dto.RentHistoryDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

@Mapper
public interface RentMapper {

    List<Map<String, Object>> getAllWarehouses();
    List<Map<String, Object>> getAllSectors(@Param("warehouseId") int warehouseId);
    List<RentHistoryDTO> getCostInfo(@Param("warehouseId") int warehouseId,
                                     @Param("sectorId") String sectorId);
    int getRentPrice(@Param("warehouseId") int warehouseId,
                     @Param("sectorId") String sectorId,
                     @Param("month") int month);
    void saveDb(RentHistoryDTO rentHistory);
    List<RentHistoryDTO> getHoldRentHistory();
    void updateUserAdminId();
    void updateAdminId(@Param("rentNum") int rentNum,
                       @Param("adminId") String adminId);
    List<RentHistoryDTO> getInProgressRentHistory(@Param("adminId") String adminId);
    void completedRentStatus(@Param("rentNum") int rentNum,
                             @Param("adminId") String adminId);
    List<RentHistoryDTO> getMonthlyPerformance(@Param("adminId") String adminId);
}
