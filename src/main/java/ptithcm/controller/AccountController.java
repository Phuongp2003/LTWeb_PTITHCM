package ptithcm.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import ptithcm.bean.Account;
import ptithcm.bean.Customer;
import ptithcm.bean.Employee;
import ptithcm.bean.RegistrationForm;
import ptithcm.service.AccountService;
import ptithcm.service.CustomerService;

@Controller
@RequestMapping("/user/")
public class AccountController {
    @Autowired
    AccountService accountService;

    @Autowired
    CustomerService customerService;

    @RequestMapping("/login")
    public String handleLogin(ModelMap model, @CookieValue(value = "uid", defaultValue = "") String uid) {
        // Check if user is already logged in
        String isLogin = accountService.isLogin(model, uid, accountService);
        if (isLogin != "") {
            return isLogin;
        }

        Account account = new Account();
        model.addAttribute("account", account);
        return "pages/user/login";
    }

    @RequestMapping(value = "login-success", method = RequestMethod.POST)
    public String checkLogin(@RequestParam("USERNAME") String username, @RequestParam("PASSWORD") String password,
            ModelMap model,
            HttpServletResponse response) {
        try {
            Account account = accountService.getAccountByUsername(username);
            if (account != null) {
                if (accountService.checkLogin(username, password)) {
                    String role = account.getAccount_employee() != null ? "employee" : "customer";
                    Cookie cookie = new Cookie("uid", account.getID().toString());
                    Cookie cookie2 = new Cookie("role", role);
                    cookie.setMaxAge(60 * 60 * 24);
                    cookie2.setMaxAge(60 * 60 * 24);
                    cookie.setPath("/");
                    cookie2.setPath("/");
                    response.addCookie(cookie);
                    response.addCookie(cookie2);
                } else {
                    model.addAttribute("message", "Login failed! Password is incorrect!");
                }
            } else {
                model.addAttribute("message", "Login failed! Username is incorrect!");
            }
        } catch (Exception e) {
            model.addAttribute("message", "Login failed! Error: " + e);
            return "redirect:/user/login.htm";
        }
        return "redirect:/home.htm";
    }

    @RequestMapping("/register")
    public String handleRegister(ModelMap model, @CookieValue(value = "uid", defaultValue = "") String uid) {
        // Check if user is already logged in
        String isLogin = accountService.isLogin(model, uid, accountService);
        if (isLogin != "") {
            return isLogin;
        }
        RegistrationForm registrationForm = new RegistrationForm();
        model.addAttribute("registrationForm", registrationForm);
        return "pages/user/register";
    }

    @RequestMapping(value = "register-success", method = RequestMethod.POST)
    public String register(@RequestParam("USERNAME") String username, @RequestParam("PASSWORD") String password,
            @RequestParam("HO") String ho, @RequestParam("TEN") String ten, @RequestParam("EMAIL") String email,
            @RequestParam("SDT") String phone,
            @RequestParam("GIOITINH") String gioitinh, @RequestParam("NGAYSINH") String ngaysinh, ModelMap model) {
        Account account = new Account();
        try {
            if (!accountService.isUnregistedEmail(email)) {
                throw new Exception("Email is already registered!");
            }

            account.setUSERNAME(username);
            account.setPASSWORD(password);
            Boolean gt = Boolean.parseBoolean(gioitinh);
            SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
            Date ns = dateFormat.parse(ngaysinh);
            customerService.insertCustomer(new Customer(ho, ten, email, phone, gt, ns));
            account.setAccount_customer(customerService.getCustomerByEmail(email));
            account.setAccount_employee(null);

            if (accountService.insertAccount(account) == 1) {
                model.addAttribute("message", "Register successfully!");
            } else {
                model.addAttribute("message", "Register failed!");
            }
        } catch (Exception e) {
            model.addAttribute("message", "Register failed! Error: " + e);
            account.setAccount_customer(customerService.getCustomerByEmail(email));
            System.out.println(e);
            return "redirect:/user/register.htm";
        }
        return "redirect:/home.htm";
    }

    @RequestMapping("/logout")
    public String logout(ModelMap model, HttpServletResponse response) {
        Cookie cookie = new Cookie("uid", "");
        Cookie cookie2 = new Cookie("role", "");
        cookie.setMaxAge(0);
        cookie2.setMaxAge(0);
        cookie.setPath("/");
        cookie2.setPath("/");
        response.addCookie(cookie);
        response.addCookie(cookie2);
        model.addAttribute("message", "Logout successfully!");
        return "pages/home";
    }

}
