package ptithcm.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
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
    public String user(Model model, @PathVariable("uid") Integer uid,
            @CookieValue(value = "uid", defaultValue = "") String cookie_uid) {
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
        if (cookie_uid.equals(uid.toString())) {
            return "pages/user/dashboard";
        }
        return "pages/user/profile";
    }

    @RequestMapping("{uid}/posts")
    public String forum(Model model, @PathVariable("uid") Integer uid,
            @CookieValue(value = "uid", defaultValue = "") String cookie_uid) {
        List<Post> post;
        if (!cookie_uid.equals("") && accountService.getAccountByID(Integer.parseInt(cookie_uid)) != null
                && uid == Integer.parseInt(cookie_uid)) {
            Customer user = accountService.getAccountByID(Integer.parseInt(cookie_uid)).getAccount_customer();
            model.addAttribute("user_id", Integer.parseInt(cookie_uid));
            model.addAttribute("user_name", user.getHO() + " " + user.getTEN());
            model.addAttribute("owner", true);
            post = postServices.getPostsByUserIDP(Integer.parseInt(cookie_uid));
        } else {
            model.addAttribute("user_name", accountService.getAccountByID(uid).getAccount_customer().getHO() + " "
                    + accountService.getAccountByID(uid).getAccount_customer().getTEN());
            model.addAttribute("user_id", uid);
            model.addAttribute("owner", false);
            post = postServices.getPostsByUserIDP(uid);
        }
        model.addAttribute("title", "PTITHCM Forum");
        model.addAttribute("type", "forum");

        model.addAttribute("posts", post);
        return "pages/post/userpost";
    }
}
