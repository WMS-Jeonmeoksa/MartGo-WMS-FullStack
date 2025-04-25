package com.ssg.martgowmsfullstack.controller;

import com.ssg.martgowmsfullstack.dto.DashBoardDTO;
import com.ssg.martgowmsfullstack.dto.UserDTO;
import com.ssg.martgowmsfullstack.mapper.DashBoardMapper;
import com.ssg.martgowmsfullstack.service.CustomerDashBoardService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
@RequiredArgsConstructor
@RequestMapping("/dashboard")
public class CustomerDashBoardController {

    private final CustomerDashBoardService userDashBoardService;
    private final DashBoardMapper dashBoardMapper;

    @GetMapping("/customer")
    public String customerDashBoard(HttpSession session, Model model) {
        Object loginInfo = session.getAttribute("loginInfo");
        if (loginInfo == null) {
            return "redirect:/login";
        }
        if(!(loginInfo instanceof UserDTO)) {
            return "redirect:/access-denied";
        }
        UserDTO userDTO = (UserDTO) loginInfo;

//        Integer remainingDays = dashBoardMapper.getRemainingDays(userDTO.getUserid());
//        if (remainingDays == null || remainingDays == 0) {
//            dashBoardMapper.updateUserRole(userDTO.getUserid());
//            userDTO.setRole("회원");
//            session.setAttribute("loginInfo", userDTO);
//            session.setAttribute("role", "회원");
//            return "redirect:/user";
//        }

        if(!"거래처".equals(userDTO.getRole())) {
            return "redirect:/access-denied";
        }
        String user_id = userDTO.getUserid().trim().replace("\"", "");

        DashBoardDTO dashBoardList = userDashBoardService.getDashBoard(user_id);
        model.addAttribute("dashBoardList", dashBoardList);
        model.addAttribute("user_id", user_id);
        return "pages-dashboard-customer";
    }
}
