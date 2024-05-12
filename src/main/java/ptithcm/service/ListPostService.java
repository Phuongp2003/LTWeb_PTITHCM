package ptithcm.service;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
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
        Query query = session.createQuery(hql);

        List<Post> list = query.list();
        return list;
    }

    @Transactional
    @ModelAttribute("posts")
    public Post getPostByID(int id) {
        Session session = factory.getCurrentSession();
        String hql = "from Post where id = :id";
        Query query = session.createQuery(hql);
        query.setParameter("id", id);
        return (Post) query.list().get(0);
    }

    @Transactional
    @ModelAttribute("posts")
    public Post getPostsByUserIDP(int id) {
        Session session = factory.getCurrentSession();
        String hql = "from Post where user_id = :id";
        Query query = session.createQuery(hql);
        query.setParameter("id", id);
        return (Post) query.list().get(0);
    }

    @Transactional
    @ModelAttribute("posts")
    public Post createPost(Post post) {
        Session session = factory.getCurrentSession();
        String hql = "SELECT max(id) FROM Post";
        Query query = session.createQuery(hql);
        Integer maxID = (Integer) query.uniqueResult();
        post.setId(maxID != null ? maxID + 1 : 1);
        session.save(post);
        return post;
    }
}
