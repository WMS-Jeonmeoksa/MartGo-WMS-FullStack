package com.ssg.martgowmsfullstack.controller;

import com.ssg.martgowmsfullstack.dto.UserDTO;
import com.ssg.martgowmsfullstack.dto.AdminDTO;
import com.ssg.martgowmsfullstack.dto.LoginDTO;
import com.ssg.martgowmsfullstack.service.UserService;
import com.ssg.martgowmsfullstack.service.AdminService;
import com.ssg.martgowmsfullstack.util.Encrypt;
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
        return "pages-login"; // 공통 로그인 폼 (선택지 제공)
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
            return "pages-login";
        }

        // 2. 관리자 로그인 시도
        if (adminService.login(userid, password)) {
            AdminDTO admin = adminService.getAdminById(userid);

            if ("0".equals(admin.getPassword())) {
                session.setAttribute("tempAdminId", admin.getAdminId()); // 임시 세션 저장
                return "redirect:/admin/set-password";
            }

            session.setAttribute("loginInfo", admin);
            session.setAttribute("role", admin.getRole());
            session.setAttribute("sessionAdminId", admin.getAdminId());

            if ("창고관리자".equals(admin.getRole())) return "redirect:/admin";
            if ("총관리자".equals(admin.getRole())) return "redirect:/superadmin";

            model.addAttribute("error", "허용되지 않은 관리자 권한입니다.");
            return "pages-login";
        }

        // 3. 모두 실패
        model.addAttribute("error", "아이디 또는 비밀번호가 일치하지 않습니다.");
        return "pages-login";
    }


    @GetMapping("/admin/set-password")
    public String setAdminPasswordForm() {
        return "pages-admin-set-password";
    }

    @PostMapping("/admin/set-password")
    public String setAdminPassword(@RequestParam String newPassword,
                                   HttpSession session,
                                   Model model) {
        String adminId = (String) session.getAttribute("tempAdminId");
        if (adminId == null) return "redirect:/login";

        String salt = Encrypt.getSalt();
        String hash = Encrypt.getEncrypt(newPassword, salt);

        adminService.updatePassword(adminId, hash, salt); // 새 메서드 필요

        session.removeAttribute("tempAdminId"); // 임시 세션 제거
        return "redirect:/login?pwResetSuccess=true";
    }

    @PostMapping("/admin/update-password")
    public String updateAdminPassword(
            @RequestParam String adminId,
            @RequestParam String newPassword,
            HttpSession session,
            Model model) {

        // 1. 비밀번호 유효성 체크 (4자리 이상인지 등)
        if (newPassword.length() < 4) {
            model.addAttribute("error", "비밀번호는 4자리 이상이어야 합니다.");
            return "pages-admin-set-password";
        }

        // 2. salt 생성
        String salt = Encrypt.getSalt();
        String hashedPw = Encrypt.getEncrypt(newPassword, salt);

        // 3. 비밀번호 업데이트
        adminService.updatePassword(adminId, hashedPw, salt);

        // 4. 세션 초기화 후 로그인 페이지로
        session.invalidate();
        return "redirect:/login?message=passwordChanged";
    }





    // --- 회원가입 폼 ---
    @GetMapping("/register")
    public String registerForm() {
        return "pages-registerForm";
    }

    // --- 회원가입 처리 ---
    @PostMapping("/register")
    public String register(@ModelAttribute UserDTO user,
                           @RequestParam("addressDetail") String addressDetail,
                           @RequestParam("phone1") String phone1,
                           @RequestParam("phone2") String phone2,
                           @RequestParam("phone3") String phone3,
                           Model model) {

        if (userService.findByUserid(user.getUserid()) != null) {
            model.addAttribute("error", "이미 존재하는 아이디입니다.");
            return "pages-registerForm";
        }

        String fullAddress = (user.getAddress() + " (" + addressDetail + ")").trim();
        String fullPhone = phone1 + "-" + phone2 + "-" + phone3;


        user.setAddress(fullAddress);
        user.setPhone(fullPhone);
        user.setRole("회원");
        user.setStatus("활성화");

        userService.register(user);



        return "redirect:/login?joined=true";
    }

    // --- 로그아웃 ---
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "pages-guest"; // 비회원 홈
    }
}
