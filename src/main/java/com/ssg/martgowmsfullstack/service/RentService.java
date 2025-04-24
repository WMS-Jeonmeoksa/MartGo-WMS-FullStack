package com.ssg.martgowmsfullstack.service;


import com.ssg.martgowmsfullstack.dto.CostInfoDTO;
import com.ssg.martgowmsfullstack.dto.RentHistoryDTO;
import com.ssg.martgowmsfullstack.dto.SectorDTO;
import com.ssg.martgowmsfullstack.dto.WarehouseDTO;
import org.springframework.ui.Model;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

public interface RentService {
    List<WarehouseDTO> getAllWarehouses();

    String getSectorStatus(int warehouseId);

    List<SectorDTO> getAllSector(int warehouseId);

    List<CostInfoDTO> getAllCostInfo(int wareHouseId, String sectorId);

    void saveRentHistory(RentHistoryDTO rentHistoryDTO);

    List<RentHistoryDTO> holdRentList(String adminId);
    List<RentHistoryDTO> inProgressRentList(String adminId);
    void approveRentHistory(int rentNum, String adminId);
    void confirmRentHistory(int rentNum, String adminId);
}
