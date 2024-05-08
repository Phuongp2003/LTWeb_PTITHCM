package ptithcm.bean;

import java.io.Serializable;

import javax.persistence.*;

@Embeddable
public class CartDetailPrimary implements Serializable {
    @Column(name = "IDGH")
    String IDGH;

    @Column(name = "MASACH")
    String MASACH;

    public CartDetailPrimary() {
    }

    public CartDetailPrimary(String IDGH, String MASACH) {
        this.IDGH = IDGH;
        this.MASACH = MASACH;

    }

    public String getIDGH() {
        return IDGH;
    }

    public void setIDGH(String iDGH) {
        IDGH = iDGH;
    }

    public String getMASACH() {
        return MASACH;
    }

    public void setMASACH(String mASACH) {
        MASACH = mASACH;
    }
}
