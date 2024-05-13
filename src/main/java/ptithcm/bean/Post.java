package ptithcm.bean;

import javax.persistence.*;

@Entity
@Table(name = "BaiViet")
public class Post {
    @Id
    @GeneratedValue
    @Column(name = "MABV")
    private int id;
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
    private Employee employee;// property

    public Post() {
    }

    public Post(int id, String title, String content, String description, Customer author, Employee employee) {
        this.id = id;
        this.title = title;
        this.content = content;
        this.desciption = description;
        this.author = author;
        this.employee = employee;
    }

    public Number getId() {
        return id;
    }

    public void setId(int id) {
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

    public Employee getEmployee() {
        return employee;
    }

    public void setEmployee(Employee employee) {
        this.employee = employee;
    }

    @Override
    public String toString() {
        return "Post [id=" + id + ", title=" + title + ", content=" + content + ", description=" + desciption
                + ", customer=" + author + ", employee=" + employee + "]";
    }
}
