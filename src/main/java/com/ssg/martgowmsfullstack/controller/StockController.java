package com.ssg.martgowmsfullstack.controller;

import com.ssg.martgowmsfullstack.dto.StockDTO;
import com.ssg.martgowmsfullstack.service.StockService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping("/stock")
public class StockController {

    private final StockService stockService;

    @GetMapping("/user")
    public String userStock(@RequestParam("user_id") String user_id, Model model) {
        String cleanUserId = user_id.trim().replace("\"", "");
        System.out.println("user_id = " + cleanUserId);

        List<StockDTO> stockList = stockService.getUserStock(cleanUserId);
        model.addAttribute("stockList", stockList);
        model.addAttribute("user_id", cleanUserId);
        return "pages-stock-user";
    }


    @GetMapping("/admin")
    public String adminStock(@RequestParam("admin_id") String admin_id, Model model) {
        String cleanAdminId = admin_id.trim().replace("\"", "");
        List<StockDTO> stockList = stockService.getAdminUserStock(cleanAdminId);
        model.addAttribute("stockList", stockList);
        model.addAttribute("admin_id", cleanAdminId);
        return "pages-stock-admin";
    }

    @GetMapping("/general")
    public String generalStock(@RequestParam("admin_id") String admin_id, Model model) {
        String cleanAdminId = admin_id.trim().replace("\"", "");
        List<StockDTO> stockList = stockService.getGeneralStock(cleanAdminId);
        model.addAttribute("stockList", stockList);
        model.addAttribute("admin_id", cleanAdminId);
        return "pages-stock-general";
    }

}
