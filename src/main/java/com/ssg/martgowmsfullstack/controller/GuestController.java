package com.ssg.martgowmsfullstack.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class GuestController {

    @GetMapping("/guest")
    public String guestPage() {
        return "guest"; // → /WEB-INF/views/guest.jsp
    }
}
