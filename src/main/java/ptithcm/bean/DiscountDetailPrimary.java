package ptithcm.bean;

import java.io.Serializable;

import javax.persistence.*;

@Embeddable
public class DiscountDetailPrimary implements Serializable {
    @Column(name = "MAKM")
    String MAKM;

    @Column(name = "MASACH")
    String MASACH;

    public DiscountDetailPrimary() {
    }

    public DiscountDetailPrimary(String MAKM, String MASACH) {
        this.MAKM = MAKM;
        this.MASACH = MASACH;

    }

    public String getMAKM() {
        return MAKM;
    }

    public void setMAKM(String mAKM) {
        MAKM = mAKM;
    }

    public String getMASACH() {
        return MASACH;
    }

    public void setMASACH(String mASACH) {
        MASACH = mASACH;
    }
    
    
}
