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

import javax.servlet.http.HttpServletRequest;

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
        return "pages/shop/shop";
    }

    @RequestMapping(value = "typebook/{MATL}")
    public String findType(ModelMap model, @PathVariable("MATL") Integer MATL) {
        model.addAttribute("title", "PTITHCM Types Book");
        model.addAttribute("type", "shop");
        List<TypeBook> categories = typeBookService.getAllTypeBooks();
        TypeBook category = typeBookService.getTypeBookByID(MATL);
        List<Book> books = bookService.getBooksByCategory(MATL);
        model.addAttribute("categories", categories);
        model.addAttribute("category", category);
        model.addAttribute("books", books);
        return "pages/shop/typebook";
    }

    @RequestMapping("/sort-desc")
    public String sortDesc(ModelMap model) {
        model.addAttribute("type", "shop");
        List<TypeBook> categories = typeBookService.getAllTypeBooks();
        List<Book> book = bookService.getBooksByPriceDesc();
        model.addAttribute("categories", categories);
        model.addAttribute("books", book);
        return "pages/shop/shop";
    }

    @RequestMapping("/sort-asc")
    public String sortAsc(ModelMap model) {
        model.addAttribute("type", "shop");
        List<TypeBook> categories = typeBookService.getAllTypeBooks();
        List<Book> book = bookService.getBooksByPriceAsc();
        model.addAttribute("categories", categories);
        model.addAttribute("books", book);
        return "pages/shop/shop";
    }

    @RequestMapping(value = "typebook/{MATL}/sort-desc")
    public String findTypeSortDesc(ModelMap model, @PathVariable("MATL") Integer MATL) {
        model.addAttribute("title", "PTITHCM Types Book");
        model.addAttribute("type", "shop");
        List<TypeBook> categories = typeBookService.getAllTypeBooks();
        TypeBook category = typeBookService.getTypeBookByID(MATL);
        List<Book> books = bookService.getBooksByPriceDescAndType(MATL);
        model.addAttribute("categories", categories);
        model.addAttribute("category", category);
        model.addAttribute("books", books);
        return "pages/shop/typebook";
    }

    @RequestMapping(value = "typebook/{MATL}/sort-asc")
    public String findTypeSortAsc(ModelMap model, @PathVariable("MATL") Integer MATL) {
        model.addAttribute("title", "PTITHCM Types Book");
        model.addAttribute("type", "shop");
        List<TypeBook> categories = typeBookService.getAllTypeBooks();
        TypeBook category = typeBookService.getTypeBookByID(MATL);
        List<Book> books = bookService.getBooksByPriceAscAndType(MATL);
        model.addAttribute("categories", categories);
        model.addAttribute("category", category);
        model.addAttribute("books", books);
        return "pages/shop/typebook";
    }

    @RequestMapping(value = "search", params = "btn-seach")
    public String searchBooks(HttpServletRequest request, ModelMap model) {
        model.addAttribute("type", "shop");
        List<TypeBook> category = typeBookService.getAllTypeBooks();
        List<Book> book = bookService.searchBook(request.getParameter("searchInput"));
        model.addAttribute("categories", category);
        model.addAttribute("books", book);
        return "pages/shop/shop";
    }
}
