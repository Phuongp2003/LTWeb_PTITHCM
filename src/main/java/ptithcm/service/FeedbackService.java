package ptithcm.service;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.ModelAttribute;

import ptithcm.bean.Feedback;

import java.util.List;

@Service
@Transactional
@SuppressWarnings("unchecked")
public class FeedbackService {
    @Autowired
    SessionFactory factory;

    public List<Feedback> getFeedbacksByBook(int MASACH) {
        Session session = factory.getCurrentSession();
        String hql = "FROM Feedback WHERE book.MASACH = :MASACH";
        Query query = session.createQuery(hql);
        query.setParameter("MASACH", MASACH);
        List<Feedback> list = query.list();
        return list;
    }
}
