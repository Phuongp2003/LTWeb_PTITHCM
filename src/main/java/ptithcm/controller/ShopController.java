package ptithcm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import ptithcm.bean.Book;
import ptithcm.bean.TypeBook;
import ptithcm.service.BookService;
import ptithcm.service.TypeBookService;

import java.util.List;

@Controller
@RequestMapping("/shop")
public class ShopController {
    @Autowired
    private TypeBookService typeBookService;

    @Autowired
    private BookService bookService;

    @RequestMapping("")
    public String shop(ModelMap model) {
        model.addAttribute("title", "PTITHCM All Books");
        model.addAttribute("type", "shop");
        List<TypeBook> category = typeBookService.getAllTypeBooks();
        List<Book> book = bookService.getAllBooks();
        model.addAttribute("categories", category);
        model.addAttribute("books", book);
        return "shop";
    }

    @RequestMapping(value = "typebook/{MATL}")
    public String findType(ModelMap model, @PathVariable("MATL") int MATL) {
        model.addAttribute("title", "PTITHCM Types Book");
        model.addAttribute("type", "shop");
        List<TypeBook> categories = typeBookService.getAllTypeBooks();
        TypeBook category = typeBookService.getTypeBookByID(MATL);
        List<Book> books = bookService.getBooksByCategory(MATL);
        model.addAttribute("categories", categories);
        model.addAttribute("category", category);
        model.addAttribute("books", books);
        return "typebook";
    }
}
