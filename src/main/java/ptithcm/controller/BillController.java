package ptithcm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import ptithcm.bean.Bill;
import ptithcm.bean.Customer;
import ptithcm.service.AccountService;
import ptithcm.service.BillService;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.Date;

@Controller
// @RequestMapping("/bill/")
public class BillController {
    @Autowired
    private BillService billService;
    @Autowired
    private AccountService accountService;
    // @RequestMapping("")
    @RequestMapping(value = "/{useId}")
    public String showBill(ModelMap model, @PathVariable("useId") int useId) {
        Bill bill = billService.getBill(1); // Giả định getBill trả về List<Bill>
        // model.addAttribute("userId", userId);
        model.addAttribute("bill", bill);
        return "pages/bill/bill";
    }

    @RequestMapping(value = "check-out")
    public String addBill(ModelMap model) {
        Bill bill = new Bill();
        System.out.print("ll");

        // Customer user =
        // accountService.getAccountByID(Integer.parseInt(uid)).getAccount_customer();
        // bill.setBill_customer(user);
        // bill.setBill_cart(cartService.getCartById(user.getMAKH()));
        // System.out.print("lập bill");
        model.addAttribute("bill", bill);

        return "pages/bill/bill";
    }

    @RequestMapping(value = "check-out", method = RequestMethod.POST)
    public String saveBill(ModelMap model, @CookieValue(value = "uid", defaultValue = "") String uid,
            @RequestParam("HOTENNN") String HOTENNN,
            @RequestParam("DIACHINN") String DIACHINN,
            @RequestParam("SDTNN") String SDTNN, @RequestParam("EMAILNN") String EMAILNN,
            @RequestParam("GHICHU") String GHICHU, @RequestParam("TONGTIEN") float TONGTIEN,
            @RequestParam("NGAYLAP") Date NGAYLAP) {
        // Bill bill = new Bill();
        if (!uid.equals("") && accountService.getAccountByID(Integer.parseInt(uid)) != null) {
            Customer user = accountService.getAccountByID(Integer.parseInt(uid)).getAccount_customer();
            Bill bill = new Bill(null, NGAYLAP, (float) 300, HOTENNN, DIACHINN, SDTNN, GHICHU, EMAILNN, null, user);
            bill.setBill_customer(user);
            // bill.setBill_cart(cartService.getCartById(user.getMAKH()));
            System.out.print("lập bill");
            // model.addAttribute("bill", bill);

            bill.setDIACHINN(DIACHINN);
            bill.setEMAILNN(EMAILNN);
            bill.setHOTENNN(HOTENNN);
            bill.setSDTNN(SDTNN);
            bill.setGHICHU(GHICHU);
            LocalDateTime current = LocalDateTime.now();
            Date currentDate = Date.from(current.atZone(ZoneId.systemDefault()).toInstant());
            bill.setNGAYLAP(currentDate);
            bill.setTONGTIEN(TONGTIEN);
            billService.insertBill(bill);
            model.addAttribute("bill", bill);
        }
        return "redirect:/cart/1.htm";
    }
}
