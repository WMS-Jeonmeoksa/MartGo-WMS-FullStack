package com.ssg.martgowmsfullstack.controller;

import com.ssg.martgowmsfullstack.domain.AdminVO;
import com.ssg.martgowmsfullstack.dto.AdminDTO;
import com.ssg.martgowmsfullstack.dto.UserDTO;
import com.ssg.martgowmsfullstack.service.UserService;
import com.ssg.martgowmsfullstack.service.AdminService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;

@Controller
@RequiredArgsConstructor
public class AuthController {

    private final UserService userService;
    private final AdminService adminService;

    @GetMapping("/login")
    public String loginForm() {
        return "login"; // login.jsp
    }

    @PostMapping("/login")
    public String login(@RequestParam String userid,
                        @RequestParam String password,
                        HttpSession session,
                        Model model) {

        // 1. 일반 사용자 조회
        UserDTO user = userService.findByUserid(userid);

        if (user != null && "활성화".equals(user.getStatus())) {
            if (!user.getPassword().equals(password)) {
                model.addAttribute("error", "아이디 또는 비밀번호가 일치하지 않습니다.");
                return "login";
            }

            String role = user.getRole();
            session.setAttribute("loginInfo", user);
            session.setAttribute("role", role);
            session.setAttribute("sessionUserId", user.getUserid());

            if ("회원".equals(role)) {
                return "redirect:/user";
            } else if ("거래처".equals(role)) {
                return "redirect:/customer";
            } else {
                model.addAttribute("error", "허용되지 않은 사용자 권한입니다.");
                return "login";
            }
        }

        // 2. 관리자 조회
        AdminDTO admin = adminService.getAdminById(userid);

        if (admin != null && admin.getPassword().equals(password)) {
            String role = admin.getRole();
            session.setAttribute("loginInfo", admin);
            session.setAttribute("role", role);
            session.setAttribute("sessionAdminId", admin.getAdminId());

            if ("창고관리자".equals(role)) {
                return "redirect:/admin";
            } else if ("총관리자".equals(role)) {
                return "redirect:/superadmin";
            } else {
                model.addAttribute("error", "허용되지 않은 관리자 권한입니다.");
                return "login";
            }
        }

        // 둘 다 실패
        model.addAttribute("error", "아이디 또는 비밀번호가 일치하지 않습니다.");
        return "login";
    }

    @GetMapping("/register")
    public String registerForm() {
        return "registerForm";
    }

    @PostMapping("/register")
    public String register(@ModelAttribute UserDTO user,
                           @RequestParam("addressDetail") String addressDetail,
                           Model model) {

        if (userService.findByUserid(user.getUserid()) != null) {
            model.addAttribute("error", "이미 존재하는 아이디입니다.");
            return "registerForm";
        }

        String fullAddress = (user.getAddress() + " (" + addressDetail + ")").trim();
        user.setAddress(fullAddress);
        user.setRole("회원");
        user.setStatus("활성화");

        userService.register(user);
        return "redirect:/login";
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "guest"; // 비회원 홈
    }
}
