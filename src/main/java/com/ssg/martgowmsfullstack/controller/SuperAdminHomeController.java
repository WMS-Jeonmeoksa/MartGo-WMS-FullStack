package com.ssg.martgowmsfullstack.controller;

import com.ssg.martgowmsfullstack.dto.AdminDTO;
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
        return "redirect:/dashboard/superadmin";
    }

    @GetMapping("/mypage")
    public String mypage(HttpSession session) {
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
        return "pages-superadmin-mypage";
    }
}
