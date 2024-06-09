package ptithcm.controller;

import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.ZoneId;
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
import ptithcm.bean.Cart;
import ptithcm.bean.Customer;
import ptithcm.bean.RegistrationForm;
import ptithcm.service.AccountService;
import ptithcm.service.CartService;
import ptithcm.service.CustomerService;
import ptithcm.service.EmailService;

@Controller
@RequestMapping("/user/")
public class AccountController {
    @Autowired
    AccountService accountService;

    @Autowired
    CustomerService customerService;

    @Autowired
    CartService cartService;

    @Autowired(required = false)
    EmailService emailService;

    @RequestMapping("/login")
    public String handleLogin(ModelMap model, @CookieValue(value = "uid", defaultValue = "") String uid) {
        model.addAttribute("title", "Đăng nhập");
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
        model.addAttribute("title", "Đăng nhập thành công!");
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
                    model.addAttribute("message", "Đăng nhập thất bại! Mật khẩu sai!");
                }
            } else {
                model.addAttribute("message", "Đăng nhập thất bại! Tên đăng nhập không tồn tại!");
            }
        } catch (Exception e) {
            model.addAttribute("message", "Login failed! Error: " + e);
            return "redirect:/user/login.htm";
        }
        return "redirect:/home.htm";
    }

    @RequestMapping("/register")
    public String handleRegister(ModelMap model, @CookieValue(value = "uid", defaultValue = "") String uid) {
        model.addAttribute("title", "Đăng ký tài khoản");
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
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            Date ns = dateFormat.parse(ngaysinh);
            Customer user = new Customer(ho, ten, email, phone, gt, ns);

            customerService.insertCustomer(user);
            account.setAccount_customer(customerService.getCustomerByEmail(email));
            account.setAccount_employee(null);
            LocalDateTime current = LocalDateTime.now();
            Date currentDate = Date.from(current.atZone(ZoneId.systemDefault()).toInstant());
            user.setAccount(account);

            Cart cart = new Cart(8, currentDate, user);
            cart.setCart_customer(user);
            cart.setIDGH(8);
            cart.setNGAYLAP(currentDate);
            user.setCart(cart);
            if ((accountService.insertAccount(account) == 1)) {
                cartService.insertCart(cart);
                model.addAttribute("message", "Đăng ký thành công!");
                emailService.sendEmail(email,
                        "Bạn đã đăng ký thành công vào dịch vụ sách PTITHCM - đồ án BOOKSHOP khóa 2021!",
                        "Chúc mừng bạn đã đăng ký thành công vào dịch vụ sách PTITHCM - đồ án BOOKSHOP khóa 2021!");
            } else {
                model.addAttribute("message", "Đăng ký thất bại!");
            }
        } catch (Exception e) {
            model.addAttribute("message", "Register failed! Error: " + e);
            return "redirect:/user/register.htm";
        }
        return "redirect:/home.htm";
    }

    @RequestMapping("/change-password")
    public String changePassword(ModelMap model, @CookieValue(value = "uid", defaultValue = "") String uid) {
        model.addAttribute("title", "Thay đổi mật khẩu");
        return "pages/user/change_password";
    }

    @RequestMapping(value = "change-password", method = RequestMethod.POST)
    public String changePasswordPost(@RequestParam("opassword") String password,
            @RequestParam("npassword") String newPassword,
            @RequestParam("rtnpassword") String retypedPassword,
            @CookieValue(value = "uid", defaultValue = "") String uid, HttpServletResponse response, ModelMap model) {
        try {
            Account account = accountService.getAccountByID(Integer.parseInt(uid));
            if (account != null) {
                if (accountService.checkLogin(account.getUSERNAME(), password)) {
                    account.setPASSWORD(newPassword);
                    if (accountService.updateAccount(account) == 1) {
                        model.addAttribute("message", "Đổi mật khẩu thành công!");
                        emailService.sendEmail(account.getAccount_customer().getEMAIL(),
                                "Bạn đã thay đổi mật khẩu thành công vào dịch vụ sách PTITHCM - đồ án BOOKSHOP khóa 2021!",
                                "Bạn đã thay đổi mật khẩu thành công vào dịch vụ sách PTITHCM - đồ án BOOKSHOP khóa 2021!");
                    } else {
                        model.addAttribute("message", "Đổi mật khẩu thất bại!");
                    }
                } else {
                    model.addAttribute("message", "Đổi mật khẩu thất bại! Mật khẩu cũ không đúng!");
                }
            } else {
                model.addAttribute("message",
                        "Đổi mật khẩu thất bại! Thông tin tài khoản lỗi hoặc thông tin đăng nhập bị chỉnh sửa!");
            }
        } catch (Exception e) {
            model.addAttribute("message", "Change password failed! Error: " + e);
            return "redirect:/user/login.htm";
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
        model.addAttribute("message", "Đăng xuất thành công!");
        return "redirect:/home.htm";
    }

    @RequestMapping(value = "forgot-password", method = RequestMethod.GET)
    public String forgotPassword(ModelMap model) {
        model.addAttribute("title", "Quên mật khẩu");
        return "pages/user/forgot_password";
    }

    @RequestMapping(value = "forgot-password", method = RequestMethod.POST)
    public String forgotPasswordPost(@RequestParam("email") String email, ModelMap model) {
        try {
            Account account = accountService.getAccountByEmail(email);
            if (account != null) {
                String newPassword = accountService.generateRandomPassword();
                account.setPASSWORD(newPassword);
                if (accountService.updateAccount(account) == 1) {
                    model.addAttribute("message", "Mật khẩu mới đã được gửi đến email của bạn!");
                    emailService.sendEmail(email,
                            "Mật khẩu mới của bạn vào dịch vụ sách PTITHCM - đồ án BOOKSHOP khóa 2021!",
                            "Mật khẩu mới của bạn vào dịch vụ sách PTITHCM - đồ án BOOKSHOP khóa 2021 là: "
                                    + newPassword);
                } else {
                    model.addAttribute("message", "Không thể gửi mật khẩu mới! Vui lòng thử lại sau!");
                }
            } else {
                model.addAttribute("message", "Email không tồn tại trong hệ thống!");
            }
        } catch (Exception e) {
            model.addAttribute("message", "Forgot password failed! Error: " + e);
            return "redirect:/user/forgot-password.htm";
        }
        return "redirect:/home.htm";
    }
}
