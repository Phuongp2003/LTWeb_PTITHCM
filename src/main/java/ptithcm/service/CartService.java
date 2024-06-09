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
		String hql = "FROM Cart c WHERE c.IDGH = :id";
		Query query = session.createQuery(hql);
		query.setParameter("id", id);
		Cart list = (Cart) query.list().get(0);
		return list;
	}

	@Transactional
	@ModelAttribute("cart")
	public Cart getCartByIdCustomer(int userId) {
		Session session = factory.getCurrentSession();
		String hql = "FROM Cart c " + "WHERE c.cart_customer.MAKH = :userId";
		Query query = session.createQuery(hql);
		query.setParameter("userId", userId);
		Cart list = (Cart) query.list().get(0);
		return list;
	}

	@Transactional
	@ModelAttribute("cart")
	public List<Cart> getCart() {
		Session session = factory.openSession();
		String hql = "FROM Cart";
		Query query = session.createQuery(hql);
		List<Cart> list = query.list();
		return list;
	}

	@Transactional
	@ModelAttribute("cart")
	public Integer getCartIdByIdCustomer(int userId) {
		Session session = factory.getCurrentSession();
		String hql = "SELECT c.IDGH FROM Cart c " +
				"WHERE c.cart_customer.MAKH = :id";
		Query query = session.createQuery(hql);
		query.setParameter("id", userId);

		// Sử dụng uniqueResult() trực tiếp
		Integer cartId = (Integer) query.uniqueResult();

		// Kiểm tra xem kết quả trả về có null không
		if (cartId != null) {
			return cartId;
		} else {
			// Trả về giá trị mặc định hoặc null tùy thuộc vào logic của bạn
			return null;
		}
	}

	@Transactional
	@ModelAttribute("cart")
	public Cart insertCart(Cart cart) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();

		try {
			session.save(cart);
			t.commit();
		} catch (Exception e) {
			// e.printStackTrace();
			t.rollback();
			// return 0;
		} finally {
			session.close();
		}
		return cart;
	}

	@Transactional
	@ModelAttribute("cart")
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

	@Transactional
	@ModelAttribute("cart")
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
