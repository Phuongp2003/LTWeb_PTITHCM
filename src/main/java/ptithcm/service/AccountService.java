package ptithcm.service;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.ModelAttribute;

import ptithcm.bean.Account;
import ptithcm.bean.Book;

@Service
@SuppressWarnings("unchecked")
public class AccountService {
    @Autowired
    SessionFactory factory;

    @Transactional
    @ModelAttribute("books")
    public List<Account> getAllAccounts() {
        Session session = factory.getCurrentSession();
        String hql = "from Account";
        Query query = session.createQuery(hql);
        return query.list();
    }

    public Book getAccountByID(int ID) {
        Session session = factory.getCurrentSession();
		String hql = "FROM Account WHERE ID = :ID";
		Query query = session.createQuery(hql);
		query.setParameter("ID", ID);
		Book list = (Book) query.list().get(0);
		return list;
    }

    public int insertAccount(Account account) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.save(account);
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

    public int updateAccount(Account account) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.update(account);
			t.commit();
		} catch (Exception e) {
			t.rollback();
			return 0;
		} finally {
			session.close();
		}
		return 1;
	}

    public int deleteAccount(Account account) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();

		try {
			session.delete(account);
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

    public List<Account> searchAccount(String USERNAME) {
		Session session = factory.getCurrentSession();
		String hql = "FROM Account WHERE USERNAME LIKE :USERNAME";
		Query query = session.createQuery(hql);
		query.setParameter("name", "%" + USERNAME + "%");
		List<Account> list = query.list();
		return list;
	}
}
