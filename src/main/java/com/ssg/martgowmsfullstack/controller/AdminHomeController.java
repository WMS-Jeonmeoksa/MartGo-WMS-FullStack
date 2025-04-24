package com.ssg.martgowmsfullstack.controller;

import javax.servlet.http.HttpSession;

import com.ssg.martgowmsfullstack.dto.AdminDTO;
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
        return "redirect:/dashboard/admin/"; // /WEB-INF/views/admin.jsp
    }

    // 창고 관리자 마이페이지
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
        if (!"창고관리자".equals(adminDTO.getRole())) {
            return "redirect:/access-denied";
        }
        return "pages-admin-mypage"; // /WEB-INF/views/warehouseadmin-mypage.jsp
    }
}
