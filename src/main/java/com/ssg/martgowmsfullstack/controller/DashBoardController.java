package com.ssg.martgowmsfullstack.controller;

import com.ssg.martgowmsfullstack.dto.DashBoardDTO;
import com.ssg.martgowmsfullstack.service.DashBoardService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequiredArgsConstructor
@RequestMapping("/dashboard")
public class DashBoardController {

    private final DashBoardService dashBoardService;

    @GetMapping("/admin")
    public String adminDashBoard(@RequestParam String admin_id, Model model) {
        String cleanAdminID = admin_id.trim().replace("\"", "");
        DashBoardDTO dashBoardList = dashBoardService.getDashBoard(cleanAdminID);
        model.addAttribute("dashBoardList", dashBoardList);
        model.addAttribute("admin_id", cleanAdminID);
        return "pages-dashboard-admin";
    }

    @GetMapping("/general")
    public String generalDashBoard(@RequestParam String admin_id, Model model) {
        String cleanGeneralID = admin_id.trim().replace("\"", "");
        DashBoardDTO dashBoardList = dashBoardService.getDashBoard(cleanGeneralID);
        model.addAttribute("dashBoardList", dashBoardList);
        model.addAttribute("admin_id", cleanGeneralID);
        return "pages-dashboard-general";
    }




}
