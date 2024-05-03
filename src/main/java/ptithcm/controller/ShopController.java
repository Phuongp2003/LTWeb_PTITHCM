package ptithcm.controller;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import ptithcm.bean.TypeBook;

@Transactional
@Controller
@RequestMapping("/shop")
@SuppressWarnings("unchecked")
public class ShopController {
    @Autowired
    SessionFactory factory;

    @RequestMapping
    public String shop(ModelMap model) {
        model.addAttribute("title", "PTITHCM All Books");
        model.addAttribute("type", "shop");
        Session session = factory.getCurrentSession();
        String hql = "FROM TypeBook";
        Query query = session.createQuery(hql);
        List<TypeBook> list = query.list();
        model.addAttribute("types", list);
        return "shop";
    }
}
