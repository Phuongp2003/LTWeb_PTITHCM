package ptithcm.bean;

import java.util.Collection;

import javax.persistence.*;

@Entity
@Table(name = "LuotThich")
public class Like {
    @Id
    @GeneratedValue
    private int MALT;// property
    private String CAMXUC;// property

    @OneToMany(mappedBy = "comment_like", fetch = FetchType.LAZY)
    private Collection<Comment> comment_likes;

    @OneToMany(mappedBy = "post_like", fetch = FetchType.LAZY)
    private Collection<Post> post_likes;

    public Like(int mALT, String cAMXUC) {
        MALT = mALT;
        CAMXUC = cAMXUC;
    }

    public int getMALT() {
        return MALT;
    }

    public void setMALT(int mALT) {
        MALT = mALT;
    }

    public String getCAMXUC() {
        return CAMXUC;
    }

    public void setCAMXUC(String cAMXUC) {
        CAMXUC = cAMXUC;
    }

    public Collection<Comment> getComment_likes() {
        return comment_likes;
    }

    public void setComment_likes(Collection<Comment> comment_likes) {
        this.comment_likes = comment_likes;
    }

    public Collection<Post> getPost_likes() {
        return post_likes;
    }

    public void setPost_likes(Collection<Post> post_likes) {
        this.post_likes = post_likes;
    }

}
