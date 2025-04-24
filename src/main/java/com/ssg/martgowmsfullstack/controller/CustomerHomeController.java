package com.ssg.martgowmsfullstack.controller;

import com.ssg.martgowmsfullstack.dto.UserDTO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
        return "redirect:/dashboard/customer";
    }


    // 거래처 마이페이지
    @GetMapping("/mypage")
    public String mypage(HttpSession session) {
        Object loginInfo = session.getAttribute("loginInfo");
        if (loginInfo == null) {
            return "redirect:/login";
        }
        if(!(loginInfo instanceof UserDTO)) {
            return "redirect:/access-denied";
        }
        UserDTO userDTO = (UserDTO) loginInfo;

        if(!"거래처".equals(userDTO.getRole())) {
            return "redirect:/access-denied";
        }
        return "customer-mypage"; // /WEB-INF/views/customer-mypage.jsp
    }
}
