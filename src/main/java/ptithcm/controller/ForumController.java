package ptithcm.controller;

import java.util.List;

import javax.persistence.criteria.CriteriaBuilder.In;
import javax.swing.text.html.FormSubmitEvent.MethodType;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import ptithcm.bean.Comment;
import ptithcm.bean.Customer;
import ptithcm.bean.Employee;
import ptithcm.bean.Post;
import ptithcm.service.ListPostService;
import ptithcm.util.PostHelper;
import ptithcm.service.AccountService;
import ptithcm.service.CommentService;
import ptithcm.service.CustomerService;

@Controller
@RequestMapping("/forum")
public class ForumController {
    PostHelper postHelper = new PostHelper();
    @Autowired
    private ListPostService postServices;

    @Autowired
    private AccountService accountService;

    @RequestMapping("")
    public String forum(Model model, @CookieValue(value = "uid", defaultValue = "") String uid) {
        if (!uid.equals("") && accountService.getAccountByID(Integer.parseInt(uid)) != null) {
            Customer user = accountService.getAccountByID(Integer.parseInt(uid)).getAccount_customer();
            model.addAttribute("user_id", Integer.parseInt(uid));
            model.addAttribute("user_name", user.getHO() + " " + user.getTEN());
        }

        model.addAttribute("title", "PTITHCM Forum");
        model.addAttribute("type", "forum");
        model.addAttribute("owner", true);
        List<Post> post = postServices.getPostsApproved();
        model.addAttribute("posts", post);
        return "pages/forum/forum";
    }

    @RequestMapping(value = "post/{id}")
    public String post(Model model, @PathVariable("id") Integer id,
            @CookieValue(value = "uid", defaultValue = "") String uid) {
        if (!uid.equals("") && accountService.getAccountByID(Integer.parseInt(uid)) != null) {
            Customer user = accountService.getAccountByID(Integer.parseInt(uid)).getAccount_customer();
            model.addAttribute("user_id", Integer.parseInt(uid));
            model.addAttribute("user_name", user.getHO() + " " + user.getTEN());
        }
        Post post;
        post = postServices.getPostByID(id);
        model.addAttribute("title", "PTITHCM Forum");
        model.addAttribute("type", "forum");
        model.addAttribute("type_2", "post/show");

        List<Comment> comments = commentService.getCommentsByIDPost(id);
        Comment cmt = new Comment();
        model.addAttribute("post", post);
        model.addAttribute("comments", comments);
        model.addAttribute("comment", cmt);
        return "pages/post/post";
    }

    @RequestMapping(value = "post/{id}/edit-success", method = RequestMethod.POST)
    public String saveEditedPost(
            @PathVariable("id") Integer id,
            @RequestParam("title") String title,
            @RequestParam("description") String description,
            @RequestParam("content") String content,
            Model model, @CookieValue(value = "uid", defaultValue = "") String uid,
            @CookieValue(value = "role", defaultValue = "") String role,
            BindingResult errors) {
        // if(title.trim().length() == 0){
        //     errors.rejectValue("title", "post", "Vui lòng nhập tiêu đề !");
        // }
        // if(description.trim().length() == 0){
        //     errors.rejectValue("description", "post", "Vui lòng nhập mô tả !");
        // }
        // if(content.trim().length() == 0){
        //     errors.rejectValue("content", "post", "Vui lòng nhập nội dung !");
        // }
        // if(errors.hasErrors()){
        //     model.addAttribute("message", -1);
        //     return "pages/post/editpost";
        // }
        Post oPost = postServices.getPostByID(id);
        Post post = new Post(id, title, content, description, oPost.getAuthor(), null);
        Employee employee;
        if (role.equals("employee")) {
            employee = accountService.getAccountByID(Integer.parseInt(uid)).getAccount_employee();
            post.setPost_employee(employee);
        }
        postServices.editPost(post);
        Customer user = accountService.getAccountByID(Integer.parseInt(uid)).getAccount_customer();

        model.addAttribute("title", "PTITHCM Forum");
        model.addAttribute("type", "forum");
        model.addAttribute("user_id", Integer.parseInt(uid));
        model.addAttribute("user_name", user.getHO() + " " + user.getTEN());

        model.addAttribute("success", 200);
        model.addAttribute("message", "Update post success");
        return "pages/post/post_action";
    }

