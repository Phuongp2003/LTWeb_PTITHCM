package ptithcm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController {
    @RequestMapping("/to-welcome")
    public String toWelcome() {
        return "redirect:/welcome.htm";
    }
}
