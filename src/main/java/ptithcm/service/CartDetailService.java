package ptithcm.service;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.NoResultException;

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
@SuppressWarnings("unchecked")
public class CartDetailService {
    @Autowired
    SessionFactory factory;

    @Transactional
    public List<CartDetail> getBill(int cartId) {
        Session session = factory.getCurrentSession();
        String hql = "FROM CartDetail cd WHERE cd.cartdetail_cart.IDGH = :cartId AND cd.CHON = 1";
        Query query = session.createQuery(hql);
        query.setParameter("cartId", cartId);
        List<CartDetail> list = query.list();
        return list;
    }

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
    @ModelAttribute("cartdetail")
    public List<CartDetail> getAllCartDetail() {
        Session session = factory.getCurrentSession();
        String hql = "FROM CartDetail";
        Query query = session.createQuery(hql);
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

    // @Transactional
    // @ModelAttribute("cartbyproduct")
    // public CartDetail getCartDetailByProductId(int cartId, int productId) {
    // Session session = factory.getCurrentSession();
    // String hql = "FROM CartDetail cd WHERE cd.cartdetail_cart.IDGH = :cartId and
    // cd.cartdetail_book.MASACH = :productId";
    // Query query = session.createQuery(hql);
    // query.setParameter("cartId", cartId);
    // query.setParameter("productId", productId);
    // CartDetail product = (CartDetail) query.list().get(0);
    // return product;
    // }
    @Transactional
    @ModelAttribute("cartbyproduct")
    public CartDetail getCartDetailByProductId(int cartId, int productId) {
        Session session = factory.getCurrentSession();
        String hql = "FROM CartDetail cd WHERE cd.cartdetail_cart.IDGH = :cartId and cd.cartdetail_book.MASACH = :productId";
        Query query = session.createQuery(hql);
        query.setParameter("cartId", cartId);
        query.setParameter("productId", productId);

        try {
            CartDetail product = (CartDetail) query.uniqueResult();
            return product;
        } catch (NoResultException | IndexOutOfBoundsException e) {
            // Log the exception (optional)
            System.out.println("No result found for cartId: " + cartId + " and productId: " + productId);
            return null;
        }
    }

    @Transactional
    @ModelAttribute("totalitem")
    public int getTotalItem(int cartId) {
        // Session session = factory.getCurrentSession();
        // String hql = "SELECT cd.cartdetail_cart, SUM(cd.SOLUONG) " +
        // "FROM CartDetail cd " +
        // "WHERE cd.cartdetail_cart.IDGH = :id " +
        // "GROUP BY cd.cartdetail_cart";
        // Query query = session.createQuery(hql);

        // query.setParameter("id", cartId);
        // int num = (int) query.list().get(0);

        // return num;

        List<CartDetail> list = getCartDetail(cartId);
        int num = 0;
        for (CartDetail detail : list) {
            num += detail.getSOLUONG();
        }
        return num;
    }

    @Transactional
    @ModelAttribute("totalmoney")
    public double getTotalMoney(int userId) {
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

    // @Transactional
    // @ModelAttribute("deletedetail")
    // public int removeDetail(int userId) {
    // Session session = factory.getCurrentSession();
    // String hql = "DELETE FROM CartDetail " +
    // "WHERE chon = 1 AND cartdetail_cart.idgh = :userId";
    // Query query = session.createQuery(hql);
    // query.setParameter("userId", userId);

    // return 1; // Phương thức này sẽ trả về số lượng entities đã xóa.
    // }

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
