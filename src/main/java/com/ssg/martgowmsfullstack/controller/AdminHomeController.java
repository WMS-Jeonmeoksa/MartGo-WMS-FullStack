package com.ssg.martgowmsfullstack.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminHomeController {

    // 창고 관리자 메인 페이지
    @GetMapping("")
    public String home(HttpSession session) {
        if (session.getAttribute("loginInfo") == null) {
            return "redirect:/login";
        }
        return "admin"; // /WEB-INF/views/admin.jsp
    }

    // 창고 관리자 마이페이지
    @GetMapping("/mypage")
    public String mypage(HttpSession session) {
        if (session.getAttribute("loginInfo") == null) {
            return "redirect:/login";
        }
        return "admin-mypage"; // /WEB-INF/views/warehouseadmin-mypage.jsp
    }
}
