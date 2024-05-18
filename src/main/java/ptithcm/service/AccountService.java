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

@Service
@SuppressWarnings("unchecked")
public class AccountService {
	@Autowired
	SessionFactory factory;

	@Transactional
	@ModelAttribute("accounts")
	public List<Account> getAllAccounts() {
		Session session = factory.getCurrentSession();
		String hql = "from Account";
		Query query = session.createQuery(hql);
		return query.list();
	}

	@Transactional
	@ModelAttribute("accounts")
	public Account getAccountByID(Integer ID) {
		Session session = factory.getCurrentSession();
		String hql = "FROM Account WHERE ID = :ID";
		Query query = session.createQuery(hql);
		query.setParameter("ID", ID);
		Account list = (Account) query.list().get(0);
		return list;
	}

	@Transactional
	@ModelAttribute("account")
	public Account getAccountByUsername(String username) {
		Session session = factory.getCurrentSession();
		String hql = "FROM Account WHERE USERNAME = :username";
		Query query = session.createQuery(hql);
		query.setParameter("username", username);
		Account list = (Account) query.list().get(0);
		return list;
	}

	@Transactional
	@ModelAttribute("accounts")
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

	@Transactional
	@ModelAttribute("accounts")
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

	@Transactional
	@ModelAttribute("accounts")
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

	@Transactional
	@ModelAttribute("accounts")
	public List<Account> searchAccount(String USERNAME) {
		Session session = factory.getCurrentSession();
		String hql = "FROM Account WHERE USERNAME LIKE :USERNAME";
		Query query = session.createQuery(hql);
		query.setParameter("name", "%" + USERNAME + "%");
		List<Account> list = query.list();
		return list;
	}
}
