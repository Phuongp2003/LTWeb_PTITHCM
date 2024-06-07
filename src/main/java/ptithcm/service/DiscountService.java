package ptithcm.service;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.ModelAttribute;

import ptithcm.bean.Book;
import ptithcm.bean.Discount;
import ptithcm.bean.DiscountDetail;

@Service
@SuppressWarnings("unchecked")
public class DiscountService {
    @Autowired
    SessionFactory factory;

    @Transactional
    @ModelAttribute("discounts")
    public List<Discount> getAllDiscounts() {
        Session session = factory.getCurrentSession();

        String hql = "from Discount";
        Query query = session.createQuery(hql);

        List<Discount> list = query.list();
        return list;
    }

    @Transactional
    @ModelAttribute("discounts")
    public Discount getDiscountByID(int id) {
        Session session = factory.getCurrentSession();

        String hql = "from Discount where MAKM = :id";
        Query query = session.createQuery(hql);
        query.setParameter("id", id);
        return (Discount) query.list().get(0);
    }

    @Transactional
    @ModelAttribute("discounts")
    public List<Discount> getDiscountsByBookID(String id) {
        Session session = factory.getCurrentSession();
        String hql = "from Discount where MASACH = :id";
        Query query = session.createQuery(hql);
        query.setParameter("id", id);
        List<Discount> res = query.list();
        return res;
    }

    @Transactional
    @ModelAttribute("discounts")
    public Discount createDiscount(Discount discount) {
        Session session = factory.openSession();
        Transaction transaction = session.beginTransaction();
        try {
            session.save(discount);
            transaction.commit();
            return discount;
        } catch (Exception e) {
            transaction.rollback();
            System.out.println(e);
            return null;
        } finally {
            session.close();
        }
    }

    @Transactional
    @ModelAttribute("discounts")
    public Discount updateDiscount(Discount discount) {
        Session session = factory.openSession();
        Transaction transaction = session.beginTransaction();
        try {
            session.update(discount);
            transaction.commit();
            return discount;
        } catch (Exception e) {
            transaction.rollback();
            return null;
        } finally {
            session.close();
        }
    }

    @Transactional
    @ModelAttribute("discounts")
    public void deleteDiscount(Discount discount) {
        Session session = factory.openSession();
        Transaction transaction = session.beginTransaction();
        try {
            session.delete(discount);
            transaction.commit();
        } catch (Exception e) {
            transaction.rollback();
            System.out.println(e);
        } finally {
            session.close();
        }
    }

    @Transactional
    @ModelAttribute("discounts")
    public void applyDiscount(Discount discount, Book book, Integer tile) {
        Session session = factory.openSession();
        Transaction transaction = session.beginTransaction();
        try {
            DiscountDetail link = new DiscountDetail(discount, book, tile);
            session.save(link);
            transaction.commit();
        } catch (Exception e) {
            transaction.rollback();
        } finally {
            session.close();
        }
    }

    @Transactional
    @ModelAttribute("discounts")
    public void removeDiscount(Discount discount, Book book) {
        Session session = factory.openSession();
        Transaction transaction = session.beginTransaction();
        try {
            String hql = "select from DiscountDetail where discountdetail_discount = :discount and discountdetail_book = :book";
            Query query = session.createQuery(hql);
            query.setParameter("discount", discount);
            query.setParameter("book", book);
            DiscountDetail link = (DiscountDetail) query.list().get(0);
            session.delete(link);
            transaction.commit();
        } catch (Exception e) {
            transaction.rollback();
        } finally {
            session.close();
        }
    }

    @Transactional
    @ModelAttribute("discounts")
    public Integer getDiscountTile(Discount discount, Book book) {
        Session session = factory.getCurrentSession();
        String hql = "select TYLE from DiscountDetail where discountdetail_discount = :discount and discountdetail_book = :book";
        Query query = session.createQuery(hql);
        query.setParameter("discount", discount);
        query.setParameter("book", book);
        return (Integer) query.list().get(0);
    }

    @Transactional
    @ModelAttribute("discounts")
    public List<DiscountDetail> getDiscountDetails(Discount discount) {
        Session session = factory.getCurrentSession();
        String hql = "from DiscountDetail where discountdetail_discount = :discount";
        Query query = session.createQuery(hql);
        query.setParameter("discount", discount);
        return query.list();
    }

}
