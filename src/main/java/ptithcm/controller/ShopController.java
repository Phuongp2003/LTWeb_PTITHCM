package ptithcm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import ptithcm.bean.TypeBook;
import ptithcm.service.TypeBookService;

import java.util.List;

@Controller
@RequestMapping("/shop")
public class ShopController {
    @Autowired
    private TypeBookService typeBookService;

    @RequestMapping("")
    public String shop(ModelMap model) {
        model.addAttribute("title", "PTITHCM All Books");
        List<TypeBook> types = typeBookService.getAllTypeBooks();
        System.out.println(types);
        model.addAttribute("types", types);
        return "shop";
    }

    @RequestMapping(value = "typebook/{MATL}")
    public String typebook(ModelMap model, @PathVariable("MATL") String MATL) {
        model.addAttribute("type", typeBookService.getTypeBookByID(MATL));
        return "typebook";
    }
}
