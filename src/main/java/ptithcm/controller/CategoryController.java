package ptithcm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import ptithcm.bean.TypeBook;
import ptithcm.service.TypeBookService;

import java.util.List;

@Controller
@RequestMapping("/admin/category")
public class CategoryController {
    @Autowired
    private TypeBookService typeBookService;

    @RequestMapping("")
    public String categoryList(ModelMap model) {
        List<TypeBook> category = typeBookService.getAllTypeBooks();
        model.addAttribute("categories", category);
        return "pages/admin/category";
    }

    @RequestMapping(value = "add-category")
    public String addCategory(ModelMap model) {
        TypeBook typebook = new TypeBook();
        model.addAttribute("category", typebook);
        return "pages/admin/addcategory";
    }

    @RequestMapping(value = "add-category", method = RequestMethod.POST)
    public String saveNewCategory(ModelMap model, @RequestParam("TENTL") String TENTL) {
        TypeBook typebook = new TypeBook(null, TENTL);
        typeBookService.addTypeBook(typebook);
        model.addAttribute("category", typebook);
        return "redirect:/admin/category.htm";
    }
}
