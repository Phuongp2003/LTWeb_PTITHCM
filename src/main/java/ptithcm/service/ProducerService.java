package ptithcm.service;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.ModelAttribute;

import ptithcm.bean.Producer;
import ptithcm.bean.Supplier;

import java.util.List;

@Service
@Transactional
@SuppressWarnings("unchecked")
public class ProducerService {
    @Autowired
    SessionFactory factory;

    @ModelAttribute("producers")
    public List<Producer> getAllProducers() {
        Session session = factory.getCurrentSession();
        String hql = "from Producer";
        Query query = session.createQuery(hql);
        return query.list();
    }

    public Producer getProducerByID(int MANXB) {
        Session session = factory.getCurrentSession();
		String hql = "FROM Producer WHERE MANXB = :MANXB";
		Query query = session.createQuery(hql);
		query.setParameter("MANXB", MANXB);
		Producer list = (Producer) query.list().get(0);
		return list;
    }

	public Producer getProducerByName(String TENNXB) {
        Session session = factory.getCurrentSession();
        String hql = "from Producer where TENNXB = :TENNXB";
        Query query = session.createQuery(hql);
        query.setParameter("TENNXB", TENNXB);

        Producer list = (Producer) query.uniqueResult();
        return list;
    }

    public Producer addNXB(Producer nxb) {
        Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.save(nxb);
			t.commit();
		} catch (Exception e) {
			System.out.println(e);
			t.rollback();
		} finally {
			session.close();
		}
		return nxb;
    }
}
