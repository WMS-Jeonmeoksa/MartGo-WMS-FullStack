package com.ssg.martgowmsfullstack.controller;

import com.ssg.martgowmsfullstack.dto.OutgoingDTO;
import com.ssg.martgowmsfullstack.dto.StockDTO;
import com.ssg.martgowmsfullstack.service.IncomingService;
import com.ssg.martgowmsfullstack.service.OutgoingService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.w3c.dom.stylesheets.LinkStyle;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping("/outgoing")
public class OutgoingController {

    private final OutgoingService outgoingService;
    private final IncomingService incomingService;

    @GetMapping("/select")
    public String showOutgoingStock(HttpSession session, Model model) {
        if (session.getAttribute("loginInfo") == null) {
            return "redirect:/login";
        }

        String userId = (String) session.getAttribute("sessionUserId");
        List<StockDTO> stockDTOList = outgoingService.showStockByUserId(userId);
        model.addAttribute("stockList", stockDTOList);
        return "pages-outgoing-select";
    }

    @GetMapping("/detail")
    public String selectOutgoingDetail(HttpSession session,
                                       @RequestParam("stockNum") int stockNum,
                                       @RequestParam("productId") String productId,
                                       Model model) {
        if (session.getAttribute("loginInfo") == null) {
            return "redirect:/login";
        }
        model.addAttribute("stockNum", stockNum);
        model.addAttribute("productId", productId);
        return "pages-outgoing-detail";
    }

    @PostMapping("detail")
    public String selectOutgoingDetail(HttpSession session,
                                       @ModelAttribute OutgoingDTO outgoingDTO,
                                       @RequestParam("productId") String productId,
                                       Model model) {
        if (session.getAttribute("loginInfo") == null) {
            return "redirect:/login";
        }
        model.addAttribute("productId", productId);
        String userId = (String) session.getAttribute("sessionUserId");
        outgoingDTO.setUserId(userId);
        outgoingDTO.setProductId(productId);

        return "pages-outgoing-confirm";
    }

    @PostMapping("/confirm")
    public String confirmOutgoing(HttpSession session,
                                  @ModelAttribute OutgoingDTO outgoingDTO,
                                  Model model) {
        if (session.getAttribute("loginInfo") == null) {
            return "redirect:/login";
        }
        model.addAttribute("outgoingDTO", outgoingDTO);
        return "pages-outgoing-confirm";
    }

    @PostMapping("/submit")
    public String submitOutgoing(HttpSession session,
                                 @ModelAttribute OutgoingDTO outgoingDTO,
                                 Model model) {
        if (session.getAttribute("loginInfo") == null) {
            return "redirect:/login";
        }
        String userId = (String) session.getAttribute("sessionUserId");
        outgoingDTO.setUserId(userId);
        outgoingService.requestOutgoing(outgoingDTO);
        return "redirect:/dashboard/user";
    }

    @GetMapping("/approve")
    public String approveOutgoing(HttpSession session, Model model) {
        if (session.getAttribute("loginInfo") == null) {
            return "redirect:/login";
        }
        String adminId = (String) session.getAttribute("sessionAdminId");
        String role = incomingService.getAdminRoleById(adminId);
        List<OutgoingDTO> outgoingList = outgoingService.getOutgoingByRole(adminId, role);

        model.addAttribute("outgoingList", outgoingList);
        return "pages-outgoing-approve";
    }

    @PostMapping("/approve")
    public String approveOutgoing(HttpSession session,
                                  @RequestParam("outgoingNum") int outgoingNum) {
        if (session.getAttribute("loginInfo") == null) {
            return "redirect:/login";
        }
        String adminId = (String) session.getAttribute("sessionAdminId");
        String role = incomingService.getAdminRoleById(adminId);
        outgoingService.approveOutgoing(adminId, outgoingNum, role);

        return "redirect:/outgoing/approve";
    }
}
