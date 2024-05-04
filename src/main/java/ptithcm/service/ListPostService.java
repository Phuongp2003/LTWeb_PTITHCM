package ptithcm.service;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.ModelAttribute;

import ptithcm.bean.Post;

@Service
@SuppressWarnings("unchecked")
public class ListPostService {
    @Autowired
    SessionFactory factory;

    @Transactional
    @ModelAttribute("posts")
    public List<Post> getAllPosts() {
        Session session = factory.getCurrentSession();
        String hql = "from Post";
        System.out.println(hql);
        Query query = session.createQuery(hql);
        System.out.println(query.list());
        return query.list();
    }
}
