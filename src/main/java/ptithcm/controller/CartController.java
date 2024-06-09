package ptithcm.controller;

import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import ptithcm.bean.Cart;
import ptithcm.bean.CartDetail;
import ptithcm.bean.CartDetailPrimary;
import ptithcm.bean.Customer;
import ptithcm.service.BookService;
import ptithcm.service.CartDetailService;
import ptithcm.service.CartService;
import ptithcm.service.AccountService;

@Controller
@RequestMapping("/cart")
public class CartController {
    @Autowired
    private CartDetailService cartDetailService;
    @Autowired
    private CartService cartService;

    @Autowired
    private BookService bookService;

    @Autowired
    private AccountService accountService;

    @RequestMapping(value = "")
    public String showCartDetail(ModelMap model, @CookieValue(value = "uid", defaultValue = "") String uid) {
        if (!uid.equals("") && accountService.getAccountByID(Integer.parseInt(uid)) != null) {
            Customer user = accountService.getAccountByID(Integer.parseInt(uid)).getAccount_customer();
            int userId = user.getMAKH();
            Cart cart = cartService.getCartByIdCustomer(userId);
            // System.out.println("uid" + cartService.getCartIdByIdCustomer(userId));
            model.addAttribute("cart", cart);
            List<CartDetail> cartdetail = cartDetailService.getCartDetail(cart.getIDGH());
            // List<Cart> l = cartService.getCart();
            // int idgh = l.get(2).getIDGH();
            if (cartdetail == null || cartdetail.isEmpty()) {
                model.addAttribute("cartdetail", new ArrayList<CartDetail>());
                model.addAttribute("totalitem", 0);
                model.addAttribute("totalmoney", 0.0);
            } else {
                int number = cartDetailService.getTotalItem(cart.getIDGH());
                double money = cartDetailService.getTotalMoney(cart.getIDGH());
                model.addAttribute("cartdetail", cartdetail);
                model.addAttribute("totalitem", number);
                model.addAttribute("totalmoney", money);
            }
            return "pages/cart/cart";

        }
        return "redirect:/user/login.htm";
    }

    @RequestMapping(value = "/cart-detail", method = RequestMethod.POST)
    public String updateProduct(@ModelAttribute("cartdetail") CartDetail cartdetail) {
        // int cartId = cartDetail.getCartdetail_cart().getIDGH();
        // int productId = cartDetail.getCartdetail_book().getMASACH();
        // CartDetail cartdetail = cartDetailService.getCartByProductId(1, 1);
        return "cartdetail";
        // int soLuong = cartDetail.getSOLUONG();
        // CartDetail detail = cartDetailService.getCartByProductId(cartId,
        // productId);
        // detail.setSOLUONG(soLuong);
        // System.out.println("-----------------------" + detail.getSOLUONG());
        // System.out.println("dsdsdsđ");
        // model.addAttribute("cartbyproduct", detail);

        // return "test";
    }

    @RequestMapping(value = "add-cart-detail")
    public String addCartDetail(ModelMap model, @CookieValue(value = "uid", defaultValue = "") String uid) {
        if (!uid.equals("") && accountService.getAccountByID(Integer.parseInt(uid)) != null) {
            CartDetail detail = new CartDetail();
            model.addAttribute("detail", detail);
            return "pages/product/product";
        }
        return "redirect:/user/login.htm";
    }

