package com.ssg.martgowmsfullstack.controller;

import com.ssg.martgowmsfullstack.dto.CostInfoDTO;
import com.ssg.martgowmsfullstack.dto.RentHistoryDTO;
import com.ssg.martgowmsfullstack.dto.RentSelectDTO;
import com.ssg.martgowmsfullstack.dto.SectorDTO;
import com.ssg.martgowmsfullstack.service.RentService;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@Log4j2
@Transactional
@RequestMapping("/rent")
public class RentControllerImpl implements RentController {

    @Autowired
    public RentService rentService;

    @GetMapping("/warehouse")
    public String getAllWarehouse(Model model, HttpSession session) {
        if (session.getAttribute("loginInfo") == null) {
            return "redirect:/login";
        }
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
    public String showRentSummary(@ModelAttribute RentSelectDTO rentSelectDTO, Model model) {
        model.addAttribute("rentSelectDTO", rentSelectDTO);
        return "pages-last";
    }


    @PostMapping("/last")
    public String applyRent(@ModelAttribute RentHistoryDTO rentHistoryDTO, HttpSession session) {
        String userId = (String) session.getAttribute("sessionUserId");

        rentHistoryDTO.setUserId(userId);
        rentService.saveRentHistory(rentHistoryDTO);
        return "redirect:/user";
    }

    @GetMapping("/admin")
    public String holdRentList(String adminId, Model model) {
        List<RentHistoryDTO> rentHistoryDTO = rentService.holdRentList(adminId);
        model.addAttribute("rentHistoryDTO", rentHistoryDTO);

        rentService.holdRentList(adminId);
        return "pages-rent-approve";
    }


//     @PostMapping("/admin")
//     public String inProgressRentList(String adminId, int selectRentNum){
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
