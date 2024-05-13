package ptithcm.service;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