    @RequestMapping(value = "create-post")
    public String createPost(Model model, @CookieValue(value = "uid", defaultValue = "") String uid,
            @CookieValue(value = "role", defaultValue = "") String role) {
        if (uid.equals("") || accountService.getAccountByID(Integer.parseInt(uid)) == null) {
            model.addAttribute("title", "Tạo bài viết");
            model.addAttribute("type", "forum");
            model.addAttribute("type_2", "post/edit");
            model.addAttribute("error", 401);
            model.addAttribute("message", "You must login to create post");
            return "pages/post/post_action";
        }
        model.addAttribute("title", "PTITHCM Forum");
        model.addAttribute("type", "forum");
        model.addAttribute("type_2", "post/edit");
        model.addAttribute("user_id", Integer.parseInt(uid));

        String username = "";
        if (role.equals("employee")) {
            username = accountService.getAccountByID(Integer.parseInt(uid)).getAccount_employee().getHO() + " "
                    + accountService.getAccountByID(Integer.parseInt(uid)).getAccount_employee().getTEN();
        } else {
            username = accountService.getAccountByID(Integer.parseInt(uid)).getAccount_customer().getHO() + " "
                    + accountService.getAccountByID(Integer.parseInt(uid)).getAccount_customer().getTEN();
        }

        model.addAttribute("user_name", username);
        Post post = new Post();
        model.addAttribute("post", post);
        return "pages/post/createpost";
    }

    @RequestMapping(value = "post/{id}/edit")
    public String editPost(Model model, @PathVariable("id") Integer id,
            @CookieValue(value = "uid", defaultValue = "") String uid,
            @CookieValue(value = "role", defaultValue = "") String role) {
        model.addAttribute("title", "Chỉnh sửa bài viết " + id);
        if (uid.equals("") || accountService.getAccountByID(Integer.parseInt(uid)) == null) {
            model.addAttribute("type", "forum");
            model.addAttribute("type_2", "post/edit");
            model.addAttribute("owner", true);
            model.addAttribute("error", 401);
            model.addAttribute("message", "You must login to edit post");
            return "pages/post/post_action";
        }
        Post post;
        post = postServices.getPostByID(id);
        Customer user = accountService.getAccountByID(Integer.parseInt(uid)).getAccount_customer();
        if (post.getAuthor().getMAKH() != user.getMAKH()) {
            model.addAttribute("type", "forum");
            model.addAttribute("type_2", "post/edit");
            model.addAttribute("error", 401);
            model.addAttribute("message", "You don't have permission to edit this post");
            return "pages/error";
        }
        model.addAttribute("type", "forum");
        model.addAttribute("type_2", "post/edit");
        model.addAttribute("user_id", Integer.parseInt(uid));
        model.addAttribute("user_name", user.getHO() + " " + user.getTEN());

        model.addAttribute("post", post);
        return "pages/post/editpost";
    }

    @RequestMapping(value = "create-success", method = RequestMethod.POST)
    public String saveNewPost(@RequestParam("title") String title,
            @RequestParam("description") String description,
            @RequestParam("content") String content,
            Model model,
            @CookieValue(value = "uid", defaultValue = "") String uid,
            @CookieValue(value = "role", defaultValue = "") String role, 
            BindingResult errors) {
        // if(title.trim().length() == 0){
        //     errors.rejectValue("title", "post", "Vui lòng nhập tiêu đề !");
        // }
        // if(description.trim().length() == 0){
        //     errors.rejectValue("description", "post", "Vui lòng nhập mô tả !");
        // }
        // if(content.trim().length() == 0){
        //     errors.rejectValue("content", "post", "Vui lòng nhập nội dung !");
        // }
        // if(errors.hasErrors()){
        //     model.addAttribute("errorMessage", -1);
        //     return "pages/post/createpost";
        // }
        Customer user = accountService.getAccountByID(Integer.parseInt(uid)).getAccount_customer();
        Employee employee;
        Post post;
        if (role.equals("employee")) {
            employee = accountService.getAccountByID(Integer.parseInt(uid)).getAccount_employee();
            post = new Post(34, title, content, description, user, employee);
        } else {
            post = new Post(34, title, content, description, user, null);
        }

        postServices.createPost(post);
        model.addAttribute("title", "PTITHCM Forum");
        model.addAttribute("type", "forum");
        model.addAttribute("user_id", Integer.parseInt(uid));
        model.addAttribute("user_name", user.getHO() + " " + user.getTEN());
        model.addAttribute("success", 200);
        model.addAttribute("message", "Create post success");
        return "pages/post/post_action";
    }

