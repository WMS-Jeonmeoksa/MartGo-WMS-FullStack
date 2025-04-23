package com.ssg.martgowmsfullstack.controller;

import com.ssg.martgowmsfullstack.dto.UserDTO;
import com.ssg.martgowmsfullstack.dto.AdminDTO;
import com.ssg.martgowmsfullstack.dto.LoginDTO;
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

    // --- 로그인 폼 ---
    @GetMapping("/login")
    public String loginForm() {
        return "login"; // 공통 로그인 폼 (선택지 제공)
    }

    @PostMapping("/login")
    public String login(@ModelAttribute LoginDTO loginDTO,
                        HttpSession session,
                        Model model) {

        String userid = loginDTO.getUserid();
        String password = loginDTO.getPassword();

        // 1. 사용자 로그인 시도
        if (userService.login(userid, password)) {
            UserDTO user = userService.findByUserid(userid);
            session.setAttribute("loginInfo", user);
            session.setAttribute("role", user.getRole());
            session.setAttribute("sessionUserId", user.getUserid());

            if ("회원".equals(user.getRole())) return "redirect:/user";
            if ("거래처".equals(user.getRole())) return "redirect:/customer";

            model.addAttribute("error", "허용되지 않은 사용자 권한입니다.");
            return "login";
        }

        // 2. 관리자 로그인 시도
        if (adminService.login(userid, password)) {
            AdminDTO admin = adminService.getAdminById(userid);
            session.setAttribute("loginInfo", admin);
            session.setAttribute("role", admin.getRole());
            session.setAttribute("sessionAdminId", admin.getAdminId());

            if ("창고관리자".equals(admin.getRole())) return "redirect:/admin";
            if ("총관리자".equals(admin.getRole())) return "redirect:/superadmin";

            model.addAttribute("error", "허용되지 않은 관리자 권한입니다.");
            return "login";
        }

        // 3. 모두 실패
        model.addAttribute("error", "아이디 또는 비밀번호가 일치하지 않습니다.");
        return "login";
    }

    // --- 회원가입 폼 ---
    @GetMapping("/register")
    public String registerForm() {
        return "registerForm";
    }

    // --- 회원가입 처리 ---
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

    // --- 로그아웃 ---
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "guest"; // 비회원 홈
    }
}
