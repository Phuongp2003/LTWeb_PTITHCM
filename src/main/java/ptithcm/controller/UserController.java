package ptithcm.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import ptithcm.bean.Account;
import ptithcm.bean.Customer;
import ptithcm.bean.Employee;
import ptithcm.bean.Post;
import ptithcm.service.AccountService;
import ptithcm.service.ListPostService;

@Controller
@RequestMapping("user")
public class UserController {
    @Autowired
    private ListPostService postServices;

    @Autowired
    private AccountService accountService;

    @RequestMapping("{uid}")
    public String user(Model model, @PathVariable("uid") Integer uid) {
        Account account = accountService.getAccountByID(uid);
        Customer customer = account.getAccount_customer();
        Employee employee = account.getAccount_employee();

        String username = employee != null ? employee.getHO() + " " + employee.getTEN()
                : customer.getHO() + " " + customer.getTEN();

        model.addAttribute("title", username + " profile");
        model.addAttribute("type", "user");
        model.addAttribute("user_id", uid);
        model.addAttribute("user_name", username);
        model.addAttribute("user_type", employee != null ? "employee" : "customer");
        model.addAttribute("account", account);
        model.addAttribute("model", employee != null ? employee : customer);
        return "pages/user/dashboard";
    }

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
