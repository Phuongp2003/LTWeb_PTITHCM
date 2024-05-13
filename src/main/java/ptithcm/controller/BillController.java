package ptithcm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import ptithcm.bean.Book;
import ptithcm.service.BillService;

import java.util.List;

@Controller
@RequestMapping("/bill/")
public class BillController {
    @Autowired
    private BillService billService;

    @RequestMapping(value = "showbill/{userId}")
    public String showBill(ModelMap model, @PathVariable("userId") Integer userId) {
        List<Book> books = billService.getBill(userId); // Giả định getBill trả về List<Bill>
        model.addAttribute("userId", userId);
        model.addAttribute("books", books);
        return "bill";
    }
    
    
}
