package ptithcm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import ptithcm.bean.Customer;
import ptithcm.service.AccountService;
import ptithcm.util.PostHelper;

@Controller
@RequestMapping("/comment/")
public class CommentController {
    PostHelper postHelper = new PostHelper();
    @Autowired
    private AccountService accountService;

    @RequestMapping(value = "create-success", method = RequestMethod.POST)
    public String saveNewComment(
            @RequestParam("content") String content,
            Model model,
            @CookieValue(value = "uid", defaultValue = "") String uid,
            @CookieValue(value = "role", defaultValue = "") String role) {
        Customer user = accountService.getAccountByID(Integer.parseInt(uid)).getAccount_customer();
        // commentService.createComment(comment);
        model.addAttribute("title", "PTITHCM Forum");
        model.addAttribute("type", "forum");
        model.addAttribute("user_id", Integer.parseInt(uid));
        model.addAttribute("user_name", user.getHO() + " " + user.getTEN());
        model.addAttribute("success", 200);
        model.addAttribute("message", "Create comment success");
        return "pages/post/post_action";
    }

    
}
