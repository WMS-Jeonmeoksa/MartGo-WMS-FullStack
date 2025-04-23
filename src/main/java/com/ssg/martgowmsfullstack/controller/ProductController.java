package com.ssg.martgowmsfullstack.controller;

import com.ssg.martgowmsfullstack.dto.ProductDTO;
import com.ssg.martgowmsfullstack.service.ProductService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
@RequiredArgsConstructor
@RequestMapping("/product")
public class ProductController {

    private final ProductService productService;

    @GetMapping("/register")
    public String showProductRegister(HttpSession session) {
        if (session.getAttribute("loginInfo") == null) {
            return "redirect:/login";
        }
        return "pages-product-register";
    }

    @PostMapping("/register")
    public String submitProductRegister(HttpSession session,
                                        @ModelAttribute ProductDTO productDTO,
                                        Model model) {
        if (session.getAttribute("loginInfo") == null) {
            return "redirect:/login";
        }
        String userId = (String) session.getAttribute("sessionUserId");
        productDTO.setUserId(userId);
        productService.registerProduct(productDTO);

        model.addAttribute("product", productDTO);
        return "pages-product-confirm";
    }
}
