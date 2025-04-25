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
public class RentController {

    @Autowired
    public RentService rentService;

    @GetMapping("/warehouse")
    public String getAllWarehouse(Model model, HttpSession session) {
        if (session.getAttribute("loginInfo") == null) {
            return "redirect:/login";
        }
        model.addAttribute("warehouses", rentService.getAllWarehouses());
        return "pages-rent-warehouse";
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

        return "pages-rent-sector";
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
        return "pages-rent-period";
    }

    @GetMapping("/last")
    public String showRentSummary(@ModelAttribute RentSelectDTO rentSelectDTO, Model model) {
        model.addAttribute("rentSelectDTO", rentSelectDTO);
        return "pages-rent-last";
    }


    @PostMapping("/last")
    public String applyRent(@ModelAttribute RentHistoryDTO rentHistoryDTO, HttpSession session) {
        String userId = (String) session.getAttribute("sessionUserId");

        rentHistoryDTO.setUserId(userId);
        rentService.saveRentHistory(rentHistoryDTO);
        return "redirect:/user";
    }

    @GetMapping("/approve")
    public String holdRentList(Model model, HttpSession session) {
        String adminId = (String) session.getAttribute("sessionAdminId");

        List<RentHistoryDTO> rentHistoryDTO = rentService.holdRentList(adminId);
        model.addAttribute("rentHistoryDTO", rentHistoryDTO);

        return "pages-rent-approve";
    }

    @PostMapping("/approve")
    public String approveAdmin(int rentNum, HttpSession session) {
        String adminId = (String) session.getAttribute("sessionAdminId");

        rentService.approveRentHistory(rentNum,adminId);

        return "redirect:/dashboard/admin";
    }


    @GetMapping("/finalization")
    public String inProgressRentList(Model model, HttpSession session) {
        String adminId = (String) session.getAttribute("sessionAdminId");

        List<RentHistoryDTO> rentHistoryDTO = rentService.inProgressRentList(adminId);

        model.addAttribute("rentHistoryDTO", rentHistoryDTO);

        return "pages-rent-finalization";
    }

    @PostMapping("/finalization")
    public String confirmRentHistory(int rentNum, HttpSession session) {
        String adminId = (String) session.getAttribute("sessionAdminId");

        rentService.confirmRentHistory(rentNum,adminId);

        return "redirect:/dashboard/superadmin";
    }

}
