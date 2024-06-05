package ptithcm.bean;

import java.io.Serializable;

import javax.persistence.*;

@Embeddable
public class CartDetailPrimary implements Serializable {
    @Column(name = "IDGH")
    int IDGH;

    @Column(name = "MASACH")
    int MASACH;

    public CartDetailPrimary() {
    }

    public CartDetailPrimary(int IDGH, int MASACH) {
        this.IDGH = IDGH;
        this.MASACH = MASACH;

    }

    public int getIDGH() {
        return IDGH;
    }

    public void setIDGH(int iDGH) {
        IDGH = iDGH;
    }

    public int getMASACH() {
        return MASACH;
    }

    public void setMASACH(int mASACH) {
        MASACH = mASACH;
    }

}