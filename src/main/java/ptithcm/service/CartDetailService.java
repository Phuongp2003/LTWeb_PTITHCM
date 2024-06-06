package ptithcm.service;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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
    public CartDetail getCartDetailByProductId(int cartId, int productId) {
        Session session = factory.getCurrentSession();
        String hql = "FROM CartDetail cd WHERE cd.cartdetail_cart.IDGH = :cartId and cd.cartdetail_book.MASACH = :productId";
        Query query = session.createQuery(hql);
        query.setParameter("cartId", cartId);
        query.setParameter("productId", productId);
        CartDetail product = (CartDetail) query.list().get(0);
        return product;
    }

    @Transactional
    @ModelAttribute("totalitem")
    public int getTotalItem(int userId) {
        // Session session = factory.getCurrentSession();
        // String hql = "SELECT cd.cart_customer.MAKH, SUM(cd.SOLUONG) FROM CartDetail
        // cd WHERE cd.cart_customer.MAKH = :id GROUP BY cd.cart_customer.MAKH";
        // Query query = session.createQuery(hql);

        // query.setParameter("id", userId);
        // int num = (int) query.list().get(0);
        // if (query.list().get(0) != null) {
        // System.out.println(num);
        // return num;
        // }

        // return -1;
        List<CartDetail> list = getCartDetail(userId);
        int num = 0;
        for (CartDetail detail : list) {
            num += detail.getSOLUONG();
        }
        return num;
    }

    @Transactional
    @ModelAttribute("totalmoney")
    public double getTotalMoney(int userId) {
        // Session session = factory.getCurrentSession();
        // String hql = "select sum(cd.SOLUONG*(cd.cartdetail_book.GIA)) from CartDetail
        // cd where cd.cartdetail_cart.IDGH = :userId";
        // Query query = session.createQuery(hql);

        // query.setParameter("id", userId);
        // if (query.list().get(0) != null)
        // return (double) query.list().get(0);

        ///////////////
        // List<CartDetail> list = getCartDetail(userId);
        // int money = 0;
        // for (CartDetail detail : list) {
        // if (detail.getCHON() == 1) {
        // money += (detail.getSOLUONG() * detail.getCartdetail_book().getGIA());
        // }

        // }
        // return money;
        ////////////////////
        Session session = factory.getCurrentSession();
        String hql = "SELECT sum(cd.SOLUONG * cd.DONGIA) " +
                "FROM CartDetail cd " +
                "WHERE cd.CHON = 1 AND cd.cartdetail_cart.IDGH = :userId " +
                "GROUP BY cd.cartdetail_cart.IDGH";
        Query query = session.createQuery(hql);
        query.setParameter("userId", userId);

        List<Double> result = query.list();
        if (result != null && !result.isEmpty()) {
            return result.get(0);
        }

        return 0.0;

    }

    @Transactional
    @ModelAttribute("detail")
    public CartDetail addDetail(CartDetail detail) {
        Session session = factory.openSession();
        Transaction t = session.beginTransaction();

        try {
            session.save(detail);
            t.commit();
        } catch (Exception e) {
            t.rollback();
        } finally {
            session.close();
        }
        return detail;
    }

    // @Transactional
    // @ModelAttribute("detail")
    // public CartDetail editDetail(CartDetail detail) {
    // Session session = factory.openSession();
    // Transaction t = session.beginTransaction();
    // try {
    // session.update(b);
    // t.commit();
    // } catch (Exception e) {
    // t.rollback();
    // return 0;
    // } finally {
    // session.close();
    // }
    // return 1;
    // }
    //
    @Transactional
    @ModelAttribute("detail")
    public CartDetail updateDetail(CartDetail detail) {
        Session session = factory.openSession();
        Transaction t = session.beginTransaction();

        try {
            session.update(detail);
            t.commit();
        } catch (Exception e) {
            t.rollback();
        } finally {
            session.close();
        }
        return detail;
    }

    @Transactional
    @ModelAttribute("detail")
    public CartDetail deleteDetail(CartDetail detail) {
        Session session = factory.openSession();
        Transaction t = session.beginTransaction();

        try {
            session.delete(detail);
            t.commit();
        } catch (Exception e) {
            e.printStackTrace();
            t.rollback();
        } finally {
            session.close();
        }
        return detail;
    }

}