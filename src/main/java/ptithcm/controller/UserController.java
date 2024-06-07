package ptithcm.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import ptithcm.bean.Account;
import ptithcm.bean.Customer;
import ptithcm.bean.Employee;
import ptithcm.bean.Post;
import ptithcm.service.AccountService;
import ptithcm.service.CustomerService;
import ptithcm.service.EmployeeService;
import ptithcm.service.ListPostService;
import ptithcm.util.DateHelper;

@Controller
@RequestMapping("user")
public class UserController {
    @Autowired
    private ListPostService postServices;

    @Autowired
    private AccountService accountService;

    @Autowired
    private CustomerService customerService;

    @Autowired
    private EmployeeService employeeService;

    @RequestMapping("{uid}")
    public String user(Model model, @PathVariable("uid") Integer uid,
            @CookieValue(value = "uid", defaultValue = "") String cookie_uid) {
        Account account = accountService.getAccountByID(uid);
        Customer customer = account.getAccount_customer();
        Employee employee = account.getAccount_employee();

        String username = employee != null ? employee.getHO() + " " + employee.getTEN()
                : customer.getHO() + " " + customer.getTEN();

        model.addAttribute("title", "Trang cá nhân của " + username);
        model.addAttribute("type", "user");
        model.addAttribute("user_id", uid);
        model.addAttribute("user_name", username);
        model.addAttribute("user_type", employee != null ? "employee" : "customer");
        model.addAttribute("account", account);
        model.addAttribute("birthday", customer.getNGAYSINH());
        model.addAttribute("model", employee != null ? employee : customer);
        if (cookie_uid.equals(uid.toString())) {
            model.addAttribute("title", "Trang cá nhân");
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
            post = postServices.getPostsByUserIDP(
                    accountService.getAccountByID(Integer.parseInt(cookie_uid)).getAccount_customer().getMAKH());
        } else {
            model.addAttribute("user_name", accountService.getAccountByID(uid).getAccount_customer().getHO() + " "
                    + accountService.getAccountByID(uid).getAccount_customer().getTEN());
            model.addAttribute("user_id", uid);
            model.addAttribute("owner", false);
            post = postServices.getPostsByUserIDP(accountService.getAccountByID(uid).getAccount_customer().getMAKH());
        }
        model.addAttribute("title", "Danh sách bài viết");
        model.addAttribute("type", "forum");

        model.addAttribute("posts", post);
        return "pages/post/userpost";
    }

    @RequestMapping(value = "{uid}/edit-info", method = { RequestMethod.GET, RequestMethod.POST })
    public String userChangeInfo(Model model, @PathVariable("uid") Integer uid,
            @CookieValue(value = "uid", defaultValue = "") String cookie_uid,
            @RequestParam(value = "user_name", defaultValue = "") String user_name,
            @RequestParam(value = "user_email", defaultValue = "") String user_email,
            @RequestParam(value = "CCCD", defaultValue = "") String CCCD,
            @RequestParam(value = "GIOITINH", defaultValue = "") String gioitinh,
            @RequestParam(value = "NGAYSINH", defaultValue = "") String ngaysinh) {
        Account account = accountService.getAccountByID(uid);
        Customer customer = account.getAccount_customer();
        Employee employee = account.getAccount_employee();
        String username = employee != null ? employee.getHO() + " " + employee.getTEN()
                : customer.getHO() + " " + customer.getTEN();
        if (!cookie_uid.equals(uid.toString())) {
            model.addAttribute("title", "Trang cá nhân của " + username);
            model.addAttribute("type", "user");
            model.addAttribute("user_id", uid);
            model.addAttribute("user_name", username);
            model.addAttribute("user_type", employee != null ? "employee" : "customer");
            model.addAttribute("account", account);
            model.addAttribute("model", employee != null ? employee : customer);
            model.addAttribute("message", "Đây không phải hồ sơ của bạn!");
            return "redirect:/user/" + uid + ".htm";
        }

        if (!user_name.equals("") && !user_name.equals(username)) {
            String[] nameParts = user_name.split(" ");
            customer.setHO(nameParts[0]);
            customer.setTEN(nameParts[1]);
            employee.setHO(nameParts[0]);
            employee.setTEN(nameParts[1]);
            customerService.updateCustomer(customer);
            employeeService.updateEmployee(employee);
        }

        if (!user_email.equals("") && !user_email.equals(customer.getEMAIL())) {
            customer.setEMAIL(user_email);
            employee.setEMAIL(user_email);
            customerService.updateCustomer(customer);
            employeeService.updateEmployee(employee);
        }

        if (employee != null & !CCCD.equals("") && !CCCD.equals(employee.getCCCD())) {
            employee.setCCCD(CCCD);
            employeeService.updateEmployee(employee);
        }

        if (!gioitinh.equals("")) {
            Boolean gt = gioitinh.equals("Nam") ? true : false;
            if (gt != customer.getGIOITINH()) {
                customer.setGIOITINH(gt);
                employee.setGIOITINH(gt);
                customerService.updateCustomer(customer);
                employeeService.updateEmployee(employee);
            }
        }
        if (!ngaysinh.equals("")) {
            try {
                Date ns = new SimpleDateFormat("yyyy-MM-dd").parse(ngaysinh);
                if (!ns.equals(customer.getNGAYSINH())) {
                    customer.setNGAYSINH(ns);
                    employee.setNGAYSINH(ns);
                    customerService.updateCustomer(customer);
                    employeeService.updateEmployee(employee);
                }
            } catch (ParseException e) {
                e.printStackTrace();
                System.out.println(e);
            }
        }

        model.addAttribute("title", "Trang cá nhân");
        model.addAttribute("type", "user");
        model.addAttribute("user_id", uid);
        model.addAttribute("user_name", username);
        model.addAttribute("user_type", employee != null ? "employee" : "customer");
        model.addAttribute("account", account);
        model.addAttribute("birthday", customer.getNGAYSINH());
        model.addAttribute("model", employee != null ? employee : customer);
        return "pages/user/profile_edit";
    }
}
