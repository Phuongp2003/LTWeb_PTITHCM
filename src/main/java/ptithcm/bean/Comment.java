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
    private String content;// property

    @Temporal(TemporalType.DATE)
    @DateTimeFormat(pattern = "MM/dd/yyyy")
    private Date THOIGIANLAP;// property

    @ManyToOne
    @JoinColumn(name = "MABV")
    private Post post;// property

    @ManyToOne
    @JoinColumn(name = "MATK")
    private Account account;// property

    public Comment() {}

    public Comment(int id, String title, Post post, Account account) {
        this.id = id;
        this.content = title;
        this.THOIGIANLAP = new Date();
        this.post = post;
        this.account = account;
    }

    public Comment(String title, Post post, Account account) {
        this.content = title;
        this.THOIGIANLAP = new Date();
        this.post = post;
        this.account = account;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
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

}
