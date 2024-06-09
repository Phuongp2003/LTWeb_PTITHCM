package ptithcm.service;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ptithcm.bean.Supplier;
import java.util.List;

@Service
@Transactional
@SuppressWarnings("unchecked")
public class SupplierService {
    @Autowired
    SessionFactory factory;
    
    public List<Supplier> getAllSuppliers() {
        Session session = factory.getCurrentSession();
        String hql = "from Supplier";
        Query query = session.createQuery(hql);
        return query.list();
    }

    public Supplier getSupplierByID(int MANCC) {
        Session session = factory.getCurrentSession();
		String hql = "FROM Supplier WHERE MANCC = :MANCC";
		Query query = session.createQuery(hql);
		query.setParameter("MANCC", MANCC);
		Supplier list = (Supplier) query.list().get(0);
		return list;
    }

	public Supplier getSupplierByName(String TENNC) {
        Session session = factory.getCurrentSession();
        String hql = "from Supplier where TENNC = :TENNC";
        Query query = session.createQuery(hql);
        query.setParameter("TENNC", TENNC);

        Supplier list = (Supplier) query.uniqueResult();
        return list;
    }

    public Supplier addSupplier(Supplier s) {
        Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.save(s);
			t.commit();
		} catch (Exception e) {
			System.out.println(e);
			t.rollback();
		} finally {
			session.close();
		}
		return s;
    }
}
