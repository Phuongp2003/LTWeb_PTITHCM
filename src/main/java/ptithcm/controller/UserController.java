package ptithcm.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import ptithcm.bean.Post;
import ptithcm.service.ListPostService;

@Controller
@RequestMapping("user")
public class UserController {
    @Autowired
    private ListPostService postServices;

    @RequestMapping("{uid}/posts")
    public String forum(Model model, @PathVariable("uid") Integer uid) {
        model.addAttribute("title", "PTITHCM Forum");
        model.addAttribute("type", "forum");
        model.addAttribute("user_id", 1);
        model.addAttribute("user_name", "Test User");
        List<Post> post = postServices.getPostsByUserIDP(uid);

        model.addAttribute("posts", post);
        return "pages/post/userpost";
    }
}
