package ptithcm.controller;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.hibernate.classic.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import ptithcm.bean.Book;
import java.util.List;

@Controller
public class IndexController {
    @Autowired
    SessionFactory factory;

    @RequestMapping("/home")
    public String home() {
        Session session = factory.getCurrentSession();
        String hql = "from Book";
        Query query = session.createQuery(hql);
        @SuppressWarnings("unchecked")
        List<Book> list = query.list();
        for (Book b : list) {
            System.out.println(b.getId());
        }
        return "home";
    }
}
