package com.ssg.martgowmsfullstack.controller;


import com.ssg.martgowmsfullstack.dto.RentHistoryDTO;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;

public interface RentController {
    String applyRentWarehouse(HttpSession session, Model model);

    String applyRentSec(@RequestParam("warehouseId") int warehouseId,
                        @RequestParam(value = "warehouseName") String warehouseName,
                        Model model);

    String applyRentCostInfo(  @RequestParam("warehouseId")   int    warehouseId,
                               @RequestParam("warehouseName") String warehouseName,
                               @RequestParam("sectorId")      String sectorId,
                               Model model);

//    String applyRent(@ModelAttribute RentHistoryDTO rentHistory,
//                     @RequestParam("month") int month,
//                     @RequestParam("startDay") String startDay,
//                     @RequestParam("rentPrice") int rentPrice,
//                     @RequestParam("userId") String userId);
//     void inProgressRentList(String adminId);
//     void holdRentList(String adminId);
}
