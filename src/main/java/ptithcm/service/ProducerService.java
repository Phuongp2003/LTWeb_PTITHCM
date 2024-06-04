package ptithcm.service;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.ModelAttribute;

import ptithcm.bean.Producer;
import java.util.List;

@Service
@SuppressWarnings("unchecked")
public class ProducerService {
    @Autowired
    SessionFactory factory;

    @Transactional
    @ModelAttribute("producers")
    public List<Producer> getAllProducers() {
        Session session = factory.getCurrentSession();
        String hql = "from Producer";
        Query query = session.createQuery(hql);
        return query.list();
    }

    @Transactional
    public Producer getProducerByID(int MANXB) {
        Session session = factory.getCurrentSession();
		String hql = "FROM Producer WHERE MANXB = :MANXB";
		Query query = session.createQuery(hql);
		query.setParameter("MANXB", MANXB);
		Producer list = (Producer) query.list().get(0);
		return list;
    }
}
