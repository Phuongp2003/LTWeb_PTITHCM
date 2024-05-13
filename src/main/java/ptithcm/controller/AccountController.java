package ptithcm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import ptithcm.bean.Account;
import ptithcm.bean.Customer;
import ptithcm.service.AccountService;

@Controller
@RequestMapping("/user/")
public class AccountController {
    @Autowired
    AccountService accountService;
    
    @RequestMapping("/login")
    public String handleLogin(ModelMap model){
        Account account = new Account();
        model.addAttribute("account", account);
        return "login";
    }

    @RequestMapping(value="login-success", method=RequestMethod.POST)
    public String checkLogin(@RequestParam("USERNAME") String username, @RequestParam("PASSWORD") String password, ModelMap model) {
        System.out.println(accountService.getAccountByUsername(username).getUSERNAME());
        
        return "home";
    }

    @RequestMapping("/register")
    public String handleRegister(ModelMap model) {
        Account account = new Account();
        Customer customer = new Customer();
        model.addAttribute("account", account);
        model.addAttribute("customer",customer);
        return "register";
    }
}
