package ptithcm.service;

import java.util.List;

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
public class StatusService {
    @Autowired
    SessionFactory factory;

    @Transactional
    @ModelAttribute("statuslist")
    public List<Status> getAllStatus() {
        Session session = factory.getCurrentSession();
        String hql = "FROM Status";
        Query query = session.createQuery(hql);

        List<Status> list = query.list();
        return list;
    }
}
