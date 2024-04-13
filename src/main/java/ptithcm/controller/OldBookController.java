package ptithcm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class OldBookController {
    @RequestMapping("/oldbook")
    public String oldbook(Model model) {
        model.addAttribute("Title", "Old Book");
        return "oldbook";
    }
}
