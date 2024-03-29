package ru.example.test.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import ru.example.test.domain.User;
import ru.example.test.service.UserService;

import java.util.Map;

@Controller
public class RegistrationController {
    @Autowired
    private UserService userService;
    @GetMapping("/registration")
    public String registration(){
        return "registration";
    }

    @PostMapping("/registration")
    public String addUser(User user, Map<String, Object> model){
        if(!userService.addUser(user)){
            model.put("message", "User exits!");
            return "registration";
        }
        return "redirect:/login";
    }

    @GetMapping("/activate/{code}")
    public String activate(Model model, @PathVariable String code){
       boolean isActivated = userService.activateUser(code);

       if(isActivated){
           model.addAttribute("message", "User successfully activate");
       }else {
           model.addAttribute("message", "Activation code in not found");
       }

        return "login";
    }
}
