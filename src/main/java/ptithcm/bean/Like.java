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

    @OneToMany(mappedBy = "comment_like", fetch = FetchType.EAGER)
    private Collection<Like> comment_likes;

    @OneToMany(mappedBy = "post_like", fetch = FetchType.EAGER)
    private Collection<Like> post_likes;

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

    public Collection<Like> getComment_likes() {
        return comment_likes;
    }

    public void setComment_likes(Collection<Like> comment_likes) {
        this.comment_likes = comment_likes;
    }

    public Collection<Like> getPost_likes() {
        return post_likes;
    }

    public void setPost_likes(Collection<Like> post_likes) {
        this.post_likes = post_likes;
    }

}
