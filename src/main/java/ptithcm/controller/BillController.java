package ptithcm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import ptithcm.bean.*;
import ptithcm.service.*;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.io.*;

@Controller
// @RequestMapping("/bill")
public class BillController {
    @Autowired
    private BillService billService;
    @Autowired
    private AccountService accountService;
    @Autowired
    private CartService cartService;
    @Autowired
    private EmployeeService employeeService;
    @Autowired
    private CartDetailService cartDetailService;
    @Autowired
    private BookService bookService;
    @Autowired
    private StatusService statusService;

    // @RequestMapping("")
    @RequestMapping(value = "bill/{MAHD}")
    public String showBill(ModelMap model, @PathVariable("MAHD") int MAHD) {

        // if (!uid.equals("") && accountService.getAccountByID(Integer.parseInt(uid))
        // != null) {
        System.out.println("null");
        Bill bill = billService.getBillByID(MAHD);
        List<BillDetail> list = billService.getBillDetail(MAHD);
        // model.addAttribute("userId", userId);
        model.addAttribute("billdetail", list);
        model.addAttribute("bill", bill);
        return "pages/bill/bill";

    }

    @RequestMapping(value = "admin/bill/{status}")
    public String showBillByStatus(ModelMap model, @CookieValue(value = "uid", defaultValue = "") String uid,
            @PathVariable("status") int status) {

        if (!uid.equals("") && accountService.getAccountByID(Integer.parseInt(uid)) != null) {
            List<Bill> bills;
            if (status == -1) {
                bills = billService.getAllBill();
            } else {
                bills = billService.getBillByStatus(status);
            }
            List<Status> statuslist = statusService.getAllStatus();
            model.addAttribute("billlist", bills);
            model.addAttribute("statuslist", statuslist);

            return "pages/admin/billbystatus";
        }
        return "redirect:/user/login.htm";

    }

    // @RequestMapping(value = "admin/bill/edit")
    // public String editBill(ModelMap model, @CookieValue(value = "uid",
    // defaultValue = "") String uid,
    // @CookieValue(value = "role", defaultValue = "") String role) {
    // if (!uid.equals("") && accountService.getAccountByID(Integer.parseInt(uid))
    // != null
    // && role.equals("employee")) {
    // Bill bill = new Bill();
    // model.addAttribute("bill", bill);
    // return "pages/admin/billbystatus";
    // }
    // return "redirect:/user/login.htm";
    // }

    @RequestMapping(value = "admin/bill/{status}/edit")
    public String checkBill(ModelMap model, @CookieValue(value = "uid", defaultValue = "") String uid,
            @CookieValue(value = "role", defaultValue = "") String role,
            @RequestParam("MAHD") int MAHD, @RequestParam("status") int status) {

        if (!uid.equals("") && accountService.getAccountByID(Integer.parseInt(uid)) != null
                && role.equals("employee")) {
            Employee e = employeeService.getEmployeeById(
                    accountService.getAccountByID(Integer.parseInt(uid)).getAccount_employee().getMANV());
            Bill bill = billService.getBillByID(MAHD);

            List<Status> statuss = statusService.getAllStatus();
            int old_status_id = bill.getStatus().getMATT();
            if (status < statuss.size() - 1) {
                bill.setStatus(statuss.get(status));

                bill.setBill_employee(e);
                billService.updateBill(bill);
                // model.addAttribute("bill", bill);
            }
            int tt = status + 1;
            List<Bill> bills = billService.getBillByStatus(status + 1);
            List<Status> statuslist = statusService.getAllStatus();
            model.addAttribute("billlist", bills);
            model.addAttribute("statuslist", statuslist);
            return "pages/admin/billbystatus";
        }
        return "redirect:/user/login.htm";

    }

    // @RequestMapping(value = "admin/bill")
    // public String showStatus(ModelMap model, @CookieValue(value = "uid",
    // defaultValue = "") String uid) {

    // if (!uid.equals("") && accountService.getAccountByID(Integer.parseInt(uid))
    // != null) {
    // List<Status> statuslist = statusService.getAllStatus();
    // // model.addAttribute("billlist", billlist);
    // List<Bill> allbill = billService.getAllBill();
    // model.addAttribute("statuslist", statuslist);
    // model.addAttribute("allbill", allbill);

