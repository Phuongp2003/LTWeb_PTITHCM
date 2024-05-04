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
@RequestMapping("/forum")
public class ForumController {
    @Autowired
    private ListPostService postsList;

    @RequestMapping("")
    public String forum(Model model) {
        model.addAttribute("title", "PTITHCM Forum");
        model.addAttribute("type", "forum");
        model.addAttribute("user_id", "001");
        model.addAttribute("user_name", "Test User");
        List<Post> post = postsList.getAllPosts();
        
        model.addAttribute("posts", post);
        return "forum";
    }

    Post postTest;

    @RequestMapping(value = "post/{id}")
    public String post(Model model, @PathVariable("id") String id) {
        model.addAttribute("title", "PTITHCM Forum");
        model.addAttribute("type", "forum");
        List<Post> post = postsList.getAllPosts();
        for (Post i : post) {
            if (i.getId().equals(id)) {
                postTest = i;
                break;
            }
        }

        model.addAttribute("post", postTest);
        return "post";
    }

    @RequestMapping(value = "post/{id}/edit")
    public String editPost(Model model, @PathVariable("id") String id) {
        model.addAttribute("title", "PTITHCM Forum");
        model.addAttribute("type", "forum");
        model.addAttribute("user_id", "001");
        model.addAttribute("user_name", "Test User");
        List<Post> post = postsList.getAllPosts();
        for (Post i : post) {
            if (i.getId().equals(id)) {
                postTest = i;
                break;
            }
        }

        model.addAttribute("post", postTest);
        return "editPost";
    }

    @RequestMapping(value = "create-post")
    public String createPost(Model model) {
        model.addAttribute("title", "PTITHCM Forum");
        model.addAttribute("type", "forum");
        model.addAttribute("user_id", "001");
        model.addAttribute("user_name", "Test User");
        return "createpost";
    }

}
