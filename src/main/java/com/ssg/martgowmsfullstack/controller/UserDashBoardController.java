package com.ssg.martgowmsfullstack.controller;

import com.ssg.martgowmsfullstack.dto.DashBoardDTO;
import com.ssg.martgowmsfullstack.service.AdminDashBoardService;
import com.ssg.martgowmsfullstack.service.UserDashBoardService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequiredArgsConstructor
@RequestMapping("/dashboard")
public class UserDashBoardController {

    private final UserDashBoardService userDashBoardService;

    @GetMapping("/user")
    public String adminDashBoard(@RequestParam String user_id, Model model) {
        String cleanUserID = user_id.trim().replace("\"", "");
        DashBoardDTO dashBoardList = userDashBoardService.getDashBoard(cleanUserID);
        model.addAttribute("dashBoardList", dashBoardList);
        model.addAttribute("user_id", cleanUserID);
        return "pages-dashboard-user";
    }
}
