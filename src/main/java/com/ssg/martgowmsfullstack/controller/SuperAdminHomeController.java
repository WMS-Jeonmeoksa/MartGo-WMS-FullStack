package com.ssg.martgowmsfullstack.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/superadmin")
public class SuperAdminHomeController {

    @GetMapping
    public String home(HttpSession session) {
        if (session.getAttribute("loginInfo") == null) {
            return "redirect:/login";
        }
        return "superadmin"; // /WEB-INF/views/superadmin.jsp
    }
}
