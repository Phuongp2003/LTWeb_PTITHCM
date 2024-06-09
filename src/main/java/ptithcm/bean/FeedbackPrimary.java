package ptithcm.bean;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Embeddable;

@Embeddable
public class FeedbackPrimary implements Serializable {
    @Column(name="MAKH")
    int MAKH;

    @Column(name="MASACH")
    int MASACH;

    public FeedbackPrimary() {}

    public FeedbackPrimary(int mAKH, int mASACH) {
        MAKH = mAKH;
        MASACH = mASACH;
    }

    public int getMAKH() {
        return MAKH;
    }

    public void setMAKH(int mAKH) {
        MAKH = mAKH;
    }

    public int getMASACH() {
        return MASACH;
    }

    public void setMASACH(int mASACH) {
        MASACH = mASACH;
    }
}
