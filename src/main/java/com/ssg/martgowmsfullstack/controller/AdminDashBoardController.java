package com.ssg.martgowmsfullstack.controller;

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
        if (session.getAttribute("loginInfo") == null) {
            return "redirect:/login";
        }

        String admin_id = (String) session.getAttribute("sessionAdminId");

        DashBoardDTO dashBoardList = dashBoardService.getDashBoard(admin_id);
        model.addAttribute("dashBoardList", dashBoardList);
        model.addAttribute("monthlyRentTotals", dashBoardList.getMonthlyRentTotalList());
        model.addAttribute("admin_id", admin_id);
        return "pages-dashboard-admin";
    }

    @GetMapping("/general")
    public String generalDashBoard(HttpSession session, Model model) {
        if (session.getAttribute("loginInfo") == null) {
            return "redirect:/login";
        }

        String admin_id = (String) session.getAttribute("sessionAdminId");

        
        DashBoardDTO dashBoardList = dashBoardService.getDashBoard(admin_id);
        model.addAttribute("dashBoardList", dashBoardList);
        model.addAttribute("monthlyRentTotals", dashBoardList.getMonthlyRentTotalList());
        model.addAttribute("admin_id", admin_id);
        return "pages-dashboard-general";
    }




}
