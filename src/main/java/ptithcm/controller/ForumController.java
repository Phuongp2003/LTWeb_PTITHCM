package ptithcm.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import ptithcm.bean.Post;

@Controller
public class ForumController {
    List<Post> post = new ArrayList<Post>();

    @RequestMapping("/forum")
    public String forum(Model model) {
        model.addAttribute("title", "Forum");
        model.addAttribute("type", "forum");
        model.addAttribute("user_id", "001");
        model.addAttribute("user_name", "Test User");
        post.clear();
        for (int i = 0; i < 5; i++) {
            post.add(new Post("00" + i, "Title " + i, "Content " + i, "Author " + i));
        }

        model.addAttribute("posts", post);
        return "forum";
    }

}
