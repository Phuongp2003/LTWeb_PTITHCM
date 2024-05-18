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
import ptithcm.util.PostHelper;
import ptithcm.service.CustomerService;

@Controller
@RequestMapping("/forum")
public class ForumController {
    PostHelper postHelper = new PostHelper();
    @Autowired
    private ListPostService postServices;

    @Autowired
    private CustomerService customerService;

    @RequestMapping("")
    public String forum(Model model) {
        model.addAttribute("title", "PTITHCM Forum");
        model.addAttribute("type", "forum");
        model.addAttribute("user_id", 1);
        model.addAttribute("user_name", "Test User");
        List<Post> post = postServices.getAllPosts();
        model.addAttribute("posts", post);
        return "pages/forum/forum";
    }

    @RequestMapping(value = "post/{id}")
    public String post(Model model, @PathVariable("id") Integer id) {
        model.addAttribute("title", "PTITHCM Forum");
        model.addAttribute("type", "forum");
        model.addAttribute("type_2", "post/show");
        Post post;
        post = postServices.getPostByID(id);

        model.addAttribute("post", post);
        return "pages/post/post";
    }

    @RequestMapping(value = "post/{id}/edit-success", method = RequestMethod.POST)
    public String saveEditedPost(
            @PathVariable("id") Integer id,
            @RequestParam("title") String title,
            @RequestParam("description") String description,
            @RequestParam("content") String content,
            Model model) {
        Post oPost = postServices.getPostByID(id);
        Post post = new Post(id, title, content, description, oPost.getAuthor(), null);
        postServices.editPost(post);
        model.addAttribute("title", "PTITHCM Forum");
        model.addAttribute("type", "forum");
        model.addAttribute("user_id", 1);
        model.addAttribute("user_name", "Test User");
        model.addAttribute("success", 200);
        model.addAttribute("message", "Update post success");
        return "pages/post/post_action";
    }

    @RequestMapping(value = "create-post")
    public String createPost(Model model) {
        model.addAttribute("title", "PTITHCM Forum");
        model.addAttribute("type", "forum");
        model.addAttribute("type_2", "post/edit");
        model.addAttribute("user_id", 1);
        model.addAttribute("user_name", "Test User");
        Post post = new Post();
        model.addAttribute("post", post);
        return "pages/post/createpost";
    }

    @RequestMapping(value = "post/{id}/edit")
    public String editPost(Model model, @PathVariable("id") Integer id) {
        model.addAttribute("title", "PTITHCM Forum");
        model.addAttribute("type", "forum");
        model.addAttribute("type_2", "post/edit");
        model.addAttribute("user_id", 1);
        model.addAttribute("user_name", "Test User");
        Post post;
        post = postServices.getPostByID(id);

        model.addAttribute("post", post);
        return "pages/post/editpost";
    }

    @RequestMapping(value = "create-success", method = RequestMethod.POST)
    public String saveNewPost(@RequestParam("title") String title,
            @RequestParam("description") String description,
            @RequestParam("content") String content,
            Model model) {
        Customer user = new Customer();
        List<Customer> users = customerService.getAllCustomers();
        System.out.println("User" + users);
        for (Customer customer : users) {
            if (customer.getMAKH() == 1) {
                user = customer;
                break;
            }
        }
        Post post = new Post(34, title, content, description, user, null);
        postServices.createPost(post);
        model.addAttribute("title", "PTITHCM Forum");
        model.addAttribute("type", "forum");
        model.addAttribute("user_id", 1);
        model.addAttribute("user_name", "Test User");
        model.addAttribute("success", 200);
        model.addAttribute("message", "Create post success");
        return "pages/post/post_action";
    }

    @RequestMapping(value = "post/{id}/remove")
    public String removePost(Model model, @PathVariable("id") Integer id) {
        model.addAttribute("title", "PTITHCM Forum");
        model.addAttribute("type", "forum");
        model.addAttribute("user_id", 1);
        model.addAttribute("user_name", "Test User");
        Post post;
        post = postServices.getPostByID(id);

        postServices.removePost(post);
        model.addAttribute("title", "PTITHCM Forum");
        model.addAttribute("type", "forum");
        model.addAttribute("user_id", 1);
        model.addAttribute("user_name", "Test User");
        model.addAttribute("success", 200);
        model.addAttribute("message", "Delete post success");
        return "pages/post/post_action";
    }
}
