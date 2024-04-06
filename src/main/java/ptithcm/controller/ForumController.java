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

        for (int i = 0; i < 5; i++) {
            Post p = new Post();
            p.setId("00" + i);
            p.setTitle("Title " + i);
            p.setContent("Content " + i);
            p.setAuthor("Author " + i);
            post.add(p);
        }

        model.addAttribute("posts", post);
        post.clear();
        return "forum";
    }

}
