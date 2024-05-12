package ptithcm.service;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.ModelAttribute;

import ptithcm.bean.TypeBook;

import java.util.List;

@Service
@SuppressWarnings("unchecked")
public class TypeBookService {
    @Autowired
    SessionFactory factory;

    @Transactional
    @ModelAttribute("types")
    public List<TypeBook> getAllTypeBooks() {
        Session session = factory.getCurrentSession();
        String hql = "from TypeBook";
        Query query = session.createQuery(hql);
        List<TypeBook> list = query.list();
        return list;
    }

    public TypeBook getTypeBookByID(String MATL){
        Session session = factory.getCurrentSession();
        String hql = "from TypeBook where MATL = :MATL";
        Query query = session.createQuery(hql);
        query.setParameter("MATL", MATL);

        TypeBook list = (TypeBook) query.list().get(0);
        return list;
    }

    public TypeBook getTypeBookByName(String TENTL){
        TypeBook type;
        try{
            Session session = factory.getCurrentSession();
            String hql = "from TypeBook where TENTL = :TENTL";
            Query query = session.createQuery(hql);
            query.setParameter("TENTL", TENTL);

            TypeBook list = (TypeBook) query.list().get(0);
            return list;
        } catch (Exception e) {
			type = null;
		}
		return type;
    }

    public List<TypeBook> searchTypeBook(String TENTL){
        Session session = factory.getCurrentSession();
        String hql = "from TypeBook where TENTL like :TENTL";
        Query query = session.createQuery(hql);
        query.setParameter("TENTL", "%" + TENTL + "%");

        List<TypeBook> list = query.list();
		return list;
    }

    public int insertTypeBook(TypeBook type) {
        Session session = factory.openSession();
        Transaction t = session.beginTransaction();

        try{
            session.save(type);
            t.commit();
        } catch (Exception e) {
            t.rollback();
            return 0;
        } finally {
            session.close();
        }
        return 1;
    }

    public int updateTypeBook(TypeBook type){
        Session session = factory.openSession();
        Transaction t = session.beginTransaction();

        try{
            session.update(type);
            t.commit();
        } catch (Exception e) {
			t.rollback();
			return 0;
        } finally {
			session.close();
		}
		return 1;
    }

    public int deleteTypeBook(TypeBook type) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();

		try {
			session.delete(type);
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
