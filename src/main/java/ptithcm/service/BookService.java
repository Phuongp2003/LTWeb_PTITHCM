package ptithcm.service;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ptithcm.bean.Book;

import java.util.List;

@Service
@SuppressWarnings("unchecked")
public class BookService {
    @Autowired
    SessionFactory factory;

    @Transactional
    public List<Book> getAllBooks() {
        Session session = factory.getCurrentSession();
        String hql = "from Book";
        Query query = session.createQuery(hql);
        return query.list();
    }
}
