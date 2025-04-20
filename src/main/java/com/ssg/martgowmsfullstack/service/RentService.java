package com.ssg.martgowmsfullstack.service;


import com.ssg.martgowmsfullstack.dto.RentHistoryDTO;
import com.ssg.martgowmsfullstack.dto.SectorDTO;
import org.springframework.ui.Model;

import java.util.List;
import java.util.Map;

public interface RentService {
    List<Map<String, Object>> getAllWarehouses();

    String getSectorStatus(int warehouseId);

    List<SectorDTO> getAllSector(int warehouseId);

    List<Map<String, Object>> getAllCostInfo(int wareHouseId, String sectorId);

    void saveRentHistory(RentHistoryDTO rentHistory, int month, String startDay);

    String endDate(int month, String startDay);
}
