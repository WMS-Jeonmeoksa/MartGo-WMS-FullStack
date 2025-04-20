package com.ssg.martgowmsfullstack.controller;

import com.ssg.martgowmsfullstack.domain.UserRole;
import com.ssg.martgowmsfullstack.domain.UserVO;
import com.ssg.martgowmsfullstack.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;

@Controller
@RequiredArgsConstructor
public class AuthController {

    private final UserService userService;

    @GetMapping("/login")
    public String loginForm() {
        return "login"; // login.jsp
    }

    @PostMapping("/login")
    public String login(@RequestParam String userid,
                        @RequestParam String password,
                        HttpSession session,
                        Model model) {

        UserVO dbUser = userService.findByUserid(userid);

        if (dbUser == null || !dbUser.getPassword().equals(password)) {
            model.addAttribute("error", "아이디 또는 비밀번호가 일치하지 않습니다.");
            return "login";
        }

        // ⭐ role 문자열을 enum으로 수동 매핑
        UserRole enumRole;
        try {
            enumRole = UserRole.fromLabel(dbUser.getRole());  // "거래처" → UserRole.CUSTOMER
        } catch (IllegalArgumentException e) {
            model.addAttribute("error", "알 수 없는 권한입니다.");
            return "login";
        }

        // 새로 매핑한 enumRole을 세션에 저장하고 싶다면 따로 DTO에 넣거나 필요할 때만 사용
        session.setAttribute("loginInfo", dbUser);
        session.setAttribute("roleEnum", enumRole); // 필요 시

        switch (enumRole) {
            case USER:
                return "redirect:/user";
            case CUSTOMER:
                return "redirect:/customer";
            case ADMIN:
                return "redirect:/admin";
            case SUPERADMIN:
                return "redirect:/superadmin";
            default:
                model.addAttribute("error", "권한 정보가 잘못되었습니다.");
                return "login";
        }
    }


    @GetMapping("/register")
    public String registerForm() {
        return "registerForm"; // registerForm.jsp
    }

    @PostMapping("/register")
    public String register(@ModelAttribute UserVO user, Model model) {
        user.setRole("회원");
        userService.register(user);
        return "redirect:/login";
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "guest"; // → guest.jsp 열림
    }
}
