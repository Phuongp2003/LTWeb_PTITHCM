package ptithcm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController {

    @RequestMapping("/home")
    public String home(Model model) {
        model.addAttribute("title", "PTITHCM Book Shop");
        model.addAttribute("type", "home");
        System.out.println("Home page");
        return "home";
    }

    @RequestMapping("/error")
    public String error(Model model) {
        model.addAttribute("title", "Error");
        return "error";
    }
}