    // return "pages/admin/billbystatus";
    // }
    // return "redirect:/user/login.htm";

    // }

    @RequestMapping(value = "bill/check-out")
    public String addBill(ModelMap model, @CookieValue(value = "uid", defaultValue = "") String uid) {
        if (!uid.equals("") && accountService.getAccountByID(Integer.parseInt(uid)) != null) {
            Bill bill = new Bill();
            model.addAttribute("bill", bill);

            return "pages/bill/addbill";
        }
        return "redirect:/user/login.htm";
    }

    @RequestMapping(value = "bill/check-out", method = RequestMethod.POST)
    public String saveBill(ModelMap model, @CookieValue(value = "uid", defaultValue = "") String uid,
            @RequestParam("HOTENNN") String HOTENNN,
            @RequestParam("DIACHINN") String DIACHINN,
            @RequestParam("SDTNN") String SDTNN, @RequestParam("EMAILNN") String EMAILNN,
            @RequestParam("GHICHU") String GHICHU) {
        Bill bill = new Bill();
        if (!uid.equals("") && accountService.getAccountByID(Integer.parseInt(uid)) != null) {
            Customer user = accountService.getAccountByID(Integer.parseInt(uid)).getAccount_customer();
            Employee e = employeeService.getEmployeeById(1);
            LocalDateTime current = LocalDateTime.now();
            Date currentDate = Date.from(current.atZone(ZoneId.systemDefault()).toInstant());
            // SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
            // Date date = dateFormat.parse(currentDate);
            Float TONGTIEN = (float) cartDetailService.getTotalMoney(user.getMAKH());
            Status status = new Status(1, "Chưa duyệt");
            bill = new Bill(null, currentDate, TONGTIEN, HOTENNN, DIACHINN, SDTNN, GHICHU,
                    EMAILNN, status, e, user);
            bill.setStatus(status);
            bill.setBill_employee(e);
            bill.setBill_customer(user);
            System.out.print("lập bill");
            bill.setDIACHINN(DIACHINN);
            bill.setEMAILNN(EMAILNN);
            bill.setHOTENNN(HOTENNN);
            bill.setSDTNN(SDTNN);
            bill.setGHICHU(GHICHU);
            bill.setTONGTIEN(TONGTIEN);
            bill.setNGAYLAP(currentDate);

            Bill check = billService.insertBill(bill);
            System.out.println("ma:" + bill.getMAHD());

            int count = 0;
            // int flag = 0;
            if (check != null) {
                int MAHD = check.getMAHD();
                List<CartDetail> list = cartDetailService.getBill(user.getMAKH());

                for (CartDetail c : list) {
                    BillDetail detail = new BillDetail();
                    BillDetailPrimary key = new BillDetailPrimary();
                    Integer MASACH = c.getId().getMASACH();
                    Integer SOLUONG = c.getSOLUONG();
                    Float DONGIA = c.getDONGIA();
                    if (MASACH != null && SOLUONG != null && DONGIA != null) {
                        key.setMASACH(c.getId().getMASACH());
                        key.setMAHD(MAHD);

                        detail.setId(key);
                        detail.setDONGIA(c.getDONGIA());
                        detail.setSOLUONG(c.getSOLUONG());
                        detail.setBilldetail_book(bookService.getBookByID(MASACH));
                        detail.setBill(billService.getBillByID(MAHD));

                        billService.addDetail(detail);
                        count += 1;
                        System.out.println("in:" + detail.toString());

                    }

                }
                if (count < list.size()) {
                    return "redirect:/cart.htm";

                }
                for (CartDetail c : list) {
                    cartDetailService.deleteDetail(c);
                }

                // if (count != num) {
                // return "redirect:/cart.htm";
                // }

                // model.addAttribute("bill", bill);
                return "redirect:/bill/" + MAHD + ".htm";

            }

            // model.addAttribute("bill", bill);
        }
        return "redirect:/cart.htm";
    }
}
