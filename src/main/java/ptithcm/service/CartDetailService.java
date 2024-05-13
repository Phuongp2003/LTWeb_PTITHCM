package ptithcm.service;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.ModelAttribute;

import ptithcm.bean.*;

@Repository
// @SuppressWarnings("unchecked")
public class CartDetailService {
    @Autowired
    SessionFactory factory;

    // public Cart getCartByProduct(int userId, int productId) {
    // Session session = factory.getCurrentSession();
    // String hql = "from Cart where cart_customer.MAKH = :userId and products.id =
    // :productId";
    // Query query = session.createQuery(hql);

    // query.setParameter("userId", userId);
    // query.setParameter("productId", productId);
    // Cart list = (Cart) query.list().get(0);
    // return list;
    // }

    // public double getTotalMoney(int userId) {
    // Session session = factory.getCurrentSession();
    // String hql = "select sum(quantity*(products.price -
    // products.price*products.discount/100)) from Cart where users.id = :id";
    // Query query = session.createQuery(hql);

    // query.setParameter("id", userId);
    // if (query.list().get(0) != null)
    // return (double) query.list().get(0);

    // return 0.0;
    // }
    // @Transactional
    // @ModelAttribute("cart")
    // public List<Book> getCartDetail(int userId) {
    // Session session = factory.getCurrentSession();
    // // String hql1 = "from Cart where IDGH = :userId";
    // // Query query1 = session.createQuery(hql1);
    // // query1.setParameter("id", userId);
    // // Cart cart = (Cart) query1.uniqueResult();
    // // System.out.println(cart.toString());
    // String hql = "select cd.cartdetail_book from CartDetail cd join cd.Cart c
    // WHERE cd.cartdetail_.IDGH = :userId";

    // Query query = session.createQuery(hql);

    // // query.setParameter("cart", cart);
    // query.setParameter("userId", userId);

    // @SuppressWarnings("unchecked")
    // List<Book> list = query.list();
    // System.out.println("in list");
    // return list;
    // }

    public long getTotalItem(int userId) {
        Session session = factory.getCurrentSession();
        String hql = "SELECT Sum(SOLUONG) FROM Cart cart join c.CartDetail cartdetail WHERE cart_customer.MAKH = :id ";
        Query query = session.createQuery(hql);
        System.out.println(userId);
        query.setParameter("id", userId);
        if (query.list().get(0) != null)
            return (long) query.list().get(0);

        return -1;
    }
}