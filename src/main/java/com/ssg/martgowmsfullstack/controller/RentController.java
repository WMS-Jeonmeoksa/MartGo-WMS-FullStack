package com.ssg.martgowmsfullstack.controller;


import com.ssg.martgowmsfullstack.dto.RentHistoryDTO;
import com.ssg.martgowmsfullstack.dto.RentSelectDTO;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;

public interface RentController {
    String getAllWarehouse(Model model, HttpSession session);

    String getSector(@RequestParam("warehouseId") int warehouseId,
                     @RequestParam(value = "warehouseName") String warehouseName,
                     Model model);

    String getSectorCostInfo(@RequestParam("warehouseId") int warehouseId,
                             @RequestParam("warehouseName") String warehouseName,
                             @RequestParam("sectorId") String sectorId,
                             Model model);

    String applyRent(@ModelAttribute RentHistoryDTO rentHistoryDTO, HttpSession session);

    String showRentSummary(@ModelAttribute RentSelectDTO rentSelectDTO, Model model);

    String holdRentList(String adminId, Model model);

//    void inProgressRentList(String adminId);
}
