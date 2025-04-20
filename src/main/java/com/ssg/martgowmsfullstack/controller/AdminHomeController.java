package com.ssg.martgowmsfullstack.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/admin")
public class AdminHomeController {

    @GetMapping
    public String home(HttpSession session) {
        if (session.getAttribute("loginInfo") == null) {
            return "redirect:/login";
        }
        return "admin"; // /WEB-INF/views/admin.jsp
    }
}
