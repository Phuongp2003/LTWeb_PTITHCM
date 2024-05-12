package ptithcm.bean;

import javax.persistence.*;

@Entity
@Table(name = "BaiViet")
public class Post {
    @Id
    @GeneratedValue
    @Column(name = "MABV")
    private Number id;
    @Column(name = "TIEUDE")
    private String title;// property
    @Column(name = "NOIDUNG")
    private String content;// property
    @Column(name = "MOTA")
    private String desciption;// property
    @ManyToOne
    @JoinColumn(name = "MAKH")
    private Customer author;
    @ManyToOne
    @JoinColumn(name = "MANV")
    private Employee post_employee;// property

    public Post() {
    }

    public Post(Number id, String title, String content, String description, Customer author, Employee employee) {
        this.id = id;
        this.title = title;
        this.content = content;
        this.desciption = description;
        this.post_customer = post_customer;
        this.post_employee = post_employee;
    }

    public Number getId() {
        return id;
    }

    public void setId(Number id) {
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

    public void setContent(String description) {
        this.content = description;
    }

    public String getDescription() {
        return desciption;
    }

    public void setDescription(String description) {
        this.desciption = description;
    }

    public Customer getAuthor() {
        return author;
    }

    public void setAuthor(Customer author) {
        this.author = author;
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
                + ", customer=" + post_customer + ", employee=" + post_employee + "]";
    }

    public Customer getPost_customer() {
        return post_customer;
    }

    public void setPost_customer(Customer post_customer) {
        this.post_customer = post_customer;
    }

    public Employee getPost_employee() {
        return post_employee;
    }

    public void setPost_employee(Employee post_employee) {
        this.post_employee = post_employee;
    }
    
}
