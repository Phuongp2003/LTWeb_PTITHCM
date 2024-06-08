package ptithcm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import ptithcm.bean.*;
import ptithcm.service.*;


import java.io.BufferedOutputStream;
import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.text.DecimalFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.Base64;
import java.util.Date;
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
    private AccountService accountService;

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
            if(checkCustomer != null){
                model.addAttribute("message", 1);
            } else {
                model.addAttribute("message", 2);
            }
        }

        model.addAttribute("book", book);
        model.addAttribute("feedback", feedback);
        model.addAttribute("avgVote", avgVote);
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

    @RequestMapping("/admin/product")
    public String product(ModelMap model) {
        List<Book> book = bookService.getAllBooks();
        model.addAttribute("books", book);
        return "pages/admin/product";
    }

    @RequestMapping(value = "/admin/product/add-product",method = RequestMethod.GET)
    public String addProduct(ModelMap model) {
        Book book = new Book();
        model.addAttribute("product", book);
        return "pages/admin/addproduct";
    }
    
    @RequestMapping(value = "/admin/product/add-product", method = RequestMethod.POST)
    public String saveNewProduct(ModelMap model, @ModelAttribute("book") Book book, @ModelAttribute("category") TypeBook category,
    @RequestParam("file") MultipartFile file) {
        // if (file.isEmpty()) {
        //     model.addAttribute("message", "Vui lòng chọn file!");
        //     return "admin/product/add-product";
        // } else {
        //     try {
        //         String uploadDir = context.getRealPath("/") + "resources" + File.separator+"imgs" + File.separator+"products";
        //         // InputStream inputStream = getClass().getClassLoader().getResourceAsStream(uploadDir);
        //         File uploadDirFile = new File(uploadDir);
        //         if (!uploadDirFile.exists()) {
        //             uploadDirFile.mkdirs();
        //         }
        //         String fileName = file.getOriginalFilename();
        //         String filePath = uploadDir + File.separator + fileName;
                
        //         file.transferTo(new File(filePath));
        //         System.out.println(filePath);
        //         book.setANH(fileName);
        //     } catch (Exception e) {
        //         model.addAttribute("message", "Lỗi lưu file!");
        //         return "admin/product/add-product";
        //     }
        // }
        String fileName = saveFile(file);
        if(fileName == null) {
            model.addAttribute("message", "File upload failed. Please try again.");
            return "admin/product/addproduct";
        }
        book.setANH(fileName);
        
        TypeBook type = typeBookService.getTypeBookByID(book.getTypebook().getMATL());
        Author author = authorService.getAuthorByID(book.getAuthor().getMATG());
        Producer producer = producerService.getProducerByID(book.getProducer().getMANXB());
        book.setTypebook(type);
        book.setAuthor(author);
        book.setProducer(producer);
        bookService.addBook(book);
        model.addAttribute("product", book);
        return "redirect:/admin/product.htm";
    }

    @RequestMapping(value = "/admin/product/{MASACH}/update")
    public String editProduct(ModelMap model, @PathVariable("MASACH") Integer MASACH) {
        Book book = bookService.getBookByID(MASACH);
        model.addAttribute("product", book);
        return "pages/admin/editproduct";
    }

    @RequestMapping(value = "/admin/product/{MASACH}/update/edit-product", method = RequestMethod.POST)
    public String saveEditProduct(ModelMap model, @ModelAttribute("book") Book book, 
    @RequestParam("file") MultipartFile file) {
        if (file.isEmpty()) {
            model.addAttribute("message", "Vui lòng chọn file!");
            return "admin/product/editproduct";
        } else {
            try {
                String uploadDir = context.getRealPath("/") + "resources" + File.separator+"imgs" + File.separator+"products";
                File uploadDirFile = new File(uploadDir);
                if (!uploadDirFile.exists()) {
                    uploadDirFile.mkdirs();
                }
                String fileName = file.getOriginalFilename();
                String filePath = uploadDir + File.separator + fileName;
                
                file.transferTo(new File(filePath));
                book.setANH(fileName);
            } catch (Exception e) {
                model.addAttribute("message", "Lỗi lưu file!");
                return "admin/product/editproduct";
            }
        }

        TypeBook type = typeBookService.getTypeBookByID(book.getTypebook().getMATL());
        Author author = authorService.getAuthorByID(book.getAuthor().getMATG());
        Producer producer = producerService.getProducerByID(book.getProducer().getMANXB());
        book.setTypebook(type);
        book.setAuthor(author);
        book.setProducer(producer);
        bookService.updateBook(book);
        model.addAttribute("product", book);
        return "redirect:/admin/product.htm";
    }

    @RequestMapping(value = "/admin/product/{MASACH}/delete")
    public String deleteCategory(ModelMap model, @PathVariable("MASACH") Integer MASACH) {
        Book book = bookService.getBookByID(MASACH);
        bookService.deleteBook(book);
        model.addAttribute("product", book);
        return "redirect:/admin/product.htm";
    }

    @RequestMapping(value = "/admin/product/search")
    public String searchBook(HttpServletRequest request, ModelMap model) {
        List<Book> book = bookService.searchBook(request.getParameter("searchInput"));
        model.addAttribute("books", book);
        return "pages/admin/product";
    }

    @RequestMapping(value = "/admin/product/add-category", method = RequestMethod.POST)
    public String saveNewCategory(ModelMap model, @ModelAttribute("category") TypeBook category) {
        typeBookService.addTypeBook(category);
        return "redirect:/admin/product/add-product.htm";
    }

    @RequestMapping(value = "/admin/product/add-author", method = RequestMethod.POST)
    public String saveNewAuthor(ModelMap model, @ModelAttribute("author") Author author) {
        authorService.addAuthor(author);
        return "redirect:/admin/product/add-product.htm";
    }

    @RequestMapping(value = "/admin/product/add-supplier", method = RequestMethod.POST)
    public String saveNewSupplier(ModelMap model, @ModelAttribute("supplier") Supplier supplier) {
        supplierService.addSupplier(supplier);
        return "redirect:/admin/product/add-product.htm";
    }

    @RequestMapping(value = "/admin/product/add-nxb", method = RequestMethod.POST)
    public String saveNewNXB(ModelMap model, @ModelAttribute("nxb") Producer nxb) {
        producerService.addNXB(nxb);
        return "redirect:/admin/product/add-product.htm";
    }

    public String saveFile(MultipartFile file) {
        String directory = "src/main/webapp/resources/imgs/products/";
        Path path = Paths.get(directory);
    
        try {
            // Ensure directory exists
            if (!Files.exists(path)) {
                Files.createDirectories(path);
            }
    
            // Get input stream and save file
            InputStream inputStream = file.getInputStream();
            Path filePath = path.resolve(file.getOriginalFilename());
            Files.copy(inputStream, filePath, StandardCopyOption.REPLACE_EXISTING);
    
            return file.getOriginalFilename();  // Return the file name to be set in the book object
        } catch (Exception e) {
            e.printStackTrace();
            return null;  // Return null to indicate failure
        }
    }
}
