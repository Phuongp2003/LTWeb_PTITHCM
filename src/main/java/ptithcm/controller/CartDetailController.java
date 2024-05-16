// package ptithcm.controller;

// import java.util.List;

// import org.springframework.beans.factory.annotation.Autowired;
// import org.springframework.stereotype.Controller;
// import org.springframework.ui.ModelMap;
// import org.springframework.web.bind.annotation.PathVariable;
// import org.springframework.web.bind.annotation.RequestMapping;

// import ptithcm.bean.Book;
// import ptithcm.bean.Cart;

// import ptithcm.service.*;

// @Controller
// @RequestMapping("/cartdetail")
// public class CartDetailController {
//     @Autowired
//     private CartDetailService cartDetailService;

//     @Autowired
//     private CartService cartService;

//     @RequestMapping("")
//     public String showCartDetail(ModelMap model) {
//         Cart cart = cartService.getCartById(1);
//         int cart_id = cart.getIDGH();
//         model.addAttribute("cart", cart);
//         List<CartDetail> books = cartDetailService.getCartDetail(cart_id);
//         model.addAttribute("cartdetail", books);
        
//         return "cart";
//     }
//     // @RequestMapping("")
//     // public String showCart(ModelMap model) {
//     // Cart books = cartDetailService.getCart(1);
//     // model.addAttribute("cart", books);
//     // return "cart";
//     // }
// }
