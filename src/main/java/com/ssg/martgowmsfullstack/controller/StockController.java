package com.ssg.martgowmsfullstack.controller;

import com.ssg.martgowmsfullstack.dto.AdminDTO;
import com.ssg.martgowmsfullstack.dto.StockDTO;
import com.ssg.martgowmsfullstack.service.StockService;
import lombok.RequiredArgsConstructor;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping("/stock")
public class StockController {

    private final StockService stockService;

    @PostMapping("/user")
    public String userStock(HttpSession session, Model model) {
        String user_id = (String) session.getAttribute("sessionUserId");

        String cleanUserId = user_id.trim().replace("\"", "");

        List<StockDTO> stockList = stockService.getUserStock(cleanUserId);
        model.addAttribute("stockList", stockList);
        model.addAttribute("user_id", cleanUserId);
        return "pages-stock-user";
    }


    @PostMapping("/admin")
    public String adminStock(HttpSession session, Model model) {
        AdminDTO adminDTO = (AdminDTO) session.getAttribute("loginInfo");
        String admin_id = adminDTO.getAdminId();

        String cleanAdminId = admin_id.trim().replace("\"", "");
        List<StockDTO> stockList = stockService.getAdminUserStock(cleanAdminId);
        model.addAttribute("stockList", stockList);
        model.addAttribute("admin_id", cleanAdminId);
        return "pages-stock-admin";
    }

    @PostMapping("/general")
    public String generalStock(HttpSession session, Model model) {
        AdminDTO adminDTO = (AdminDTO) session.getAttribute("loginInfo");
        String admin_id = adminDTO.getAdminId();

        String cleanAdminId = admin_id.trim().replace("\"", "");
        List<StockDTO> stockList = stockService.getGeneralStock(cleanAdminId);
        model.addAttribute("stockList", stockList);
        model.addAttribute("admin_id", cleanAdminId);
        return "pages-stock-general";
    }

}
