package com.ssg.martgowmsfullstack.service;


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

    public List<Map<String, Object>> getAllCostInfo(int wareHouseId, String sectorId) {
        return rentMapper.getCostInfo(wareHouseId,sectorId);
    }


    public void saveRentHistory(RentHistoryDTO rentHistory, int month, String startDay) {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDate startDate = LocalDate.parse(startDay, formatter);
        LocalDate endDate = startDate.plusMonths(month);

        rentHistory.setSectorId(rentHistory.getSectorId());
        rentHistory.setWarehouseId(rentHistory.getWarehouseId());
        rentHistory.setRentStartDate(Date.valueOf(startDate));
        rentHistory.setRentEndDate(Date.valueOf(endDate));
        rentHistory.setRentPrice(rentHistory.getRentPrice());

        rentMapper.saveDb(rentHistory);
    }

    public String endDate(int month, String startDay) {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDate startDate = LocalDate.parse(startDay, formatter);
        LocalDate endDate = startDate.plusMonths(month);
        return endDate.format(formatter);
    }

}
