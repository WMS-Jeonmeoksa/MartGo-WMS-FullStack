package com.ssg.martgowmsfullstack.controller;

import com.ssg.martgowmsfullstack.service.RentCleanupService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
@RequiredArgsConstructor
public class GuestController {

    private final RentCleanupService rentCleanupService;

    @GetMapping("/guest")
    public String guestPage() {
        rentCleanupService.cleanupExpiredRentData();
        return "guest"; // → /WEB-INF/views/guest.jsp
    }
}
