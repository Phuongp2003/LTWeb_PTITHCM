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
    public List<Post> getPostsByUserIDP(int id) {
        Session session = factory.getCurrentSession();
        String hql = "from Post where author.MAKH = :id";
        Query query = session.createQuery(hql);
        query.setParameter("id", id);
        List<Post> res = query.list();
        return res;
    }

    @Transactional
    @ModelAttribute("posts")
    public Post createPost(Post post) {
        Session session = factory.openSession();
        Transaction transaction = session.beginTransaction();
        try {
            session.save(post);
            transaction.commit();
        } catch (Exception e) {
            transaction.rollback();
        } finally {
            session.close();
        }
        return post;
    }

    @Transactional
    @ModelAttribute("posts")
    public Post editPost(Post post) {
        Session session = factory.openSession();
        Transaction transaction = session.beginTransaction();
        try {
            session.update(post);
            transaction.commit();
        } catch (Exception e) {
            transaction.rollback();
        } finally {
            session.close();
        }
        return post;
    }

    @Transactional
    @ModelAttribute("posts")
    public Post removePost(Post post) {
        Session session = factory.openSession();
        Transaction transaction = session.beginTransaction();
        try {
            session.delete(post);
            transaction.commit();
        } catch (Exception e) {
            transaction.rollback();
        } finally {
            session.close();
        }
        return post;
    }

    @Transactional
    @ModelAttribute("posts")
    public List<Post> getPostsNeedApprove() {
        Session session = factory.getCurrentSession();
        String hql = "from Post where post_employee is null";
        Query query = session.createQuery(hql);
        List<Post> res = query.list();

        return res;
    }

    @Transactional
    @ModelAttribute("posts")
    public List<Post> getPostsApproved() {
        Session session = factory.getCurrentSession();
        String hql = "from Post where post_employee is not null and rejectReason is null";
        Query query = session.createQuery(hql);
        List<Post> res = query.list();

        return res;
    }
}
