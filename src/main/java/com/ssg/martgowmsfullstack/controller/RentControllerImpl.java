package com.ssg.martgowmsfullstack.controller;

import com.ssg.martgowmsfullstack.dto.RentHistoryDTO;
import com.ssg.martgowmsfullstack.mapper.RentMapper;
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
public class RentControllerImpl implements RentController{

    @Autowired
    public RentService rentService;

    @Autowired
    public RentMapper rentMapper;

    @GetMapping("/warehouse")
    public String applyRentWarehouse(Model model) {
        List<RentHistoryDTO> rentHistoryDTOList = rentMapper.getAllWarehouses();

        model.addAttribute("warehouses", rentHistoryDTOList);
        return "pages-warehouse";
    }




    @GetMapping("/sector")
    public String applyRentSec(int wareHouse) {
        rentMapper.getAllSectors(wareHouse);
        return "redirect:/rent/sector";
    }

    @GetMapping("/costinfo")
    public String applyRentCostInfo(int wareHouse, String sectorName) {
        rentMapper.getCostInfo(wareHouse, sectorName);
        return "redirect:/rent/costinfo";
    }

    @PostMapping("/last")
    public String applyRent(
            @ModelAttribute RentHistoryDTO rentHistory,
            @RequestParam("month") int month,
            @RequestParam("startDay") String startDay,
            @RequestParam("rentPrice") int rentPrice,
            @RequestParam("userId") String userId // 로그인 세션 등으로 받을 수도 있음
    ) {
        rentHistory.setRentPrice(rentPrice);
        rentHistory.setUserId(userId);

        String endDate = rentService.endDate(month, startDay);

        int confirm = 1; // 예시: 나중에 실제 확인 여부 값으로 대체

        if (confirm == 1) {
            rentService.saveRentHistory(rentHistory, month, startDay);
        } else {
            System.out.println("임대 신청이 취소되었습니다.");
        }

        return "redirect:/rent/last";
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
//
//    public List<RentHistoryDTO> showMonthlyPerformance(String adminId) {
//        return rentService.getMonthlyPerformance(adminId);
//    }
}
