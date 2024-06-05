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
    @ModelAttribute("categories")
    public List<TypeBook> getAllTypeBooks() {
        Session session = factory.getCurrentSession();
        String hql = "from TypeBook";
        Query query = session.createQuery(hql);
        List<TypeBook> list = query.list();
        return list;
    }

    @Transactional
    @ModelAttribute("categories")
    public TypeBook getTypeBookByID(int MATL){
        Session session = factory.getCurrentSession();
        String hql = "from TypeBook where MATL = :MATL";
        Query query = session.createQuery(hql);
        query.setParameter("MATL", MATL);

        return (TypeBook) query.list().get(0);
    }

    @Transactional
    @ModelAttribute("categories")
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

    @Transactional
    @ModelAttribute("categories")
    public List<TypeBook> searchTypeBook(String keywords){
        Session session = factory.getCurrentSession();
        String hql = "from TypeBook where TENTL like :keywords";
        Query query = session.createQuery(hql);
        query.setParameter("keywords", "%" + keywords + "%");

        List<TypeBook> list = query.list();
		return list;
    }

    @Transactional
    @ModelAttribute("categories")
    public TypeBook addTypeBook(TypeBook type) {
        Session session = factory.openSession();
        Transaction t = session.beginTransaction();

        try{
            session.save(type);
            t.commit();
        } catch (Exception e) {
            t.rollback();
        } finally {
            session.close();
        }
        return type;
    }

    @Transactional
    @ModelAttribute("categories")
    public TypeBook updateTypeBook(TypeBook type){
        Session session = factory.openSession();
        Transaction t = session.beginTransaction();

        try{
            session.update(type);
            t.commit();
        } catch (Exception e) {
			t.rollback();
        } finally {
			session.close();
		}
		return type;
    }

    @Transactional
    @ModelAttribute("categories")
    public TypeBook deleteTypeBook(TypeBook type) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();

		try {
			session.delete(type);
			t.commit();
		} catch (Exception e) {
			e.printStackTrace();
			t.rollback();
		} finally {
			session.close();
		}
		return type;
	}
}
