package com.ssg.martgowmsfullstack.service;


import com.ssg.martgowmsfullstack.dto.CostInfoDTO;
import com.ssg.martgowmsfullstack.dto.RentHistoryDTO;
import com.ssg.martgowmsfullstack.dto.SectorDTO;
import com.ssg.martgowmsfullstack.mapper.RentMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import java.sql.Date;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@Log4j2
@RequiredArgsConstructor
@Transactional
public class RentServiceImpl implements RentService {

    @Autowired
    RentMapper rentMapper;


    public List<Map<String, Object>> getAllWarehouses() {
        List<Map<String, Object>> warehouses = rentMapper.getAllWarehouses();
        for (Map<String, Object> wh : warehouses) {
            Integer warehouseId = (Integer) wh.get("warehouse_id");
            String status = getSectorStatus(warehouseId);
            wh.put("status", status);
        }
        return warehouses;
    }
    public String getSectorStatus(int warehouseId) {
        List<String> sectorStatuses = rentMapper.getSectorStatus(warehouseId);
        boolean anyAvailable = sectorStatuses.stream()
                .anyMatch("사용가능"::equals);
        return anyAvailable ? "사용가능" : "사용불가";
    }

    public List<SectorDTO> getAllSector(int warehouseId) {
        return rentMapper.getAllSectors(warehouseId);
    }

    public List<CostInfoDTO> getAllCostInfo(int wareHouseId, String sectorId) {
        return rentMapper.getCostInfo(wareHouseId,sectorId);
    }


    public void saveRentHistory(RentHistoryDTO rentHistoryDTO) {
        rentMapper.saveDb(rentHistoryDTO);
    }

    public List<RentHistoryDTO> holdRentList(String adminId) {
       return rentMapper.getHoldRentHistory(adminId);
    }

    public List<RentHistoryDTO> inProgressRentList(String adminId) {
        return rentMapper.getInProgressRentHistory(adminId);
    }

   public void approveRentHistory(int rentNum, String adminId){
        rentMapper.updateAdminId(rentNum,adminId);
        rentMapper.updateUserAdminId();

   }

    public void confirmRentHistory(int rentNum, String adminId){
        rentMapper.completedRentStatus(rentNum,adminId);
    }

}
