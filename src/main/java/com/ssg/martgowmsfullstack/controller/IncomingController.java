package com.ssg.martgowmsfullstack.controller;

import com.ssg.martgowmsfullstack.dto.IncomingDTO;
import com.ssg.martgowmsfullstack.dto.ProductDTO;
import com.ssg.martgowmsfullstack.service.IncomingService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping("/incoming")
public class IncomingController {

    private final IncomingService incomingService;

    @GetMapping("/select")
    public String showIncomingProduct(HttpSession session, Model model) {
        if (session.getAttribute("loginInfo") == null) {
            return "redirect:/login";
        }
        String userId = (String) session.getAttribute("sessionUserId");
        List<ProductDTO> productList = incomingService.getProductByUserId(userId);
        model.addAttribute("productList", productList);
        return "pages-incoming-select";
    }

    @PostMapping("/submit")
    public String submitIncoming(HttpSession session,
                                 @ModelAttribute IncomingDTO incomingDTO) {
        if (session.getAttribute("loginInfo") == null) {
            return "redirect:/login";
        }

        String userId = (String) session.getAttribute("sessionUserId");
        incomingDTO.setUserId(userId);

        incomingService.requestIncoming(incomingDTO);

        return "redirect:/incoming/confirm";
    }

    @GetMapping("/approve")
    public String showApprovalList(HttpSession session, Model model) {
        if (session.getAttribute("loginInfo") == null) {
            return "redirect:/login";
        }
        String adminId = (String) session.getAttribute("sessionAdminId");
        String role = incomingService.getAdminRoleById(adminId);
        List<IncomingDTO> incomingList = incomingService.getIncomingByRole(adminId, role);
        model.addAttribute("incomingList", incomingList);

        return "pages-incoming-approve";
    }

    @PostMapping("/approve")
    public String approveIncoming(HttpSession session,
                                  @RequestParam("incomingNum") int incomingNum) {
        if (session.getAttribute("loginInfo") == null) {
            return "redirect:/login";
        }
        String adminId = (String) session.getAttribute("sessionAdminId");
        String role = incomingService.getAdminRoleById(adminId);
        incomingService.approveIncoming(adminId, incomingNum, role);

        return "redirect:/incoming/approve";
    }
}
