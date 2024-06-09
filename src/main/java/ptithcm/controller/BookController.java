package ptithcm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import ptithcm.bean.*;
import ptithcm.service.*;
import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

@Controller
public class BookController {
    @Autowired
    private BookService bookService;

    @Autowired
    private TypeBookService typeBookService;

    @Autowired
    private AuthorService authorService;

    @Autowired
    private SupplierService supplierService;

    @Autowired
    private ProducerService producerService;

    @Autowired
    private FeedbackService feedbackService;

    @Autowired
    private CartDetailService CartDetailService;
    @Autowired
    private AccountService accountService;
    @Autowired
    private CartService cartService;
    @Autowired
    private UploadService uploadService;
    @Autowired
    ServletContext context;

    @RequestMapping(value = "/book/{MASACH}")
    public String book(ModelMap model, @PathVariable("MASACH") int MASACH,
            @CookieValue(value = "uid", defaultValue = "") String uid) {
        Book book = bookService.getBookByID(MASACH);
        List<Feedback> feedback = feedbackService.getFeedbacksByBook(MASACH);
        Double avgVote = (Double) feedbackService.getAverageVote(MASACH);

        if (!uid.equals("") && accountService.getAccountByID(Integer.parseInt(uid)) != null) {
            Customer user = accountService.getAccountByID(Integer.parseInt(uid)).getAccount_customer();
            Feedback checkCustomer = feedbackService.getFeedbackById(user.getMAKH(), MASACH);

            if (checkCustomer != null) {
                model.addAttribute("message", 1);
            } else {
                model.addAttribute("message", 2);
            }

            CartDetail detail = CartDetailService
                    .getCartDetailByProductId(cartService.getCartIdByIdCustomer(user.getMAKH()), MASACH);
            String cmd = (detail != null) ? "update" : "add";
            model.addAttribute("cmd", cmd);
        }
        model.addAttribute("book", book);
        model.addAttribute("feedback", feedback);
        model.addAttribute("avgVote", avgVote);
        uploadService.getImage(book);
        return "pages/product/product";
    }

    @ModelAttribute("categoryPick")
    public List<TypeBook> getCategories() {
        List<TypeBook> list = typeBookService.getAllTypeBooks();
        return list;
    }

    @ModelAttribute("authorPick")
    public List<Author> getAuthors() {
        List<Author> list = authorService.getAllAuthors();
        return list;
    }

    @ModelAttribute("supplierPick")
    public List<Supplier> getSuppliers() {
        List<Supplier> list = supplierService.getAllSuppliers();
        return list;
    }

    @ModelAttribute("producerPick")
    public List<Producer> getProducers() {
        List<Producer> list = producerService.getAllProducers();
        return list;
    }

    @RequestMapping("/manage/product")
    public String product(ModelMap model) {
        List<Book> book = bookService.getAllBooks();
        model.addAttribute("books", book);
        uploadService.getImage(book);
        return "pages/admin/product";
    }

    @RequestMapping(value = "/manage/product/add-product")
    public String addProduct(ModelMap model) {
        Book book = new Book();
        model.addAttribute("product", book);
        return "pages/admin/addproduct";
    }

    @RequestMapping(value = "/manage/product/add-product", method = RequestMethod.POST)
    public String saveNewProduct(ModelMap model, @ModelAttribute("product") Book product, BindingResult errors,
            @ModelAttribute("category") TypeBook category, @RequestParam("file") MultipartFile file) {
        String fileName = uploadService.saveFile(file);
        if (fileName == null) {
            // errors.rejectValue("file", "product", "Vui lòng chọn ảnh !");
            model.addAttribute("message", -1);
        }
        product.setANH(fileName);

        if (product.getTENSACH().trim().length() == 0) {
            errors.rejectValue("TENSACH", "product", "Vui lòng nhập tên sách !");
        }
        if (errors.hasErrors()) {
            model.addAttribute("message", -1);
            return "pages/admin/addproduct";
        }

        TypeBook type = typeBookService.getTypeBookByID(product.getTypebook().getMATL());
        Author author = authorService.getAuthorByID(product.getAuthor().getMATG());
        Producer producer = producerService.getProducerByID(product.getProducer().getMANXB());
        product.setTypebook(type);
        product.setAuthor(author);
        product.setProducer(producer);
        bookService.addBook(product);
        model.addAttribute("product", product);
        return "redirect:/manage/product.htm";
    }

    @RequestMapping(value = "/manage/product/{MASACH}/update")
    public String editProduct(ModelMap model, @PathVariable("MASACH") Integer MASACH) {
        Book book = bookService.getBookByID(MASACH);
        uploadService.getImage(book);
        model.addAttribute("product", book);
        return "pages/admin/editproduct";
    }

    @RequestMapping(value = "/manage/product/{MASACH}/update", method = RequestMethod.POST)
    public String saveEditProduct(ModelMap model, @ModelAttribute("product") Book product,
            @RequestParam("file") MultipartFile file, BindingResult errors) {
        if (product.getTENSACH().trim().length() == 0) {
            errors.rejectValue("TENSACH", "product", "Vui lòng nhập tên sách !");
        }
        if (errors.hasErrors()) {
            model.addAttribute("message", -1);
            return "redirect:/manage/product/{MASACH}/update";
        }

        String fileName = uploadService.saveFile(file);
        if (fileName == null) {
            product.setANH(product.getANH());
        } else {
            product.setANH(fileName);
        }

        TypeBook type = typeBookService.getTypeBookByID(product.getTypebook().getMATL());
        Author author = authorService.getAuthorByID(product.getAuthor().getMATG());
        Producer producer = producerService.getProducerByID(product.getProducer().getMANXB());
        product.setTypebook(type);
        product.setAuthor(author);
        product.setProducer(producer);
        bookService.updateBook(product);
        model.addAttribute("product", product);
        return "redirect:/manage/product.htm";
    }

    @RequestMapping(value = "/manage/product/{MASACH}/delete")
    public String deleteCategory(ModelMap model, @PathVariable("MASACH") Integer MASACH) {
        Book book = bookService.getBookByID(MASACH);
        bookService.deleteBook(book);
        model.addAttribute("product", book);
        return "redirect:/manage/product.htm";
    }

    @RequestMapping(value = "/manage/product/search")
    public String searchBook(HttpServletRequest request, ModelMap model) {
        List<Book> book = bookService.searchBook(request.getParameter("searchInput"));
        model.addAttribute("books", book);
        return "pages/admin/product";
    }
}
