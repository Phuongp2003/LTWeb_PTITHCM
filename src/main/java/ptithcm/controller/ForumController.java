package ptithcm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ForumController {
    @RequestMapping("/forum")
    public String forum() {
        return "forum";
    }

}
