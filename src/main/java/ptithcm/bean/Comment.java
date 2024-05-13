package ptithcm.bean;

import java.util.*;
import javax.persistence.*;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "BinhLuan")
public class Comment {
    @Id
    @GeneratedValue
    @Column(name = "MABL")
    private int id;// property
    @Column(name = "NOIDUNG")
    private String title;// property

    @Temporal(TemporalType.DATE)
    @DateTimeFormat(pattern = "MM/dd/yyyy")
    private Date THOIGIANLAP;// property

    @ManyToOne
    @JoinColumn(name = "MABV")
    private Post post;// property

    @ManyToOne
    @JoinColumn(name = "MATK")
    private Account account;// property

    @ManyToOne
    @JoinColumn(name = "MALT")
    private Like comment_like;// property

    public Comment(int id, String title, Date tHOIGIANLAP, Post post, Account account, Like comment_like) {
        this.id = id;
        this.title = title;
        THOIGIANLAP = tHOIGIANLAP;
        this.post = post;
        this.account = account;
        this.comment_like = comment_like;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Date getTHOIGIANLAP() {
        return THOIGIANLAP;
    }

    public void setTHOIGIANLAP(Date tHOIGIANLAP) {
        THOIGIANLAP = tHOIGIANLAP;
    }

    public Post getPost() {
        return post;
    }

    public void setPost(Post post) {
        this.post = post;
    }

    public Account getAccount() {
        return account;
    }

    public void setAccount(Account account) {
        this.account = account;
    }

    public Like getComment_like() {
        return comment_like;
    }

    public void setComment_like(Like comment_like) {
        this.comment_like = comment_like;
    }

}
