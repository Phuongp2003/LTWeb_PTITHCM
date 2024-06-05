package ptithcm.service;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.ModelAttribute;

import ptithcm.bean.Comment;
import ptithcm.bean.Post;

import java.util.List;



@Service
@SuppressWarnings("unchecked")
public class CommentService {
    @Autowired
    SessionFactory factory;

    @Transactional
    @ModelAttribute("comments")
    public List<Comment> getCommentsByIDPost(int id) {
        Session session = factory.getCurrentSession();
        String hql = "from Comment where post.id = :id";
        Query query = session.createQuery(hql);
        query.setParameter("id", id);

        List<Comment> list = query.list();
        return list;
    }

    @Transactional
    @ModelAttribute("posts")
    public List<Comment> getPostsByUserID(int id) {
        Session session = factory.getCurrentSession();
        String hql = "from Comment where account.ID = :id";
        Query query = session.createQuery(hql);
        query.setParameter("id", id);
        List<Comment> res = query.list();
        return res;
    }

    @Transactional
    @ModelAttribute("comments")
    public Comment createComment(Comment comment) {
        Session session = factory.openSession();
        Transaction transaction = session.beginTransaction();
        try {
            session.save(comment);
            transaction.commit();
        } catch (Exception e) {
            transaction.rollback();
        } finally {
            session.close();
        }
        return comment;
    }

    @Transactional
    @ModelAttribute("comment")
    public Comment editComment(Comment comment) {
        Session session = factory.openSession();
        Transaction transaction = session.beginTransaction();
        try {
            session.update(comment);
            transaction.commit();
        } catch (Exception e) {
            transaction.rollback();
        } finally {
            session.close();
        }
        return comment;
    }

    @Transactional
    @ModelAttribute("comments")
    public Comment removeComment(Comment comment) {
        Session session = factory.openSession();
        Transaction transaction = session.beginTransaction();
        try {
            session.delete(comment);
            transaction.commit();
        } catch (Exception e) {
            transaction.rollback();
        } finally {
            session.close();
        }
        return comment;
    }
}
