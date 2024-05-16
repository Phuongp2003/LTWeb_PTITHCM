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
	public long getNumberBooksByCategory(int MATL) {
		Session session = factory.getCurrentSession();
		String hql = "SELECT count(b.MASACH) "
				+ "FROM Typebook as t, "
				+ "Book as b "
				+ "WHERE t.MATL = b.typebook.MATL "
				+ "AND t.MATL = " + MATL;
		
		Query query = session.createQuery(hql);
	
		long quantity = (long) query.uniqueResult();
		return quantity;
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

    public int insertBook(Book b) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.save(b);
			t.commit();
		} catch (Exception e) {
			System.out.println(e);
			t.rollback();
			return 0;
		} finally {
			session.close();
		}
		return 1;
	}

	public int updateBook(Book b) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.update(b);
			t.commit();
		} catch (Exception e) {
			t.rollback();
			return 0;
		} finally {
			session.close();
		}
		return 1;
	}

	public int deleteBook(Book b) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();

		try {
			session.delete(b);
			t.commit();
		} catch (Exception e) {
			e.printStackTrace();
			t.rollback();
			return 0;
		} finally {
			session.close();
		}
		return 1;
	}
	
	public List<Book> searchBook(String TENSACH) {
		Session session = factory.getCurrentSession();
		String hql = "FROM Book WHERE TENSACH LIKE :TENSACH";
		Query query = session.createQuery(hql);
		query.setParameter("name", "%" + TENSACH + "%");
		List<Book> list = query.list();
		return list;
	}
}
