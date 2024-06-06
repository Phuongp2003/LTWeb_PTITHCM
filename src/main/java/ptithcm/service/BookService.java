package ptithcm.service;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.ModelAttribute;

import ptithcm.bean.Book;

import java.util.List;

@Service
@SuppressWarnings("unchecked")
public class BookService {
    @Autowired
    SessionFactory factory;

    @Transactional
    @ModelAttribute("books")
    public List<Book> getAllBooks() {
        Session session = factory.getCurrentSession();
        String hql = "from Book";
        Query query = session.createQuery(hql);
        return query.list();
    }

	@Transactional
    @ModelAttribute("books")
    public List<Book> getBooksByCategory(int MATL) {
        Session session = factory.getCurrentSession();
        String hql = "FROM Book WHERE typebook.MATL = :MATL";
        Query query = session.createQuery(hql);
        query.setParameter("MATL", MATL);
        List<Book> list = query.list();
        return list;
    }

    @Transactional
    @ModelAttribute("books")
    public Book getBookByID(int MASACH) {
        Session session = factory.getCurrentSession();
		String hql = "FROM Book WHERE MASACH = :MASACH";
		Query query = session.createQuery(hql);
		query.setParameter("MASACH", MASACH);
		Book list = (Book) query.list().get(0);
		return list;
    }

	@Transactional
	@ModelAttribute("books")
    public Book addBook(Book b) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.save(b);
			t.commit();
		} catch (Exception e) {
			System.out.println(e);
			t.rollback();
		} finally {
			session.close();
		}
		return b;
	}

	@Transactional
	@ModelAttribute("books")
	public Book updateBook(Book b) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.update(b);
			t.commit();
		} catch (Exception e) {
			t.rollback();
		} finally {
			session.close();
		}
		return b;
	}

	@Transactional
	@ModelAttribute("books")
	public Book deleteBook(Book b) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();

		try {
			session.delete(b);
			t.commit();
		} catch (Exception e) {
			e.printStackTrace();
			t.rollback();
		} finally {
			session.close();
		}
		return b;
	}

	@Transactional
	@ModelAttribute("books")
	public List<Book> getBooksByPriceDesc() {
		Session session = factory.getCurrentSession();
		String hql = "FROM Book b ORDER BY b.GIA DESC";
		Query query = session.createQuery(hql);
		return query.list();
	}

	@Transactional
	@ModelAttribute("books")
	public List<Book> getBooksByPriceAsc() {
		Session session = factory.getCurrentSession();
		String hql = "FROM Book b ORDER BY b.GIA ASC";
		Query query = session.createQuery(hql);
		return query.list();
	}

	@Transactional
	@ModelAttribute("books")
	public List<Book> getBooksByPriceDescAndType(int MATL) {
		Session session = factory.getCurrentSession();
		String hql = "FROM Book b WHERE typebook.MATL = :MATL ORDER BY b.GIA DESC";
		Query query = session.createQuery(hql);
        query.setParameter("MATL", MATL);
        List<Book> list = query.list();
        return list;
	}

	@Transactional
	@ModelAttribute("books")
	public List<Book> getBooksByPriceAscAndType(int MATL) {
		Session session = factory.getCurrentSession();
		String hql = "FROM Book b WHERE typebook.MATL = :MATL ORDER BY b.GIA ASC";
		Query query = session.createQuery(hql);
        query.setParameter("MATL", MATL);
        List<Book> list = query.list();
        return list;
	}

	@Transactional
	@ModelAttribute("books")
	public List<Book> searchBook(String keywords) {
		Session session = factory.getCurrentSession();
		String hql = "FROM Book WHERE TENSACH LIKE :keywords";
		Query query = session.createQuery(hql);
		query.setParameter("keywords", "%" + keywords + "%");
		List<Book> list = query.list();
		return list;
	}
}