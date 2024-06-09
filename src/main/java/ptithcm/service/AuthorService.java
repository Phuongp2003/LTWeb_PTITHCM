package ptithcm.service;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.ModelAttribute;

import ptithcm.bean.Author;

import java.util.List;

@Service
@Transactional
@SuppressWarnings("unchecked")
public class AuthorService {
    @Autowired
    SessionFactory factory;

    @ModelAttribute("authors")
    public List<Author> getAllAuthors() {
        Session session = factory.getCurrentSession();
        String hql = "from Author";
        Query query = session.createQuery(hql);
        return query.list();
    }

    public Author getAuthorByID(int MATG) {
        Session session = factory.getCurrentSession();
		String hql = "FROM Author WHERE MATG = :MATG";
		Query query = session.createQuery(hql);
		query.setParameter("MATG", MATG);
		Author list = (Author) query.list().get(0);
		return list;
    }

    public Author addAuthor(Author a) {
        Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.save(a);
			t.commit();
		} catch (Exception e) {
			System.out.println(e);
			t.rollback();
		} finally {
			session.close();
		}
		return a;
    }
}