    @RequestMapping(value = "add-cart-detail", method = RequestMethod.POST)
    public String saveNewCartDetail(ModelMap model, @CookieValue(value = "uid", defaultValue = "") String uid,
            @RequestParam("MASACH") int MASACH,
            @RequestParam("SOLUONG") int SOLUONG, @RequestParam("DONGIA") float DONGIA) {
        if (!uid.equals("") && accountService.getAccountByID(Integer.parseInt(uid)) != null) {
            Customer user = accountService.getAccountByID(Integer.parseInt(uid)).getAccount_customer();
            int userId = user.getMAKH();
            Cart cart = cartService.getCartByIdCustomer(userId);

            CartDetailPrimary key = new CartDetailPrimary(cart.getIDGH(), MASACH);
            key.setIDGH(cart.getIDGH());
            key.setMASACH(MASACH);
            CartDetail detail = new CartDetail(key, SOLUONG, DONGIA, 0);
            detail.setCartdetail_book(bookService.getBookByID(MASACH));
            detail.setCartdetail_cart(cart);
            detail.setCartdetail_book(bookService.getBookByID(MASACH));
            detail.setId(key);
            detail.setCHON(0);
            detail.setDONGIA(DONGIA);
            detail.setSOLUONG(SOLUONG);
            // System.out.println(" -- " + MASACH);
            cartDetailService.addDetail(detail);
            model.addAttribute("detail", detail);
            // System.out.println("đã ghi" + MASACH);
            return "redirect:/cart.htm";
        }
        return "redirect:/user/login.htm";

    }

    @RequestMapping(value = "update-cart-detail")
    public String editCartDetail(ModelMap model) {
        CartDetail detail = new CartDetail();
        model.addAttribute("cartdetail", detail);
        return "pages/cart/cart";
    }

    @RequestMapping(value = "update-cart-detail", method = RequestMethod.POST)
    public String saveEditCartDetail(ModelMap model, @CookieValue(value = "uid", defaultValue = "") String uid,
            @RequestParam("MASACH") int MASACH,
            @RequestParam("SOLUONG") int SOLUONG,
            @RequestParam("DONGIA") float DONGIA, @RequestParam("CHON") int CHON) {
        if (!uid.equals("") && accountService.getAccountByID(Integer.parseInt(uid)) != null) {
            Customer user = accountService.getAccountByID(Integer.parseInt(uid)).getAccount_customer();
            int userId = user.getMAKH();
            Cart cart = cartService.getCartByIdCustomer(user.getMAKH());
            int cart_id = cart.getIDGH();
            ///////////////////////////////
            CartDetail old = cartDetailService.getCartDetailByProductId(cart_id, MASACH);

            int oldSL = old.getSOLUONG();
            int SL = oldSL + SOLUONG;
            //////////////////////////
            CartDetailPrimary key = new CartDetailPrimary(cart_id, MASACH);
            key.setIDGH(cart.getIDGH());
            key.setMASACH(MASACH);
            CartDetail detail = new CartDetail(key, SL, DONGIA, CHON);
            detail.setCartdetail_book(bookService.getBookByID(MASACH));
            detail.setCartdetail_cart(cart);
            detail.setCartdetail_book(bookService.getBookByID(MASACH));
            detail.setId(key);
            detail.setCHON(CHON);
            detail.setDONGIA(DONGIA);
            detail.setSOLUONG(SL);
            cartDetailService.updateDetail(detail);
            model.addAttribute("detail", detail);
            return "redirect:/cart.htm";
        }
        return "redirect:/user/login.htm";
    }

    @RequestMapping(value = "/delete-cart-detail/{MASACH}.htm")
    public String deleteCategory(ModelMap model, @CookieValue(value = "uid", defaultValue = "") String uid,
            @PathVariable("MASACH") int MASACH) {
        if (!uid.equals("") && accountService.getAccountByID(Integer.parseInt(uid)) != null) {
            Customer user = accountService.getAccountByID(Integer.parseInt(uid)).getAccount_customer();
            int userId = user.getMAKH();
            Cart cart = cartService.getCartByIdCustomer(user.getMAKH());
            int cart_id = cart.getIDGH();
            CartDetail detail = cartDetailService.getCartDetailByProductId(cart_id, MASACH);
            cartDetailService.deleteDetail(detail);
            model.addAttribute("detail", detail);
            return "redirect:/cart.htm";
        }
        return "redirect:/user/login.htm";
    }

}
