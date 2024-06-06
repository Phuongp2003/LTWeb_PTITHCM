package ptithcm.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import ptithcm.bean.Author;
import ptithcm.bean.Book;
import ptithcm.bean.Cart;
import ptithcm.bean.CartDetail;
import ptithcm.bean.CartDetailPrimary;
import ptithcm.bean.TypeBook;
import ptithcm.service.BookService;
import ptithcm.service.CartDetailService;
import ptithcm.service.CartService;

@Controller
@RequestMapping("/cart")
public class CartController {
    @Autowired
    private CartDetailService cartDetailService;
    @Autowired
    private CartService cartService;

    @Autowired
    private BookService bookService;

    @RequestMapping(value = "{userId}")
    public String showCartDetail(ModelMap model, @PathVariable("userId") int userId) {
        Cart cart = cartService.getCartById(1);
        int cart_id = cart.getIDGH();
        model.addAttribute("cart", cart);
        List<CartDetail> cartdetail = cartDetailService.getCartDetail(cart_id);

        if (cartdetail == null || cartdetail.isEmpty()) {
            model.addAttribute("cartdetail", new ArrayList<CartDetail>());
            model.addAttribute("totalitem", 0);
            model.addAttribute("totalmoney", 0.0);
        } else {
            int number = cartDetailService.getTotalItem(userId);
            double money = cartDetailService.getTotalMoney(userId);
            model.addAttribute("cartdetail", cartdetail);
            model.addAttribute("totalitem", number);
            model.addAttribute("totalmoney", money);
        }

        return "pages/cart/cart";
    }

    // @RequestMapping(value = "{userId}")
    // public String showCartDetail(ModelMap model, @PathVariable("userId") int
    // userId) {
    // Cart cart = cartService.getCartById(1);
    // int cart_id = cart.getIDGH();
    // model.addAttribute("cart", cart);
    // List<CartDetail> cartdetail = cartDetailService.getCartDetail(cart_id);
    // int number = cartDetailService.getTotalItem(userId);
    // double money = cartDetailService.getTotalMoney(userId);
    // // List<Book> books = new Arra.yList<>();
    // model.addAttribute("detail", cartdetail.get(0));
    // model.addAttribute("cartdetail", cartdetail);
    // model.addAttribute("totalitem", number);
    // model.addAttribute("totalmoney", money);
    // // for (int i = 0; i < cartdetail.size(); i++) {
    // // books.add(cartdetail.get(i).getCartdetail_book());
    // // }
    // // model.addAttribute("booksfromcart", books);
    // // Map<Integer, String> selects = new HashMap<>();
    // // selects.put(0, "Chọn sản phẩm");
    // // model.addAttribute("items", selects);

    // return "pages/cart/cart";
    // }

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
    public String addCartDetail(ModelMap model) {
        CartDetail detail = new CartDetail();
        model.addAttribute("detail", detail);
        return "pages/product/product";
    }

    @RequestMapping(value = "add-cart-detail", method = RequestMethod.POST)
    public String saveNewCartDetail(ModelMap model, @RequestParam("MASACH") int MASACH,
            @RequestParam("SOLUONG") int SOLUONG, @RequestParam("DONGIA") float DONGIA) {
        CartDetailPrimary key = new CartDetailPrimary(1, MASACH);

        CartDetail detail = new CartDetail(key, SOLUONG,
                DONGIA, 0);
        detail.setCartdetail_book(bookService.getBookByID(MASACH));
        detail.setCartdetail_cart(cartService.getCartById(1));
        // System.out.println(" -- " + MASACH);
        cartDetailService.addDetail(detail);
        model.addAttribute("detail", detail);
        // System.out.println("đã ghi" + MASACH);
        return "redirect:/cart/1.htm";
    }
    // @RequestMapping(value = "add-cart-detail", method = RequestMethod.POST)
    // public String saveNewCartDetail(ModelMap model, @ModelAttribute("detail")
    // CartDetail detail) {
    // // CartDetailPrimary key = new CartDetailPrimary(1, MASACH);

    // // CartDetail detail = new CartDetail(key, SOLUONG,
    // // DONGIA, 0);
    // detail.setCartdetail_book(bookService.getBookByID(detail.getCartdetail_book().getMASACH()));
    // //
    // detail.setCartdetail_cart(cartService.getCartById(detail.getCartdetail_cart().getIDGH()));
    // detail.setCartdetail_cart(cartService.getCartById(1));
    // // System.out.println(" -- " + MASACH);
    // cartDetailService.addDetail(detail);
    // model.addAttribute("detail", detail);
    // // System.out.println("đã ghi" + MASACH);
    // return "redirect:/shop.htm";
    // }

    // @RequestParam("IDGH") int IDGH
    @RequestMapping(value = "/update-cart-detail")
    public String editCartDetail(ModelMap model) {
        CartDetail detail = new CartDetail();
        // List<CartDetail> list = new ArrayList<>();
        // CartDetail detail = new CartDetail();
        model.addAttribute("cartdetail", detail);
        return "pages/cart/cart";
    }

    @RequestMapping(value = "/update-cart-detail", method = RequestMethod.POST)
    public String saveEditCartDetail(ModelMap model, @RequestParam("MASACH") int MASACH,
            @RequestParam("SOLUONG") int SOLUONG,
            @RequestParam("DONGIA") float DONGIA, @RequestParam("CHON") int CHON) {
        CartDetailPrimary key = new CartDetailPrimary(1, MASACH);
        CartDetail detail = new CartDetail(key, SOLUONG, DONGIA, CHON);
        detail.setCartdetail_book(bookService.getBookByID(MASACH));
        detail.setCartdetail_cart(cartService.getCartById(1));
        cartDetailService.updateDetail(detail);
        model.addAttribute("detail", detail);
        return "redirect:/cart/1.htm";
    }

    // @RequestMapping(value = "/update-cart-detail", method = RequestMethod.POST)
    // public String saveEditCartDetail(ModelMap model, @RequestParam("MASACH")
    // int[] MASACH,
    // @RequestParam("SOLUONG") int[] SOLUONG,
    // @RequestParam("DONGIA") float[] DONGIA,
    // @RequestParam("CHON") int[] CHON) {
    // List<CartDetail> list = cartDetailService.getCartDetail(0);
    // for (int i = 0; i < MASACH.length; i++) {
    // CartDetailPrimary key = new CartDetailPrimary(1, MASACH[i]);
    // CartDetail detail = new CartDetail(key, SOLUONG[i], DONGIA[i], CHON[i]);
    // detail.setCartdetail_book(bookService.getBookByID(MASACH[i]));
    // detail.setCartdetail_cart(cartService.getCartById(1));
    // cartDetailService.updateDetail(detail);
    // }
    // model.addAttribute("cartdetail", list);
    // return "redirect:/shop.htm";
    // }

    @RequestMapping(value = "/delete-cart-detail/{MASACH}.htm")
    public String deleteCategory(ModelMap model, @PathVariable("MASACH") int MASACH) {
        CartDetail detail = cartDetailService.getCartDetailByProductId(1, MASACH);
        cartDetailService.deleteDetail(detail);
        model.addAttribute("detail", detail);
        return "redirect:/cart/1.htm";
    }

}