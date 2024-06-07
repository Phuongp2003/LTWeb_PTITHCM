package ptithcm.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import ptithcm.bean.Customer;
import ptithcm.bean.Employee;
import ptithcm.bean.Post;
import ptithcm.service.ListPostService;
import ptithcm.util.PostHelper;
import ptithcm.service.AccountService;

@Controller
@RequestMapping("/manage")
public class ManageControler {
    PostHelper postHelper = new PostHelper();
    @Autowired
    private ListPostService postServices;

    @Autowired
    private AccountService accountService;

    @RequestMapping("posts")
    public String manage(Model model, @CookieValue(value = "uid", defaultValue = "") String uid) {
        if (!uid.equals("") && accountService.getAccountByID(Integer.parseInt(uid)) != null) {
            Customer user = accountService.getAccountByID(Integer.parseInt(uid)).getAccount_customer();
            model.addAttribute("user_id", Integer.parseInt(uid));
            model.addAttribute("user_name", user.getHO() + " " + user.getTEN());
        }

        model.addAttribute("title", "PTITHCM manage");
        model.addAttribute("type", "forum");
        model.addAttribute("owner", true);
        List<Post> post = postServices.getPostsNeedApprove();
        model.addAttribute("posts", post);
        return "pages/manage/post_list";
    }

    @RequestMapping("posts/{id}")
    public String preview(Model model, @CookieValue(value = "uid", defaultValue = "") String uid,
            @PathVariable("id") int id) {
        if (!uid.equals("") && accountService.getAccountByID(Integer.parseInt(uid)) != null) {
            Customer user = accountService.getAccountByID(Integer.parseInt(uid)).getAccount_customer();
            model.addAttribute("user_id", Integer.parseInt(uid));
            model.addAttribute("user_name", user.getHO() + " " + user.getTEN());
        }

        model.addAttribute("title", "PTITHCM manage");
        model.addAttribute("type", "forum");
        model.addAttribute("owner", true);
        model.addAttribute("previewMode", true);

        Post post = postServices.getPostByID(id);
        model.addAttribute("post", post);
        return "pages/manage/post_preview";
    }

    @RequestMapping("posts/{id}/approve")
    public String approve(Model model, @CookieValue(value = "uid", defaultValue = "") String uid,
            @PathVariable("id") int id) {
        Employee user;
        if (uid.equals("") && accountService.getAccountByID(Integer.parseInt(uid)) == null) {
            model.addAttribute("title", "Request permission");
            model.addAttribute("type", "forum");
            model.addAttribute("message", "You login to account have permission to approve post");
            return "pages/post/post_action";
        }
        user = accountService.getAccountByID(Integer.parseInt(uid)).getAccount_employee();
        if (user == null) {
            model.addAttribute("title", "Request permission");
            model.addAttribute("type", "forum");
            model.addAttribute("message", "You don't have permission to approve post");
            return "pages/post/post_action";
        }

        model.addAttribute("user_id", Integer.parseInt(uid));
        model.addAttribute("user_name", user.getHO() + " " + user.getTEN());
        model.addAttribute("title", "PTITHCM manage");
        model.addAttribute("type", "forum");
        model.addAttribute("owner", true);

        Post post = postServices.getPostByID(id);
        post.setPost_employee(user);

        postServices.editPost(post);
        model.addAttribute("post", post);
        model.addAttribute("message", "Post approved successfully!");
        return "pages/post/post_action";
    }

    @RequestMapping(value = "posts/{id}/reject", method = RequestMethod.POST)
    public String reject(Model model, @CookieValue(value = "uid", defaultValue = "") String uid,
            @PathVariable("id") int id, @RequestParam("rejectReason") String rejectReason) {
        Employee user;
        if (uid.equals("") && accountService.getAccountByID(Integer.parseInt(uid)) == null) {
            model.addAttribute("title", "Request permission");
            model.addAttribute("type", "forum");
            model.addAttribute("message", "You login to account have permission to reject post");
            return "pages/post/post_action";
        }
        user = accountService.getAccountByID(Integer.parseInt(uid)).getAccount_employee();
        if (user == null) {
            model.addAttribute("title", "Request permission");
            model.addAttribute("type", "forum");
            model.addAttribute("message", "You don't have permission to reject post");
            return "pages/post/post_action";
        }

        model.addAttribute("user_id", Integer.parseInt(uid));
        model.addAttribute("user_name", user.getHO() + " " + user.getTEN());
        model.addAttribute("title", "PTITHCM manage");
        model.addAttribute("type", "forum");
        model.addAttribute("owner", true);

        Post post = postServices.getPostByID(id);
        post.setPost_employee(user);
        post.setRejectReason(rejectReason);

        postServices.editPost(post);
        model.addAttribute("post", post);
        model.addAttribute("message", "Post rejected successfully!");
        return "pages/post/post_action";
    }
}
