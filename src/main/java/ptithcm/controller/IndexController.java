package ptithcm.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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

    @RequestMapping("/home")
    public String home(Model model) {
        model.addAttribute("title", "PTITHCM Book Shop");
        model.addAttribute("type", "home");
        List<TypeBook> category = typeBookService.getAllTypeBooks();
        List<Book> book = bookService.getAllBooks();
        model.addAttribute("categories", category);
        model.addAttribute("books", book);
        return "home";
    }

    @RequestMapping("/error")
    public String error(Model model) {
        model.addAttribute("title", "Error");
        return "error";
    }
}
