package com.ssg.martgowmsfullstack.controller;

import com.ssg.martgowmsfullstack.dto.StockDTO;
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
@RequestMapping("/stock")
public class StockController {

    @Autowired
    StockService stockService;

    @GetMapping("/user/stock")
    public String userStock(@RequestParam("user_id") String user_id, Model model) {
        List<StockDTO> stockList = stockService.getUserStock(user_id);
        model.addAttribute("stockList", stockList);
        return "stock/user_stock"; // → /WEB-INF/views/stock/user_stock.jsp
    }

    @GetMapping("/admin/stock")
    public String adminStock(@RequestParam("admin_id") String admin_id, Model model) {
        List<StockDTO> stockList = stockService.getAdminUserStock(admin_id);
        model.addAttribute("stockList", stockList);
        return "stock/admin_stock";
    }

    @GetMapping("/general/stock")
    public String generalStock(@RequestParam("admin_id") String admin_id, Model model) {
        List<StockDTO> stockList = stockService.getUserStock(admin_id);
        model.addAttribute("stockList", stockList);
        return "stock/general_stock";
    }

}
