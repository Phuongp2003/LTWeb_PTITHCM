package ptithcm.bean;

import javax.persistence.*;

@Entity
@Table(name = "BaiViet")
public class Post {
    @Id
	@GeneratedValue
    @Column(name="MABV")
    private String id;
    @Column(name="TIEUDE")
    private String title;
    @Column(name="NOIDUNG")
    private String content;
    @Column(name="MOTA")
    private String desciption;
    @ManyToOne
	@JoinColumn(name="MAKH")
    private String author;
    @ManyToOne
	@JoinColumn(name="MANV")
    private String employee;

    public Post() {
    }

    public Post(String id, String title, String content, String description, String author,String employee) {
        this.id = id;
        this.title = title;
        this.content = content;
        this.desciption = description;
        this.author = author;
        this.employee = employee;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
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

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getEmployee() {
        return id;
    }

    public void setEmployee(String employee) {
        this.employee = employee;
    }

    @Override
    public String toString() {
        return "Post [id=" + id + ", title=" + title + ", content=" + content + ", description=" + desciption
                + ", author=" + author +  ", employee=" + employee +"]";
    }
}
