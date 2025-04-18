package com.ssg.martgowmsfullstack.controller;

import com.ssg.martgowmsfullstack.domain.UserVO;
import com.ssg.martgowmsfullstack.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class AuthController {
    @Autowired
    private UserService userService;

    @GetMapping("/login")
    public String loginForm(){
        return "login"; //login.jsp
    }
    @PostMapping("/login")
    public String login(UserVO user, Model model){
        boolean success = userService.login(user);
        if(success){
            return "redirect:/dashboard";
        }else {
            model.addAttribute("error", "로그인실패");
            return "login";
        }

    }

    @GetMapping("/register")
    public String registerForm(){
        return "register"; //login.jsp
    }
    @PostMapping("/register")
    public String register(UserVO user, Model model){
        userService.register(user);
        return "redirect:/login"; //회원가입 후 로그인화면으로

    }



}
