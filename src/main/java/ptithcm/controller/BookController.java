package ptithcm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import ptithcm.bean.Book;
import ptithcm.service.BookService;

import java.util.List;

@Controller
public class BookController {
    @Autowired
    private BookService bookService;

    @RequestMapping(value = "/book/{MASACH}")
    public String book(ModelMap model, @PathVariable("MASACH") int MASACH) {
        Book book = bookService.getBookByID(MASACH);
        model.addAttribute("book", book);
        return "pages/product/product";
    }

    @RequestMapping("/admin/product")
    public String product(ModelMap model) {
        List<Book> book = bookService.getAllBooks();
        model.addAttribute("books", book);
        return "pages/admin/product";
    }
}
