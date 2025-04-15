package com.ssg.martgowmsfullstack.controller;

import com.ssg.martgowmsfullstack.service.StockService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/stock_history")
public class StockHistoryController {

    @Autowired
    StockService stockService;


}
