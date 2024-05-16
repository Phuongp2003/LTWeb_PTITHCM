package ptithcm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import ptithcm.bean.Bill;
import ptithcm.bean.Book;
import ptithcm.bean.CartDetail;
import ptithcm.service.BillService;

import java.util.List;

@Controller
// @RequestMapping("/bill/")
public class BillController {
    @Autowired
    private BillService billService;

    // @RequestMapping("")
    @RequestMapping(value = "/{useId}")
    public String showBill(ModelMap model, @PathVariable("useId") int useId) {
        Bill bill = billService.getBill(1); // Giả định getBill trả về List<Bill>
        // model.addAttribute("userId", userId);
        model.addAttribute("bill", bill);
        return "bill";
    }

}
