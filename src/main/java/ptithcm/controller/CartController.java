package ptithcm.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import ptithcm.bean.Book;
import ptithcm.bean.Cart;
import ptithcm.service.BookService;
import ptithcm.service.CartDetailService;
import ptithcm.service.CartService;

@Controller
@RequestMapping("/cart")
public class CartController {
    @Autowired
    private CartService cartService;

    // @RequestMapping("")
    // public String showCartDetail(ModelMap model) {
    // List<Book> books = cartDetailService.getCartDetail(1);
    // model.addAttribute("cart", books);
    // return "cart";
    // }
    @RequestMapping("")
    public String showCart(ModelMap model) {
        // Cart books = cartService.getCart(1);
        // model.addAttribute("cart", books);
        return "cart";
    }
}