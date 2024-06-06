package ptithcm.bean;

import java.util.*;

import javax.persistence.*;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "BaiViet")
public class Post {
    @Id
    @GeneratedValue
    @Column(name = "MABV")
    private Integer id;
    @Column(name = "TIEUDE")
    private String title;// property
    @Column(name = "NOIDUNG")
    private String content;// property
    @Column(name = "MOTA")
    private String desciption;// property
    @ManyToOne
    @JoinColumn(name = "MAKH")
    private Customer author;

    @Temporal(TemporalType.DATE)
    @DateTimeFormat(pattern = "MM/dd/yyyy")
    private Date THOIGIANLAP;// property

    @ManyToOne
    @JoinColumn(name = "MANV")
    private Employee post_employee;// property

    public Post() {
    }

    public Post(Integer id, String title, String content, String description, Customer author, Employee employee) {
        this.id = id;
        this.title = title;
        this.content = content;
        this.desciption = description;
        this.author = author;
        this.post_employee = employee;
        this.THOIGIANLAP = new Date();
    }

    public Number getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String name) {
        this.title = name;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getDescription() {
        return desciption;
    }

    public void setDescription(String description) {
        this.desciption = description;
    }

    public String getDesciption() {
        return desciption;
    }

    public void setDesciption(String desciption) {
        this.desciption = desciption;
    }

    @Override
    public String toString() {
        return "Post [id=" + id + ", title=" + title + ", content=" + content + ", description=" + desciption
                + ", customer=" + author + ", employee=" + post_employee + "]";
    }

    public Customer getAuthor() {
        return author;
    }

    public void setAuthor(Customer author) {
        this.author = author;
    }

    public Employee getPost_employee() {
        return post_employee;
    }

    public void setPost_employee(Employee post_employee) {
        this.post_employee = post_employee;
    }

    public Date getTHOIGIANLAP() {
        return THOIGIANLAP;
    }

    public void setTHOIGIANLAP(Date tHOIGIANLAP) {
        THOIGIANLAP = tHOIGIANLAP;
    }
}
