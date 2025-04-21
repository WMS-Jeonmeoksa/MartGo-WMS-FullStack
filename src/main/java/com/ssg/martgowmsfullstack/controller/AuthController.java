package com.ssg.martgowmsfullstack.controller;

import com.ssg.martgowmsfullstack.domain.UserRole;
import com.ssg.martgowmsfullstack.domain.UserVO;
import com.ssg.martgowmsfullstack.domain.AdminVO;
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
        UserVO user = userService.findByUserid(userid);

        if (user != null && user.getPassword().equals(password)) {
            // 유저 로그인 성공
            UserRole role = UserRole.fromLabel(user.getRole());
            String sessionUserId = user.getUserid();

            session.setAttribute("loginInfo", user);
            session.setAttribute("roleEnum", role);
            session.setAttribute("sessionUserId", sessionUserId);

            switch (role) {
                case USER:
                    return "redirect:/user";
                case CUSTOMER:
                    return "redirect:/customer";
                default:
                    model.addAttribute("error", "허용되지 않은 사용자 권한입니다.");
                    return "login";
            }
        }

        // 2. 관리자 조회
        AdminVO admin = adminService.getAdminById(userid);

        if (admin != null && admin.getPassword().equals(password)) {
            UserRole role = UserRole.fromLabel(admin.getRole());
            String sessionAdminId = admin.getAdminId();

            session.setAttribute("loginInfo", admin); // admin도 loginInfo 키로 저장
            session.setAttribute("roleEnum", role);
            session.setAttribute("sessionAdminId", sessionAdminId);

            switch (role) {
                case ADMIN:
                    return "redirect:/admin";
                case SUPERADMIN:
                    return "redirect:/superadmin";
                default:
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
    public String register(@ModelAttribute UserVO user, Model model) {
        user.setRole("회원"); // 기본 role은 회원
        userService.register(user);
        return "redirect:/login";
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "guest"; // 비회원 홈
    }
}
