package ptithcm.service;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.ModelAttribute;

import ptithcm.bean.Customer;

// There is Customer services test for post
@Service
@SuppressWarnings("unchecked")
public class CustomerService {
    @Autowired
    SessionFactory factory;

    @Transactional
    @ModelAttribute("customers")
    public List<Customer> getAllCustomers() {
        Session session = factory.getCurrentSession();
        String hql = "from Customer";
        Query query = session.createQuery(hql);
        return query.list();
    }

    @Transactional
    @ModelAttribute("customers")
    public Customer getCustomerByID(String id) {
        Session session = factory.getCurrentSession();
        String hql = "from Customer where id = :id";
        Query query = session.createQuery(hql);
        query.setParameter("id", id);
        return (Customer) query.list().get(0);
    }
}
