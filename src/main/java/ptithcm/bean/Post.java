package ptithcm.bean;

public class Post {
    private String id;
    private String title;
    private String content;
    private String desciption;
    private String author;

    public Post() {
    }

    public Post(String id, String title, String content, String description, String author) {
        this.id = id;
        this.title = title;
        this.content = content;
        this.desciption = description;
        this.author = author;
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

    @Override
    public String toString() {
        return "Post [id=" + id + ", title=" + title + ", content=" + content + ", description=" + desciption
                + ", author=" + author + "]";
    }
}
