package ptithcm.service;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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

    public Double getAverageVote(int MASACH) {
        Session session = factory.getCurrentSession();
        String hql = "SELECT CAST(avg(f.VOTE) AS double) FROM Feedback f WHERE f.book.MASACH = :MASACH";
        Query query = session.createQuery(hql);
        query.setParameter("MASACH", MASACH);
        Double averageVote = (Double) query.uniqueResult();
        return averageVote;
    }

    public Feedback getFeedbackById(int MAKH, int MASACH) {
		Session session = factory.getCurrentSession();
		String hql = "from Feedback where customer.MAKH = :MAKH and book.MASACH = :MASACH";
		Query query = session.createQuery(hql);

		query.setParameter("MAKH", MAKH);
		query.setParameter("MASACH", MASACH);
		Feedback list = (Feedback) query.uniqueResult();
		return list;	
	}

    public Feedback addFeedback(Feedback f) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.save(f);
			t.commit();
		} catch (Exception e) {
			System.out.println(e);
			t.rollback();
		} finally {
			session.close();
		}
		return f;
	}

    public Feedback updateFeedback(Feedback f) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.update(f);
			t.commit();
		} catch (Exception e) {
			t.rollback();
		} finally {
			session.close();
		}
		return f;
	}

    public Feedback deleteFeedback(Feedback f) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();

		try {
			session.delete(f);
			t.commit();
		} catch (Exception e) {
			e.printStackTrace();
			t.rollback();
		} finally {
			session.close();
		}
		return f;
	}
}
