package ptithcm.service;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ptithcm.bean.*;

@Repository
@SuppressWarnings("unchecked")
public class BillService {
    @Autowired
    SessionFactory factory;

    public List<Cart> getBill(int userId) {
        Session session = factory.getCurrentSession();
        String hql = "from Bill where bill_customer.MAKH = :id";
        Query query = session.createQuery(hql);

        query.setParameter("id", userId);

        List<Cart> list = query.list();
        return list;
    }
    
    public int insertBill(Cart cart) {
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

    
}
