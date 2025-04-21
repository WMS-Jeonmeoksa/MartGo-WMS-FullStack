package com.ssg.martgowmsfullstack.controller;


import com.ssg.martgowmsfullstack.dto.RentHistoryDTO;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;

public interface RentController {
    String getAllWarehouse(Model model);

    String getSector(@RequestParam("warehouseId") int warehouseId,
                        @RequestParam(value = "warehouseName") String warehouseName,
                        Model model);

    String getSectorCostInfo(  @RequestParam("warehouseId")   int    warehouseId,
                               @RequestParam("warehouseName") String warehouseName,
                               @RequestParam("sectorId")      String sectorId,
                               Model model);

    String applyRent(@ModelAttribute RentHistoryDTO rentHistoryDTO);
    String showRentSummary(
            @RequestParam("warehouseId") String warehouseId,
            @RequestParam("warehouseName") String warehouseName,
            @RequestParam("sectorId") String sectorId,
            @RequestParam("month") int month,
            @RequestParam("startDay") String startDay,
            @RequestParam("endDay") String endDay,
            @RequestParam("monthly") int monthly,
            @RequestParam("total") int total,
            Model model);
//     void inProgressRentList(String adminId);
//     void holdRentList(String adminId);
}
