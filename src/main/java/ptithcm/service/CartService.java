package ptithcm.service;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.ModelAttribute;

import ptithcm.bean.*;

@Repository
// @SuppressWarnings("unchecked")
public class CartService {

	@Autowired
	SessionFactory factory;

	@Transactional
	@ModelAttribute("cart")
	public Cart getCartById(int id) {
		Session session = factory.getCurrentSession();
		String hql = "FROM Cart WHERE IDGH = :id";
		Query query = session.createQuery(hql);
		query.setParameter("id", id);
		Cart list = (Cart) query.list().get(0);
		return list;
	}

	@Transactional
	@ModelAttribute("cartbyuserid")
	public Cart getCartByIdCustomer(int userId) {
		Session session = factory.getCurrentSession();
		String hql = "FROM Cart WHERE cart_customer.MAKH = :id";
		Query query = session.createQuery(hql);
		query.setParameter("id", userId);
		Cart list = (Cart) query.list().get(0);
		return list;
	}

	public int insertCart(Cart cart) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();

		try {
			session.save(cart);
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

	public int updateCart(Cart cart) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();

		try {
			session.update(cart);
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

	public int deleteCart(Cart cart) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();

		try {
			session.delete(cart);
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

}