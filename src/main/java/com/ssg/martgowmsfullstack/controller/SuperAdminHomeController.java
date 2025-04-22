package com.ssg.martgowmsfullstack.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/superadmin")
@RequiredArgsConstructor
class SuperAdminHomeController {

    @GetMapping
    public String home(HttpSession session) {
        if (session.getAttribute("loginInfo") == null) {
            return "redirect:/login";
        }
        return "redirect:/dashboard/general/";
    }

    @GetMapping("/mypage")
    public String mypage(HttpSession session) {
        if (session.getAttribute("loginInfo") == null) {
            return "redirect:/login";
        }
        return "superadmin-mypage";
    }
}
