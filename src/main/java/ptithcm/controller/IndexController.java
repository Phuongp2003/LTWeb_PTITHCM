package ptithcm.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import javax.mail.internet.MimeMessage;

import ptithcm.bean.Book;
import ptithcm.bean.TypeBook;
import ptithcm.service.BookService;
import ptithcm.service.TypeBookService;

@Controller
public class IndexController {
    @Autowired
    private TypeBookService typeBookService;

    @Autowired
    private BookService bookService;

    @Autowired
    JavaMailSender mailSender;

    @RequestMapping("/home")
    public String home(Model model) {
        model.addAttribute("title", "PTITHCM Book Shop");
        model.addAttribute("type", "home");
        List<TypeBook> category = typeBookService.getAllTypeBooks();
        List<Book> book = bookService.getAllBooks();
        model.addAttribute("categories", category);
        model.addAttribute("books", book);
        return "pages/home";
    }

    @RequestMapping("/test")
    public String test(Model model) {
        model.addAttribute("title", "PTITHCM Book Shop");
        model.addAttribute("type", "test");
        List<TypeBook> category = typeBookService.getAllTypeBooks();
        List<Book> book = bookService.getAllBooks();
        model.addAttribute("categories", category);
        model.addAttribute("books", book);

        try {
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message);

            helper.setFrom("phambuinamphuong@gmail.com", "phambuinamphuong@gmail.com");
            helper.setTo("pbnphuong12a32021@gmail.com");
            helper.setReplyTo("phambuinamphuong@gmail.com", "phambuinamphuong@gmail.com");
            helper.setSubject("Test send email");
            helper.setText("Hello, this is a test email");

            mailSender.send(message);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return "pages/home";
    }

    @RequestMapping("/error")
    public String error(Model model) {
        model.addAttribute("title", "Error");
        return "pages/error";
    }
}