    @RequestMapping(value = "post/{id}/remove")
    public String removePost(Model model, @PathVariable("id") Integer id,
            @CookieValue(value = "uid", defaultValue = "") String uid,
            @CookieValue(value = "role", defaultValue = "") String role) {
        model.addAttribute("title", "Xóa bài viết " + id);
        if (uid.equals("") || accountService.getAccountByID(Integer.parseInt(uid)) == null) {
            model.addAttribute("type", "forum");
            model.addAttribute("type_2", "post/edit");
            model.addAttribute("error", 401);
            model.addAttribute("message", "You must login to delete post");
            return "pages/post/post_action";
        }

        Post post;
        post = postServices.getPostByID(id);
        if (post.getAuthor().getMAKH() != accountService.getAccountByID(Integer.parseInt(uid)).getAccount_customer()
                .getMAKH()) {
            model.addAttribute("type", "forum");
            model.addAttribute("type_2", "post/edit");
            model.addAttribute("error", 401);
            model.addAttribute("message", "You don't have permission to remove this post");
            return "pages/error";
        }

        Customer user = accountService.getAccountByID(Integer.parseInt(uid)).getAccount_customer();

        postServices.removePost(post);
        model.addAttribute("type", "forum");
        model.addAttribute("user_id", Integer.parseInt(uid));
        model.addAttribute("user_name", user.getHO() + " " + user.getTEN());
        model.addAttribute("success", 200);
        model.addAttribute("message", "Delete post success");
        return "pages/post/post_action";
    }

    @Autowired
    private CommentService commentService;

    @RequestMapping(value = "post/{id}/comment/create-success", method = RequestMethod.POST)
    public String saveNewComment(
            @RequestParam("content") String content,
            @PathVariable("id") Integer id,
            Model model,
            @CookieValue(value = "uid", defaultValue = "") String uid,
            @CookieValue(value = "role", defaultValue = "") String role) {
        Customer user = accountService.getAccountByID(Integer.parseInt(uid)).getAccount_customer();
        Employee employee;
        Comment comment = new Comment(content, postServices.getPostByID(id),
                accountService.getAccountByID(Integer.parseInt(uid)));

        commentService.createComment(comment);
        model.addAttribute("title", "PTITHCM Forum");
        model.addAttribute("type", "forum");
        model.addAttribute("user_id", Integer.parseInt(uid));
        model.addAttribute("user_name", user.getHO() + " " + user.getTEN());
        model.addAttribute("success", 200);
        model.addAttribute("message", "Đăng bình luận thành công");
        model.addAttribute("comment", comment);
        return "pages/post/post_action";
        }
    @RequestMapping(value = "post/{id}/comment/{cid}/edit-comment")
    public String createComment(Model model, @CookieValue(value = "uid", defaultValue = "") String uid,
            @PathVariable("id") Integer id,
            @PathVariable("cid") Integer cid,
            @CookieValue(value = "role", defaultValue = "") String role) {
        Post post;
        post = postServices.getPostByID(id);
        model.addAttribute("title", "PTITHCM Forum");
        model.addAttribute("type", "forum");
        model.addAttribute("type_2", "post/show");

        List<Comment> comments = commentService.getCommentsByIDPost(id);
        Comment cmt = commentService.getCommentByID(cid);
        model.addAttribute("post", post);
        model.addAttribute("comments", comments);
        model.addAttribute("comment", cmt);
        return "pages/post/post";
    }

    @RequestMapping(value = "post/{id}/comment/{cid}/edit-success", method = RequestMethod.POST)
    public String saveEditedComment(
            @RequestParam("content") String content,
            @PathVariable("id") Integer id,
            @PathVariable("cid") Integer cid,
            Model model,
            @CookieValue(value = "uid", defaultValue = "") String uid,
            @CookieValue(value = "role", defaultValue = "") String role) {
        Customer user = accountService.getAccountByID(Integer.parseInt(uid)).getAccount_customer();
        Employee employee;
        Comment cmt = commentService.getCommentByID(cid);
        cmt.setContent(content);

        commentService.editComment(cmt);
        model.addAttribute("title", "PTITHCM Forum");
        model.addAttribute("type", "forum");
        model.addAttribute("user_id", Integer.parseInt(uid));
        model.addAttribute("user_name", user.getHO() + " " + user.getTEN());
        model.addAttribute("success", 200);
        model.addAttribute("message", "Chỉnh sửa thành công");
        model.addAttribute("comment", cmt);
        return "pages/post/post_action";
        }
}
