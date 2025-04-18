package com.ssg.martgowmsfullstack.service;


import com.ssg.martgowmsfullstack.dto.RentHistoryDTO;
import org.springframework.ui.Model;

import java.util.List;
import java.util.Map;

public interface RentService {
    List<Map<String, Object>> getAllWarehouses();
    List<Map<String, Object>> getAllSector(int warehouseId);
    List<Map<String, Object>> getAllCostInfo(int wareHouseId, String sectorId);
    void saveRentHistory(RentHistoryDTO rentHistory, int month, String startDay);
    String endDate(int month, String startDay);
}
