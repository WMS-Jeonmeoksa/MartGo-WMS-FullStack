package com.ssg.martgowmsfullstack.controller;


import com.ssg.martgowmsfullstack.dto.RentHistoryDTO;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;

public interface RentController {
     String applyRentWarehouse(Model model);
     String applyRentSec(int wareHouse);
     String applyRentCostInfo(int wareHouse, String sectorName);
     String applyRent(  @ModelAttribute RentHistoryDTO rentHistory,
                        @RequestParam("month") int month,
                        @RequestParam("startDay") String startDay,
                        @RequestParam("rentPrice") int rentPrice,
                        @RequestParam("userId") String userId );
//     void holdRentList(String adminId);
//     void inProgressRentList(String adminId);
//     List<RentHistoryDTO> showMonthlyPerformance(String adminId);

}
