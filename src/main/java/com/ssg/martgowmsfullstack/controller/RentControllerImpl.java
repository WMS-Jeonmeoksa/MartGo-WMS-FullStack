package com.ssg.martgowmsfullstack.controller;

import com.ssg.martgowmsfullstack.dto.RentHistoryDTO;
import com.ssg.martgowmsfullstack.dto.SectorDTO;
import com.ssg.martgowmsfullstack.dto.WarehouseDTO;
import com.ssg.martgowmsfullstack.service.RentService;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Collections;
import java.util.List;
import java.util.Map;

@Controller
@Log4j2
@Transactional
@RequestMapping("/rent")
public class RentControllerImpl implements RentController {

    @Autowired
    public RentService rentService;

    @GetMapping("/warehouse")
    public String applyRentWarehouse(Model model) {
        model.addAttribute("warehouses", rentService.getAllWarehouses());
        return "pages-warehouse";
    }

    @GetMapping("/sector")
    public String applyRentSec(
            @RequestParam("warehouseId") int warehouseId,
            @RequestParam("warehouseName") String warehouseName,
            Model model
    ) {
        List<SectorDTO> sectorList = rentService.getAllSector(warehouseId);
        for (SectorDTO sec : sectorList) {
            System.out.println("섹터 ID: " + sec.getSectorId());
        }

        System.out.println("warehouseId = " + warehouseId);
        System.out.println("sectorList.size = " + sectorList.size());

        model.addAttribute("sectors", sectorList);
        model.addAttribute("warehouseId", warehouseId);
        model.addAttribute("warehouseName", warehouseName);

        return "pages-sector";
    }

    @GetMapping("/period")
    public String applyRentCostInfo(
            @RequestParam("warehouseId")   int    warehouseId,
            @RequestParam("warehouseName") String warehouseName,
            @RequestParam("sectorId")      String sectorId,
            Model model
    ) {
        List<Map<String,Object>> costInfo =
                rentService.getAllCostInfo(warehouseId, sectorId);

        model.addAttribute("costInfo",      costInfo);
        model.addAttribute("warehouseId",   warehouseId);
        model.addAttribute("warehouseName", warehouseName);
        model.addAttribute("sectorId",      sectorId);
        return "pages-period";
    }


//    @PostMapping("/last")
//    public String applyRent(
//            @ModelAttribute RentHistoryDTO rentHistory,
//            @RequestParam("month") int month,
//            @RequestParam("startDay") String startDay,
//            @RequestParam("rentPrice") int rentPrice,
//            @RequestParam("userId") String userId
//    ) {
//        rentHistory.setRentPrice(rentPrice);
//        rentHistory.setUserId(userId);
//
//        String endDate = rentService.endDate(month, startDay);
//
//        int confirm = 1; // 예시: 나중에 실제 확인 여부 값으로 대체
//
//        if (confirm == 1) {
//            rentService.saveRentHistory(rentHistory, month, startDay);
//        } else {
//            System.out.println("임대 신청이 취소되었습니다.");
//        }
//
//        return "redirect:/rent/last";
//    }

//
//    public void holdRentList(String adminId) {
//        rentMapper.getHoldRentHistory();
//        int selectRentNum = sc.nextInt();
//
//        rentMapper.updateAdminId(selectRentNum, adminId);
//        rentMapper.updateUserAdminId();
//    }
//
//    public void inProgressRentList(String adminId) {
//        rentMapper.getInProgressRentHistory(adminId);
//        int selectRentNum = sc.nextInt();
//
//        rentMapper.completedRentStatus(selectRentNum, adminId);
//    }
}
