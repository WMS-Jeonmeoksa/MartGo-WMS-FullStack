package com.ssg.martgowmsfullstack.controller;

import com.ssg.martgowmsfullstack.dto.CostInfoDTO;
import com.ssg.martgowmsfullstack.dto.RentHistoryDTO;
import com.ssg.martgowmsfullstack.dto.SectorDTO;
import com.ssg.martgowmsfullstack.service.RentService;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@Log4j2
@Transactional
@RequestMapping("/rent")
public class RentControllerImpl implements RentController {

    @Autowired
    public RentService rentService;

    @GetMapping("/warehouse")
    public String getAllWarehouse(Model model) {
        model.addAttribute("warehouses", rentService.getAllWarehouses());
        return "pages-warehouse";
    }

    @GetMapping("/sector")
    public String getSector(
            @RequestParam("warehouseId") int warehouseId,
            @RequestParam("warehouseName") String warehouseName,
            Model model
    ) {
        List<SectorDTO> sectorList = rentService.getAllSector(warehouseId);

        model.addAttribute("sectors", sectorList);
        model.addAttribute("warehouseId", warehouseId);
        model.addAttribute("warehouseName", warehouseName);

        return "pages-sector";
    }

    @GetMapping("/period")
    public String getSectorCostInfo(
            @RequestParam("warehouseId") int warehouseId,
            @RequestParam("warehouseName") String warehouseName,
            @RequestParam("sectorId") String sectorId,
            Model model
    ) {
        List<CostInfoDTO> costInfo =
                rentService.getAllCostInfo(warehouseId, sectorId);

        model.addAttribute("costInfo", costInfo);
        model.addAttribute("warehouseId", warehouseId);
        model.addAttribute("warehouseName", warehouseName);
        model.addAttribute("sectorId", sectorId);
        return "pages-period";
    }

    @GetMapping("/last")
    public String showRentSummary(
            @RequestParam("warehouseId") String warehouseId,
            @RequestParam("warehouseName") String warehouseName,
            @RequestParam("sectorId") String sectorId,
            @RequestParam("month") int month,
            @RequestParam("startDay") String startDay,
            @RequestParam("endDay") String endDay,
            @RequestParam("monthly") int monthly,
            @RequestParam("total") int total,
            Model model) {

        model.addAttribute("warehouseId", warehouseId);
        model.addAttribute("warehouseName", warehouseName);
        model.addAttribute("sectorId", sectorId);
        model.addAttribute("month", month);
        model.addAttribute("startDay", startDay);
        model.addAttribute("endDay", endDay);
        model.addAttribute("monthly", monthly);
        model.addAttribute("total", total);

        return "pages-last";
    }


    @PostMapping("/last")
    public String applyRent(RentHistoryDTO rentHistoryDTO) {
        rentHistoryDTO.setUserId("user01"); // 유저 id가져와야됨 (수정 예정)
        rentService.saveRentHistory(rentHistoryDTO);
        return "pages-dashboard-general";
    }

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
