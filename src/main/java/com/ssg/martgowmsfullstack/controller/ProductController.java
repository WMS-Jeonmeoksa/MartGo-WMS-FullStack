package com.ssg.martgowmsfullstack.controller;

import com.ssg.martgowmsfullstack.dto.ProductDTO;
import com.ssg.martgowmsfullstack.service.ProductService;
import lombok.RequiredArgsConstructor;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.DuplicateFormatFlagsException;

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

        try {
            productService.registerProduct(productDTO);
            model.addAttribute("product", productDTO);
            return "pages-product-confirm";
        } catch (DuplicateKeyException e) {
            model.addAttribute("errorMessage", "이미 존재하는 제품ID 입니다.");
            model.addAttribute("product", productDTO);
            return "pages-product-register";
        }
    }
}
