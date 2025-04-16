package com.ssg.martgowmsfullstack.controller;

import com.ssg.martgowmsfullstack.dto.StockHistoryDTO;
import com.ssg.martgowmsfullstack.service.StockService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequestMapping("/stock_history")
public class StockHistoryController {

    @Autowired
    StockService stockService;

    @GetMapping("/general")
    public String generalStockHistory(@RequestParam("admin_id") String admin_id, Model model) {
        String cleanAdminId = admin_id.trim().replace("\"", "");
        List<StockHistoryDTO> stockHistoryList = stockService.getGeneralStockHistory(cleanAdminId);
        model.addAttribute("stockHistoryList", stockHistoryList);
        model.addAttribute("admin_id", cleanAdminId);
        return "pages-stockhistory-general";
    }

    @GetMapping("/admin")
    public String adminStockHistory(@RequestParam("admin_id") String admin_id, Model model) {
        String cleanAdminId = admin_id.trim().replace("\"", "");
        List<StockHistoryDTO> stockHistoryList = stockService.getGeneralStockHistory(cleanAdminId);
        model.addAttribute("stockHistoryList", stockHistoryList);
        model.addAttribute("admin_id", cleanAdminId);
        return "pages-stockhistory-admin";
    }
}
