package com.ssg.martgowmsfullstack.controller;

import com.ssg.martgowmsfullstack.dto.AdminDTO;
import com.ssg.martgowmsfullstack.dto.DashBoardDTO;
import com.ssg.martgowmsfullstack.dto.UserDTO;
import com.ssg.martgowmsfullstack.service.AdminDashBoardService;
import com.ssg.martgowmsfullstack.service.UserDashBoardService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;

@Controller
@RequiredArgsConstructor
@RequestMapping("/dashboard")
public class UserDashBoardController {

    private final UserDashBoardService userDashBoardService;

    @GetMapping("/user")
    public String userDashBoard(HttpSession session, Model model) {
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
        String user_id = userDTO.getUserid().trim().replace("\"", "");

        DashBoardDTO dashBoardList = userDashBoardService.getDashBoard(user_id);
        model.addAttribute("dashBoardList", dashBoardList);
        model.addAttribute("user_id", user_id);
        return "pages-dashboard-user";
    }
}
