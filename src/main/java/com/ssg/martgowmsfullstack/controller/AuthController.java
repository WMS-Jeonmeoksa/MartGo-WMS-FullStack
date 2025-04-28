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
        return "pages-login"; // 공통 로그인 폼
    }

    @PostMapping("/login")
    public String login(@ModelAttribute LoginDTO loginDTO,
                        HttpSession session,
                        Model model) {

        String userid = loginDTO.getUserid();
        String password = loginDTO.getPassword();

        // 사용자 로그인
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

        // 관리자 로그인
        if (adminService.login(userid, password)) {
            AdminDTO admin = adminService.getAdminById(userid);

            if ("0".equals(admin.getPassword())) {
                session.setAttribute("tempAdminId", admin.getAdminId());
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

        // 모두 실패
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

        adminService.updatePassword(adminId, hash, salt);
        session.removeAttribute("tempAdminId");
        return "redirect:/login?pwResetSuccess=true";
    }

    @PostMapping("/admin/update-password")
    public String updateAdminPassword(@RequestParam String adminId,
                                      @RequestParam String newPassword,
                                      HttpSession session,
                                      Model model) {
        if (newPassword.length() < 4) {
            model.addAttribute("error", "비밀번호는 4자리 이상이어야 합니다.");
            return "pages-admin-set-password";
        }

        String salt = Encrypt.getSalt();
        String hashedPw = Encrypt.getEncrypt(newPassword, salt);

        adminService.updatePassword(adminId, hashedPw, salt);
        session.invalidate();
        return "redirect:/login?success=true";
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

        if (userService.findByUserid(user.getUserid()) != null ||
                adminService.getAdminById(user.getUserid()) != null) {
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
        return "pages-guest";
    }

    // --- 아이디 중복 체크 ---
    @GetMapping("/checkUserid")
    @ResponseBody
    public String checkUserid(@RequestParam String userid) {
        boolean userExists = userService.findByUserid(userid) != null;
        boolean adminExists = adminService.getAdminById(userid) != null;

        if (userExists || adminExists) {
            return "EXISTS"; // 이미 존재
        }
        return "OK"; // 사용 가능
    }
}
