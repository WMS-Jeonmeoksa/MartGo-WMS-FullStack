package com.ssg.martgowmsfullstack.controller;

import com.ssg.martgowmsfullstack.domain.UserVO;
import com.ssg.martgowmsfullstack.dto.UserDTO;
import com.ssg.martgowmsfullstack.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@RequiredArgsConstructor
@Controller
@RequestMapping("/user")
public class UserHomeController {

    private final UserService userService;

    @GetMapping("")
    public String userHome(HttpSession session) {
        if (session.getAttribute("loginInfo") == null) {
            return "redirect:/login";
        }
        return "user"; // user.jsp
    }

    // 👤 회원 마이페이지
    @GetMapping("/mypage")
    public String mypage(HttpSession session) {
        if (session.getAttribute("loginInfo") == null) {
            return "redirect:/login";
        }
        return "user-mypage"; // /WEB-INF/views/user-mypage.jsp
    }

    @PostMapping("/delete")
    public String deleteAccount(HttpSession session, Model model) {
        UserDTO user = (UserDTO) session.getAttribute("loginInfo");

        if (user == null || !"회원".equals(user.getRole())) {
            model.addAttribute("error", "회원만 탈퇴할 수 있습니다.");
            return "user-mypage";
        }

        userService.delete(user.getUserid());
        session.invalidate(); // 로그아웃 처리
        return "redirect:/login"; // 또는 redirect:/guest
    }


}
