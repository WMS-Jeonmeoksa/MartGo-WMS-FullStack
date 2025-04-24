package com.ssg.martgowmsfullstack.controller;

import com.ssg.martgowmsfullstack.domain.UserVO;
import com.ssg.martgowmsfullstack.dto.LoginDTO;
import com.ssg.martgowmsfullstack.dto.UserDTO;
import com.ssg.martgowmsfullstack.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@RequiredArgsConstructor
@Controller
@RequestMapping("/user")
public class UserHomeController {

    private final UserService userService;

    @GetMapping("")
    public String userHome(HttpSession session) {
        Object loginInfo = session.getAttribute("loginInfo");
        if (loginInfo == null) {
            return "redirect:/login";
        }
        if(!(loginInfo instanceof UserDTO)) {
            return "redirect:/access-denied";
        }
        UserDTO userDTO = (UserDTO) loginInfo;

        if(!"회원".equals(userDTO.getRole())) {
            return "redirect:/access-denied";
        }
        return "pages-user"; // pages-user.jsp
    }

    // 👤 회원 마이페이지
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

        if(!"회원".equals(userDTO.getRole())) {
            return "redirect:/access-denied";
        }
        return "pages-user-mypage"; // /WEB-INF/views/pages-user-mypage.jsp
    }

    @PostMapping("/delete")
    @ResponseBody
    public String deleteAccount(HttpSession session, Model model) {
        UserDTO user = (UserDTO) session.getAttribute("loginInfo");

        if (user == null || !"회원".equals(user.getRole())) {
            model.addAttribute("error", "회원만 탈퇴할 수 있습니다.");
            return "pages-user-mypage";
        }


        userService.delete(user.getUserid());
        session.invalidate(); // 로그아웃 처리
        return "success"; // 또는 redirect:/guest
    }

    @PostMapping(value = "/update", produces = "application/json; charset=UTF-8")
    @ResponseBody
    public Map<String, Object> updateUserInfo(@RequestParam String phone,
                                              @RequestParam String address,
                                              @RequestParam String addressDetail,
                                              HttpSession session) {
        Map<String, Object> response = new HashMap<>();
        UserDTO user = (UserDTO) session.getAttribute("loginInfo");

        if (user == null || !"회원".equals(user.getRole())) {
            response.put("status", "fail");
            response.put("message", "인증되지 않은 사용자입니다.");
            return response;
        }

        // 유효성 검사
        if (phone == null || phone.length() < 7 || address == null || address.trim().isEmpty() || addressDetail.trim().isEmpty()) {
            response.put("status", "fail");
            response.put("message", "전화번호와 주소를 정확히 입력해주세요.");
            return response;
        }

        // 괄호 포함된 기존 상세주소 제거
        String cleanAddress = address.replaceAll("\\s*\\(.*\\)", ""); // 정규식으로 괄호 제거

        user.setPhone(phone);
        user.setAddress(cleanAddress + " (" + addressDetail + ")");
        userService.updateUserInfo(user);
        session.setAttribute("loginInfo", user);

        response.put("status", "success");
        response.put("message", "회원정보가 성공적으로 수정되었습니다.");
        return response;
    }




}
