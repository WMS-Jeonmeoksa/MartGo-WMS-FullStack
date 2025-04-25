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

    @GetMapping("/detail")
    public String selectIncomingDetail(HttpSession session,
                                 @RequestParam("productId") String productId,
                                 Model model) {
        if (session.getAttribute("loginInfo") == null) {
            return "redirect:/login";
        }
        model.addAttribute("productId", productId);
        return "pages-incoming-detail";
    }

    @PostMapping("/detail")
    public String selectIncomingDetail(HttpSession session,
                                 @ModelAttribute IncomingDTO incomingDTO) {
        if (session.getAttribute("loginInfo") == null) {
            return "redirect:/login";
        }

        String userId = (String) session.getAttribute("sessionUserId");
        incomingDTO.setUserId(userId);

        return "pages-incoming-confirm";
    }

    @PostMapping("/confirm")
    public String confirmIncoming(HttpSession session,
                                  @ModelAttribute IncomingDTO incomingDTO,
                                  Model model) {
        if (session.getAttribute("loginInfo") == null) {
            return "redirect:/login";
        }
        model.addAttribute("incomingDTO", incomingDTO);
        System.out.println(incomingDTO);
        return "pages-incoming-confirm";
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
        return "redirect:/dashboard/customer";
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

    @GetMapping("/finalization")
    public String showFinalizationList(HttpSession session, Model model) {
        if (session.getAttribute("loginInfo") == null) {
            return "redirect:/login";
        }
        String adminId = (String) session.getAttribute("sessionAdminId");
        String role = incomingService.getAdminRoleById(adminId);
        List<IncomingDTO> incomingList = incomingService.getIncomingByRole(adminId, role);
        model.addAttribute("incomingList", incomingList);

        return "pages-incoming-finalization";
    }

    @PostMapping("/finalization")
    public String finalizationIncoming(HttpSession session,
                                  @RequestParam("incomingNum") int incomingNum) {
        if (session.getAttribute("loginInfo") == null) {
            return "redirect:/login";
        }
        String adminId = (String) session.getAttribute("sessionAdminId");
        String role = incomingService.getAdminRoleById(adminId);
        incomingService.approveIncoming(adminId, incomingNum, role);

        return "redirect:/incoming/finalization";
    }
}
