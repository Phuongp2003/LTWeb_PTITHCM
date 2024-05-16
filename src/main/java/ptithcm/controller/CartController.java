package ptithcm.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import ptithcm.bean.Book;
import ptithcm.bean.Cart;
import ptithcm.bean.CartDetail;
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

    @RequestMapping(value = "/{useId}")
    public String showCartDetail(ModelMap model, @PathVariable("useId") int useId) {
        Cart cart = cartService.getCartById(useId);
        int cart_id = cart.getIDGH();
        model.addAttribute("cart", cart);
        List<CartDetail> cartdetail = cartDetailService.getCartDetail(cart_id);
        List<Book> books = new ArrayList<>();
        model.addAttribute("cartdetail", cartdetail);

        for (int i = 0; i < cartdetail.size(); i++) {
            books.add(cartdetail.get(i).getCartdetail_book());
        }
        // model.addAttribute("booksfromcart", books);
        // Map<Integer, String> selects = new HashMap<>();
        // selects.put(0, "Chọn sản phẩm");
        // model.addAttribute("items", selects);
        return "pages/cart/cart";
    }

    // @RequestMapping(value = "/bill", method = RequestMethod.POST)
    // public String submitCart(@ModelAttribute("billForm") CartDetail cartDetail,
    // ModelMap model) {
    // int cartId = cartDetail.getCartdetail_cart().getIDGH();
    // int productId = cartDetail.getCartdetail_book().getMASACH();
    // CartDetail cartdetail = cartDetailService.getCartByProductId(1, 1);
    // model.addAttribute("billForm", cartdetail);

    // int soLuong = cartDetail.getSOLUONG();
    // CartDetail detail = cartDetailService.getCartByProductId(cartId,
    // productId);
    // detail.setSOLUONG(soLuong);
    // System.out.println("-----------------------" + detail.getSOLUONG());
    // System.out.println("dsdsdsđ");
    // model.addAttribute("cartbyproduct", detail);

    // return "test";
    // }
}
