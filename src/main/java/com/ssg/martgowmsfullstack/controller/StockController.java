package com.ssg.martgowmsfullstack.controller;

import com.ssg.martgowmsfullstack.dto.StockDTO;
import com.ssg.martgowmsfullstack.service.StockService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequestMapping("/stock")
public class StockController {

    @Autowired
    StockService stockService;

    @GetMapping("/user")
    public String userStock(@RequestParam("userId") String userId, Model model) {
        List<StockDTO> stockList = stockService.getUserStock(userId);
        model.addAttribute("stockList", stockList);
        return "stock/user_stock"; // → /WEB-INF/views/stock/user_stock.jsp
    }

    @GetMapping("/admin")
    public String adminStock(@RequestParam("adminId") String adminId, Model model) {
        List<StockDTO> stockList = stockService.getUserStock(adminId);
        model.addAttribute("stockList", stockList);
        return "stock/admin_stock";
    }

}
