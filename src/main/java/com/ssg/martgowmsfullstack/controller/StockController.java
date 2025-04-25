package com.ssg.martgowmsfullstack.controller;

import com.ssg.martgowmsfullstack.dto.AdminDTO;
import com.ssg.martgowmsfullstack.dto.StockDTO;
import com.ssg.martgowmsfullstack.dto.UserDTO;
import com.ssg.martgowmsfullstack.service.StockService;
import lombok.Getter;
import lombok.RequiredArgsConstructor;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping("/stock")
public class StockController {

    private final StockService stockService;

    @GetMapping("/customer")
    public String customerStock(HttpSession session, Model model) {
        Object loginInfo = session.getAttribute("loginInfo");
        if (loginInfo == null) {
            return "redirect:/login";
        }
        if (!(loginInfo instanceof UserDTO)) {
            return "redirect:/access-denied";
        }

        UserDTO userDTO = (UserDTO) loginInfo;

        if(!"거래처".equals(userDTO.getRole())) {
            return "redirect:/access-denied";
        }

        String cleanUserId = ((UserDTO) loginInfo).getUserid().trim().replace("\"", "");

        List<StockDTO> stockList = stockService.getUserStock(cleanUserId);
        model.addAttribute("stockList", stockList);
        model.addAttribute("user_id", cleanUserId);
        return "pages-stock-customer";
    }


    @GetMapping("/admin")
    public String adminStock(HttpSession session, Model model) {
        Object loginInfo = session.getAttribute("loginInfo");

        if (loginInfo == null) {
            return "redirect:/login";
        }
        if (!(loginInfo instanceof AdminDTO)) {
            return "redirect:/access-denied";
        }

        AdminDTO adminDTO = (AdminDTO) loginInfo;

        if (!"창고관리자".equals(adminDTO.getRole())) {
            return "redirect:/access-denied";
        }

        String cleanAdminId = adminDTO.getAdminId().trim().replace("\"", "");
        List<StockDTO> stockList = stockService.getAdminUserStock(cleanAdminId);
        model.addAttribute("stockList", stockList);
        model.addAttribute("admin_id", cleanAdminId);
        return "pages-stock-admin";
    }

    @GetMapping("/superadmin")
    public String superAdminStock(HttpSession session, Model model) {
        Object loginInfo = session.getAttribute("loginInfo");

        if (loginInfo == null) {
            return "redirect:/login";
        }

        if (!(loginInfo instanceof AdminDTO)) {
            return "redirect:/access-denied";
        }

        AdminDTO adminDTO = (AdminDTO) loginInfo;


        if (!"총관리자".equals(adminDTO.getRole())) {
            return "redirect:/access-denied";
        }

        String cleanAdminId = adminDTO.getAdminId().trim().replace("\"", "");
        List<StockDTO> stockList = stockService.getGeneralStock(cleanAdminId);
        model.addAttribute("stockList", stockList);
        model.addAttribute("admin_id", cleanAdminId);
        return "pages-stock-superadmin";

    }

}
