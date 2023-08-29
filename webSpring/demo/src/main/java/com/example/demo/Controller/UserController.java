package com.example.demo.Controller;

import com.example.demo.Entity.User;
import com.example.demo.Service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
@RequiredArgsConstructor

public class UserController {

    private final UserService userService;

    @GetMapping("/registration")
    public String registration(){
        return "registration";
    }

    @GetMapping("/profile/{email}")
    public String profile (Model model, @PathVariable String email) {
        model.addAttribute(userService.getUserByEmail(email));
        return "profile";}

    @GetMapping("/login")
    public String login (){
        return "login";
    }

    @PostMapping("/registration")
    public String createUser(User user, Model model){
        if (!userService.createUser(user)){
            model.addAttribute("Error message", "User with email: " + user.getEmail()
            + "is excisting");
            return "registration";
        }
        return "redirect:/login";
    }


    @GetMapping("/hello")
    public String securityUrl(){
        return "hello";
    }

}
