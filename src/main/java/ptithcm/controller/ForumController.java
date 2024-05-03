package ptithcm.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import ptithcm.bean.Post;

@Controller
@RequestMapping("/forum")
public class ForumController {
    List<Post> post = new ArrayList<Post>();

    @RequestMapping("")
    public String forum(Model model) {
        model.addAttribute("title", "PTITHCM Forum");
        model.addAttribute("type", "forum");
        model.addAttribute("user_id", "001");
        model.addAttribute("user_name", "Test User");
        post.clear();
        for (int i = 0; i < 5; i++) {
            post.add(new Post("00" + i,
                    "Title " + i,
                    "Content " + i
                            + " is the content of that post.                   It long, very long.                     It have a large of words.",
                    "Description of post " + i,
                    "Author " + i,"Employee " + i));
        }

        model.addAttribute("posts", post);
        return "forum";
    }

    Post postTest;

    @RequestMapping(value = "post/{id}")
    public String post(Model model, @PathVariable("id") String id) {
        model.addAttribute("title", "PTITHCM Forum");
        model.addAttribute("type", "forum");
        for (Post i : post) {
            if (i.getId().equals(id)) {
                postTest = i;
                break;
            }
        }

        model.addAttribute("post", postTest);
        return "post";
    }
}
