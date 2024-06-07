package ptithcm.controller;

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

import ptithcm.bean.Book;
import ptithcm.bean.Customer;
import ptithcm.bean.Discount;
import ptithcm.bean.DiscountDetail;
import ptithcm.bean.Employee;
import ptithcm.bean.Post;
import ptithcm.service.AccountService;
import ptithcm.service.BookService;
import ptithcm.service.DiscountService;
import ptithcm.service.ListPostService;
import ptithcm.util.DateHelper;
import ptithcm.util.PostHelper;

@Controller
@RequestMapping("/discount")
public class DiscountController {
    @Autowired
    private DiscountService discountService;

    @Autowired
    private BookService bookService;

    @Autowired
    private AccountService accountService;

    @RequestMapping("")
    public String discountController(Model model, @CookieValue(value = "uid", defaultValue = "") String uid) {
        model.addAttribute("title", "Khuyến mãi");
        if (!uid.equals("") && accountService.getAccountByID(Integer.parseInt(uid)) != null) {
            Customer user = accountService.getAccountByID(Integer.parseInt(uid)).getAccount_customer();
            model.addAttribute("user_id", Integer.parseInt(uid));
            model.addAttribute("user_name", user.getHO() + " " + user.getTEN());
        }

        List<Discount> discounts = discountService.getAllDiscounts();

        model.addAttribute("discounts", discounts);
        return "pages/discount/discount";
    }

    @RequestMapping("/{id}")
    public String discountDetail(Model model, @PathVariable("id") int id,
            @CookieValue(value = "uid", defaultValue = "") String uid) {
        model.addAttribute("title", "Chi tiết khuyến mãi");
        if (!uid.equals("") && accountService.getAccountByID(Integer.parseInt(uid)) != null) {
            Customer user = accountService.getAccountByID(Integer.parseInt(uid)).getAccount_customer();
            model.addAttribute("user_id", Integer.parseInt(uid));
            model.addAttribute("user_name", user.getHO() + " " + user.getTEN());
        }

        Discount discount = discountService.getDiscountByID(id);
        List<DiscountDetail> discountDetail = discountService.getDiscountDetails(discount);

        model.addAttribute("discountd", discountDetail);
        model.addAttribute("discount", discount);
        return "pages/discount/discount_detail";
    }

    @RequestMapping(value = "add")
    public String createDiscount(Model model, @CookieValue(value = "uid", defaultValue = "") String uid,
            @CookieValue(value = "role", defaultValue = "") String role) {
        model.addAttribute("title", "Tạo discount");
        if (uid.equals("") || accountService.getAccountByID(Integer.parseInt(uid)) == null) {
            model.addAttribute("type", "forum");
            model.addAttribute("error", 401);
            model.addAttribute("message", "You must login to create post");
            return "pages/post/post_action";
        }
        model.addAttribute("type", "forum");
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
        Discount discount = new Discount();
        model.addAttribute("discount", discount);
        return "pages/discount/discount_add";
    }

    @RequestMapping(value = "add-success", method = RequestMethod.POST)
    public String saveNewPost(@RequestParam("TENKM") String TENKM,
            @RequestParam("NGAYBD") String NGAYBD,
            @RequestParam("NGAYKT") String NGAYKT,
            Model model,
            @CookieValue(value = "uid", defaultValue = "") String uid,
            @CookieValue(value = "role", defaultValue = "") String role) {
        Customer user = accountService.getAccountByID(Integer.parseInt(uid)).getAccount_customer();
        Employee employee = accountService.getAccountByID(Integer.parseInt(uid)).getAccount_employee();
        if (employee == null) {
            model.addAttribute("type", "forum");
            model.addAttribute("error", 401);
            model.addAttribute("message", "You must login to create post");
            return "pages/post/post_action";
        }
        DateHelper dateHelper = new DateHelper();
        Date ngaybd = dateHelper.convertStringToDate(NGAYBD);
        Date ngaykt = dateHelper.convertStringToDate(NGAYKT);
        Discount discount = new Discount(TENKM, ngaybd, ngaykt);

        discountService.createDiscount(discount);
        model.addAttribute("title", "PTITHCM Forum");
        model.addAttribute("type", "forum");
        model.addAttribute("user_id", Integer.parseInt(uid));
        model.addAttribute("user_name", user.getHO() + " " + user.getTEN());
        model.addAttribute("success", 200);
        model.addAttribute("message", "Create discount success");
        return "pages/post/post_action";
    }

    @RequestMapping(value = "{id}/remove")
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

        Discount discount = discountService.getDiscountByID(id);
        discountService.deleteDiscount(discount);

        model.addAttribute("type", "forum");
        model.addAttribute("user_id", Integer.parseInt(uid));
        model.addAttribute("success", 200);
        model.addAttribute("message", "Delete post success");
        return "pages/post/post_action";
    }

    @RequestMapping(value = "{id}/edit")
    public String editDiscount(Model model, @PathVariable("id") String id,
            @CookieValue(value = "uid", defaultValue = "") String uid,
            @CookieValue(value = "role", defaultValue = "") String role) {
        model.addAttribute("title", "edit discount");
        if (uid.equals("") || accountService.getAccountByID(Integer.parseInt(uid)) == null) {
            model.addAttribute("type", "forum");
            model.addAttribute("error", 401);
            model.addAttribute("message", "You must login to create post");
            return "pages/post/post_action";
        }
        model.addAttribute("type", "forum");
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
        Discount discount = discountService.getDiscountByID(Integer.parseInt(id));
        model.addAttribute("discount", discount);
        return "pages/discount/discount_edit";
    }

    @RequestMapping(value = "{id}/edit-success", method = RequestMethod.POST)
    public String saveEditedDiscount(@RequestParam("TENKM") String TENKM,
            @RequestParam("NGAYBD") String NGAYBD,
            @RequestParam("NGAYKT") String NGAYKT,
            @PathVariable("id") String id,
            Model model,
            @CookieValue(value = "uid", defaultValue = "") String uid,
            @CookieValue(value = "role", defaultValue = "") String role) {
        Customer user = accountService.getAccountByID(Integer.parseInt(uid)).getAccount_customer();
        Employee employee = accountService.getAccountByID(Integer.parseInt(uid)).getAccount_employee();
        if (employee == null) {
            model.addAttribute("type", "forum");
            model.addAttribute("error", 401);
            model.addAttribute("message", "You must login to create post");
            return "pages/post/post_action";
        }
        DateHelper dateHelper = new DateHelper();
        Date ngaybd = dateHelper.convertStringToDate(NGAYBD);
        Date ngaykt = dateHelper.convertStringToDate(NGAYKT);
        Discount discount = discountService.getDiscountByID(Integer.parseInt(id));
        discount.setTENKM(TENKM);
        discount.setNGAYBD(ngaybd);
        discount.setNGAYKT(ngaykt);

        discountService.updateDiscount(discount);
        model.addAttribute("title", "PTITHCM Forum");
        model.addAttribute("type", "forum");
        model.addAttribute("user_id", Integer.parseInt(uid));
        model.addAttribute("user_name", user.getHO() + " " + user.getTEN());
        model.addAttribute("success", 200);
        model.addAttribute("message", "Create discount success");
        return "pages/post/post_action";
    }
}
