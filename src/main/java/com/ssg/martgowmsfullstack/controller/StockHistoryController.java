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

    @GetMapping("/general/stock_history")
    public String generalStockHistory(@RequestParam("admin_id") String admin_id, Model model) {
        List<StockHistoryDTO> stockHistoryList = stockService.getGeneralStockHistory(admin_id);
        model.addAttribute("stockHistoryList", stockHistoryList);
        return "stock/general_stock_history";
    }

    @GetMapping("/admin/stock_history")
    public String adminStockHistory(@RequestParam("admin_id") String admin_id, Model model) {
        List<StockHistoryDTO> stockHistoryList = stockService.getGeneralStockHistory(admin_id);
        model.addAttribute("stockHistoryList", stockHistoryList);
        return "stock/admin_stock_history";
    }
}
