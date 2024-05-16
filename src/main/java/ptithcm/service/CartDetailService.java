package ptithcm.service;

import java.util.ArrayList;
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

    @Transactional
    @ModelAttribute("cartdetail")
    public List<CartDetail> getCartDetail(int cartId) {
        Session session = factory.getCurrentSession();
        String hql = "FROM CartDetail cd WHERE cd.cartdetail_cart.IDGH = :cartId";
        Query query = session.createQuery(hql);
        query.setParameter("cartId", cartId);
        List<CartDetail> list = query.list();
        return list;
    }

    @Transactional
    @ModelAttribute("booksfromcart")
    public List<Book> getBooks(List<CartDetail> cartdetail) {
        List<Book> books = new ArrayList<>();
        for (int i = 0; i < cartdetail.size(); i++) {
            books.add(cartdetail.get(i).getCartdetail_book());
        }
        return books;
    }
    
    @Transactional
    @ModelAttribute("cartbyproduct")
    public CartDetail getCartByProductId(int cartId, int productId) {
        Session session = factory.getCurrentSession();
        String hql = "FROM CartDetail cd WHERE cd.cartdetail_cart.IDGH = :cartId and cd.cartdetail_book.MASACH = :productId";
        Query query = session.createQuery(hql);
        query.setParameter("cartId", cartId);
        query.setParameter("productId", productId);
        CartDetail product = (CartDetail)query.list().get(0);
        return product;
    }
    
    @Transactional
    @ModelAttribute("items")
    public List<Integer> getSelects() {
        List<Integer> selects= new ArrayList<>();
        selects.add(0);
        return selects;
    }
    

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