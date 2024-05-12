package ptithcm.bean;

import java.io.Serializable;

import javax.persistence.*;

@Embeddable
public class OrderDetailPrimary implements Serializable {
    @Column(name = "MADDH")
    String MADDH;

    @Column(name = "MASACH")
    String MASACH;

    public OrderDetailPrimary() {
    }

    public OrderDetailPrimary(String MADDH, String MASACH) {
        this.MADDH = MADDH;
        this.MASACH = MASACH;

    }

    public String getMADDH() {
        return MADDH;
    }

    public void setMADDH(String mADDH) {
        MADDH = mADDH;
    }

    public String getMASACH() {
        return MASACH;
    }

    public void setMASACH(String mASACH) {
        MASACH = mASACH;
    }
}
