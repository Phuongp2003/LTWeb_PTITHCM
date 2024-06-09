package ptithcm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/manage")
public class AdminController {
    @RequestMapping("/dashboard")
    public String dashboard(ModelMap model) {
        return "pages/admin/dashboard";
    }
}
