package ptithcm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import ptithcm.bean.Book;
import ptithcm.service.BookService;

import java.util.List;

@Controller
@RequestMapping("/book/")
public class BookController {
    @Autowired
    private BookService bookService;

    @RequestMapping("index")
    public String home(ModelMap model) {
        List<Book> books = bookService.getAllBooks();
        System.out.println(books);
        model.addAttribute("books", books);
        return "home";
    }
}
