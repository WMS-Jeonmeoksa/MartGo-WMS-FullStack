package com.ssg.martgowmsfullstack.controller;

import com.ssg.martgowmsfullstack.domain.AdminVO;
import com.ssg.martgowmsfullstack.dto.AdminDTO;
import com.ssg.martgowmsfullstack.dto.DashBoardDTO;
import com.ssg.martgowmsfullstack.service.AdminDashBoardService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
@RequiredArgsConstructor
@RequestMapping("/dashboard")
public class AdminDashBoardController {

    private final AdminDashBoardService dashBoardService;

    @GetMapping("/admin")
    public String adminDashBoard(HttpSession session, Model model) {
        Object loginInfo = session.getAttribute("loginInfo");
        if (loginInfo == null) {
            return "redirect:/login";
        }
        if (!(loginInfo instanceof AdminDTO)) {
            return "redirect:/access-denied";
        }
        AdminDTO adminDTO = (AdminDTO) loginInfo;
        if (!"창고관리자".equals(adminDTO.getRole())) {
            return "redirect:/access-denied";
        }
        String admin_id = adminDTO.getAdminId().trim().replace("\"", "");

        DashBoardDTO dashBoardList = dashBoardService.getDashBoard(admin_id);
        model.addAttribute("dashBoardList", dashBoardList);
        model.addAttribute("monthlyRentTotals", dashBoardList.getMonthlyRentTotalList());
        model.addAttribute("admin_id", admin_id);
        return "pages-dashboard-admin";
    }

    @GetMapping("/superadmin")
    public String generalDashBoard(HttpSession session, Model model) {
        Object loginInfo = session.getAttribute("loginInfo");
        if (loginInfo == null) {
            return "redirect:/login";
        }
        if (!(loginInfo instanceof AdminDTO)) {
            return "redirect:/access-denied";
        }
        AdminDTO adminDTO = (AdminDTO) loginInfo;
        if (!"총관리자".equals(adminDTO.getRole())) {
            return "redirect:/access-denied";
        }
        String admin_id = adminDTO.getAdminId().trim().replace("\"", "");

        DashBoardDTO dashBoardList = dashBoardService.getDashBoard(admin_id);
        model.addAttribute("dashBoardList", dashBoardList);
        model.addAttribute("monthlyRentTotals", dashBoardList.getMonthlyRentTotalList());
        model.addAttribute("admin_id", admin_id);
        return "pages-dashboard-superadmin";
    }


}
