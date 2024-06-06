package ptithcm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import ptithcm.bean.Book;
import ptithcm.bean.Feedback;
import ptithcm.bean.TypeBook;
import ptithcm.bean.Author;
import ptithcm.bean.Producer;
import ptithcm.service.BookService;
import ptithcm.service.TypeBookService;
import ptithcm.service.AuthorService;
import ptithcm.service.ProducerService;
import ptithcm.service.FeedbackService;

import java.io.File;
import java.util.List;

import javax.servlet.ServletContext;

@Controller
public class BookController {
    @Autowired
    private BookService bookService;

    @Autowired
    private TypeBookService typeBookService;

    @Autowired
    private AuthorService authorService;

    @Autowired
    private ProducerService producerService;

    @Autowired
    private FeedbackService feedbackService;

    @Autowired
	ServletContext context;

    @RequestMapping(value = "/book/{MASACH}")
    public String book(ModelMap model, @PathVariable("MASACH") int MASACH) {
        Book book = bookService.getBookByID(MASACH);
        List<Feedback> feedback = feedbackService.getFeedbacksByBook(MASACH);
        model.addAttribute("book", book);
        model.addAttribute("feedback", feedback);
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
    public String saveNewProduct(ModelMap model, @ModelAttribute("book") Book book, 
    @RequestParam("file") MultipartFile file) {
        if (file.isEmpty()) {
            model.addAttribute("message", "Vui lòng chọn file!");
            return "admin/product/add-product";
        } else {
            try {
                String uploadDir = context.getRealPath("/files/");
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
                return "admin/product/add-product";
            }
        }

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
                String uploadDir = context.getRealPath("/files/");
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
}
