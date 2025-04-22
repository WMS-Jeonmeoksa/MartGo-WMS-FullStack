package com.ssg.martgowmsfullstack.controller;

import com.ssg.martgowmsfullstack.domain.AdminVO;
import com.ssg.martgowmsfullstack.dto.AdminDTO;
import com.ssg.martgowmsfullstack.dto.StockHistoryDTO;
import com.ssg.martgowmsfullstack.service.StockService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping("/stock_history")
public class StockHistoryController {

    private final StockService stockService;

    @PostMapping("/general")
    public String generalStockHistory(HttpSession session, Model model) {
        AdminDTO adminDTO = (AdminDTO) session.getAttribute("loginInfo");
        String admin_id = adminDTO.getAdminId();

        String cleanAdminId = admin_id.trim().replace("\"", "");
        List<StockHistoryDTO> stockHistoryList = stockService.getGeneralStockHistory(cleanAdminId);
        model.addAttribute("stockHistoryList", stockHistoryList);
        model.addAttribute("admin_id", cleanAdminId);
        return "pages-stockhistory-general";
    }

    @PostMapping("/admin")
    public String adminStockHistory(HttpSession session, Model model) {
        AdminDTO adminDTO = (AdminDTO) session.getAttribute("loginInfo");
        String admin_id = adminDTO.getAdminId();

        String cleanAdminId = admin_id.trim().replace("\"", "");
        List<StockHistoryDTO> stockHistoryList = stockService.getGeneralStockHistory(cleanAdminId);
        model.addAttribute("stockHistoryList", stockHistoryList);
        model.addAttribute("admin_id", cleanAdminId);
        return "pages-stockhistory-admin";
    }
}
