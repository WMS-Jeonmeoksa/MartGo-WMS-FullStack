package com.ssg.martgowmsfullstack.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class SpringController {
    @GetMapping("/")
    public String index() {
        return "redirect:/guest";
    }

}
