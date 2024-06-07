package ptithcm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import ptithcm.bean.Book;
import ptithcm.bean.Customer;
import ptithcm.bean.Feedback;
import ptithcm.bean.FeedbackPrimary;
import ptithcm.service.BookService;
import ptithcm.service.FeedbackService;
import ptithcm.service.AccountService;

import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/feedback")
public class FeedbackController {
    @Autowired
    private FeedbackService feedbackService;

    @Autowired
    private BookService bookService;

    @Autowired
    private AccountService accountService;

    @RequestMapping(value = "{MASACH}/add-feedback")
    public String addFeedback(ModelMap model, @CookieValue(value = "uid", defaultValue = "") String uid, 
    @ModelAttribute("feedback") Feedback feedback, @PathVariable("MASACH") int MASACH) {
        if (!uid.equals("") && accountService.getAccountByID(Integer.parseInt(uid)) != null) {
            return "pages/feedback/feedback";
        }
        return "redirect:/user/login.htm";
    }

    @RequestMapping(value = "{MASACH}/add-feedback", method = RequestMethod.POST)
    public String saveNewFeedback(ModelMap model, @CookieValue(value = "uid", defaultValue = "") String uid, 
    @ModelAttribute("feedback") Feedback feedback, @PathVariable("MASACH") int MASACH) {
        if (!uid.equals("") && accountService.getAccountByID(Integer.parseInt(uid)) != null) {
            Customer user = accountService.getAccountByID(Integer.parseInt(uid)).getAccount_customer();
            Book book = bookService.getBookByID(MASACH);

            LocalDateTime current = LocalDateTime.now();
            Date currentDate = Date.from(current.atZone(ZoneId.systemDefault()).toInstant());
            
            FeedbackPrimary key = new FeedbackPrimary(user.getMAKH(), book.getMASACH());
            key.setMAKH(user.getMAKH());
            key.setMASACH(MASACH);
            feedback.setId(key);
            feedback.setCustomer(user);
            feedback.setBook(book);
            feedback.setTHOIGIAN(currentDate);
            feedbackService.addFeedback(feedback);
            model.addAttribute("feedback", feedback);
            return "redirect:/book/{MASACH}.htm";
        }
        return "redirect:/user/login.htm";
    }

    @RequestMapping(value = "{MASACH}/edit-feedback")
    public String editFeedback(ModelMap model, @CookieValue(value = "uid", defaultValue = "") String uid, 
    @ModelAttribute("feedback") Feedback feedback, @PathVariable("MASACH") int MASACH) {
        if (!uid.equals("") && accountService.getAccountByID(Integer.parseInt(uid)) != null) {
            return "pages/feedback/editfeedback";
        }
        return "redirect:/user/login.htm";
    }

    @RequestMapping(value = "{MASACH}/edit-feedback", method = RequestMethod.POST)
    public String saveEditFeedback(ModelMap model, @CookieValue(value = "uid", defaultValue = "") String uid, 
    @ModelAttribute("feedback") Feedback feedback, @PathVariable("MASACH") int MASACH) {
        if (!uid.equals("") && accountService.getAccountByID(Integer.parseInt(uid)) != null) {
            Customer user = accountService.getAccountByID(Integer.parseInt(uid)).getAccount_customer();
            Book book = bookService.getBookByID(MASACH);

            LocalDateTime current = LocalDateTime.now();
            Date currentDate = Date.from(current.atZone(ZoneId.systemDefault()).toInstant());
            
            FeedbackPrimary key = new FeedbackPrimary(user.getMAKH(), book.getMASACH());
            key.setMAKH(user.getMAKH());
            key.setMASACH(MASACH);
            feedback.setId(key);
            feedback.setCustomer(user);
            feedback.setBook(book);
            feedback.setTHOIGIAN(currentDate);
            feedbackService.updateFeedback(feedback);
            model.addAttribute("feedback", feedback);
            return "redirect:/book/{MASACH}.htm";
        }
        return "redirect:/user/login.htm";
    }

    @RequestMapping(value = "{MASACH}/delete-feedback")
    public String deleteFeedback(ModelMap model, @CookieValue(value = "uid", defaultValue = "") String uid,
    @PathVariable("MASACH") int MASACH) {
        if (!uid.equals("") && accountService.getAccountByID(Integer.parseInt(uid)) != null) {
            Customer user = accountService.getAccountByID(Integer.parseInt(uid)).getAccount_customer();
            Book book = bookService.getBookByID(MASACH);
            Feedback feedback = feedbackService.getFeedbackById(user.getMAKH(), book.getMASACH());
            feedbackService.deleteFeedback(feedback);
            return "redirect:/book/{MASACH}.htm";
        }
        return "redirect:/user/login.htm";
    }
}
