package ptithcm.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import ptithcm.bean.Customer;
import ptithcm.bean.Post;
import ptithcm.service.ListPostService;
import ptithcm.service.PostService;

@Controller
@RequestMapping("/forum")
public class ForumController {
    @Autowired
    private ListPostService postServices;

    @Autowired
    private PostService postService;

    @RequestMapping("")
    public String forum(Model model) {
        model.addAttribute("title", "PTITHCM Forum");
        model.addAttribute("type", "forum");
        model.addAttribute("user_id", "001");
        model.addAttribute("user_name", "Test User");
        List<Post> post = postServices.getAllPosts();

        model.addAttribute("posts", post);
        return "forum";
    }

    @RequestMapping(value = "post/{id}")
    public String post(Model model, @PathVariable("id") Integer id) {
        model.addAttribute("title", "PTITHCM Forum");
        model.addAttribute("type", "forum");
        Post post;
        post = postServices.getPostByID(id);

        model.addAttribute("post", post);
        return "post";
    }

    @RequestMapping(value = "post/{id}/edit")
    public String editPost(Model model, @PathVariable("id") Integer id) {
        model.addAttribute("title", "PTITHCM Forum");
        model.addAttribute("type", "forum");
        model.addAttribute("user_id", "001");
        model.addAttribute("user_name", "Test User");
        Post post;
        post = postServices.getPostByID(id);

        model.addAttribute("post", post);
        return "editPost";
    }

    @RequestMapping(value = "create-post")
    public String createPost(Model model) {
        model.addAttribute("title", "PTITHCM Forum");
        model.addAttribute("type", "forum");
        model.addAttribute("user_id", "001");
        model.addAttribute("user_name", "Test User");
        Post post = new Post();
        model.addAttribute("post", post);
        return "createpost";
    }

    @RequestMapping(value = "create-success", method = RequestMethod.POST)
    public String createPost(@RequestParam("title") String title, @RequestParam("description") String description,
            @RequestParam("content") String content, Model model) {
        System.out.println("Saving...");
        Customer user = new Customer();
        List<Customer> users = postService.getAllCustomers();
        System.out.println("User" + users);
        for (Customer customer : users) {
            if (customer.getMAKH() == 1) {
                user = customer;
                break;
            }
        }
        System.out.println("User" + user);
        Post post = new Post(34, title, content, description, user, null);
        postServices.createPost(post);
        model.addAttribute("title", "PTITHCM Forum");
        return "home";
    }
}
