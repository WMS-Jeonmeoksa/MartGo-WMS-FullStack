package com.ssg.martgowmsfullstack.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/customer")
public class CustomerHomeController {

    @GetMapping("")
    public String customerHome(HttpSession session) {
        if (session.getAttribute("loginInfo") == null) {
            return "redirect:/login";
        }
        return "redirect:/dashboard/user/";
    }


    // 거래처 마이페이지
    @GetMapping("/mypage")
    public String mypage(HttpSession session) {
        if (session.getAttribute("loginInfo") == null) {
            return "redirect:/login";
        }
        return "customer-mypage"; // /WEB-INF/views/customer-mypage.jsp
    }
}
