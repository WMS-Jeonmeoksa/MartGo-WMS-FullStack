package com.ssg.martgowmsfullstack.controller;

import com.ssg.martgowmsfullstack.dto.DashBoardDTO;
import com.ssg.martgowmsfullstack.service.AdminDashBoardService;
import com.ssg.martgowmsfullstack.service.UserDashBoardService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;

@Controller
@RequiredArgsConstructor
@RequestMapping("/dashboard")
public class UserDashBoardController {

    private final UserDashBoardService userDashBoardService;

    @PostMapping("/user")
    public String userDashBoard(HttpSession session, Model model) {
        if (session.getAttribute("loginInfo") == null) {
            return "redirect:/login";
        }
        String user_id = (String) session.getAttribute("sessionUserId");

        DashBoardDTO dashBoardList = userDashBoardService.getDashBoard(user_id);
        model.addAttribute("dashBoardList", dashBoardList);
        model.addAttribute("user_id", user_id);
        return "pages-dashboard-user";
    }
}
