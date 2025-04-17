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

@Controller
@RequiredArgsConstructor
@RequestMapping("/product")
public class ProductController {

    private final ProductService productService;

    @GetMapping("/register")
    public String register() {
        return "pages-product-register";
    }

    @PostMapping("/register")
    public String registerProduct(@ModelAttribute ProductDTO productDTO, Model model) {
        productService.registerProduct(productDTO);
        model.addAttribute("product", productDTO);
        return "pages-product-confirm";
    }
}
