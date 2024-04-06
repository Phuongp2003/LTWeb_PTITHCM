package ptithcm.bean;

public class Post {
    private String id;
    private String title;
    private String content;
    private String author;

    public Post() {
    }

    public Post(String id, String title, String content, String author) {
        this.id = id;
        this.title = title;
        this.content = content;
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

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    @Override
    public String toString() {
        return "Post [Id=" + id + ", Title=" + title + ", Content=" + content + ", Author=" + author + "]";
    }
}
