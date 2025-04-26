package com.ssg.martgowmsfullstack.mapper;

import com.ssg.martgowmsfullstack.domain.CostInfoVO;
import com.ssg.martgowmsfullstack.domain.RentHistoryVO;
import com.ssg.martgowmsfullstack.domain.SectorVO;
import com.ssg.martgowmsfullstack.dto.WarehouseDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface RentMapper {

    List<WarehouseDTO> getAllWarehouses();
    List<String> getSectorStatus(@Param("warehouseId") int warehouseId);
    List<SectorVO> getAllSectors(@Param("warehouseId") int warehouseId);
    List<CostInfoVO> getCostInfo(@Param("warehouseId") int warehouseId,
                                 @Param("sectorId") String sectorId);
    int getRentPrice(@Param("warehouseId") int warehouseId,
                     @Param("sectorId") String sectorId,
                     @Param("month") int month);
    void saveDb(RentHistoryVO rentHistory);
    List<RentHistoryVO> getHoldRentHistory(@Param("adminId") String adminId);
    void updateUserAdminId(@Param("rentNum") int rentNum, @Param("adminId") String adminId);
    void updateAdminId(@Param("rentNum") int rentNum,
                       @Param("adminId") String adminId);
    List<RentHistoryVO> getInProgressRentHistory(@Param("adminId") String adminId);
    void completedRentStatus(@Param("rentNum") int rentNum,
                             @Param("adminId") String adminId);
}
