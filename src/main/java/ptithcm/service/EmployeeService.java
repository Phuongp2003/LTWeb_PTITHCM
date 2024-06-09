package ptithcm.service;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.ModelAttribute;

import ptithcm.bean.Employee;

@Service
public class EmployeeService {
    @Autowired
    SessionFactory factory;

    @Transactional
    @ModelAttribute("employee")
    public Employee getEmployeeById(int id) {
        Session session = factory.getCurrentSession();
        String hql = "from Employee where MANV = :id";
        Query query = session.createQuery(hql);
        query.setParameter("id", id);
        return (Employee) query.list().get(0);
    }

    @Transactional
    @ModelAttribute("employee")
    public Employee updateEmployee(Employee employee) {
        Session session = factory.openSession();
        Transaction transaction = session.beginTransaction();
        try {
            session.update(employee);
            transaction.commit();
            return employee;
        } catch (Exception e) {
            transaction.rollback();
            return null;
        } finally {
            session.close();
        }
    }
}
