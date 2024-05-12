package ptithcm.bean;

import java.io.Serializable;

import javax.persistence.*;

@Embeddable
public class ReceivedBillDetailPrimary implements Serializable {
    @Column(name = "MAPN")
    String MAPN;

    @Column(name = "MASACH")
    String MASACH;

    public ReceivedBillDetailPrimary() {
    }

    public ReceivedBillDetailPrimary(String MAPN, String MASACH) {
        this.MAPN = MAPN;
        this.MASACH = MASACH;
    }

    public String getMAPN() {
        return MAPN;
    }

    public void setMAPN(String mAPN) {
        MAPN = mAPN;
    }

    public String getMASACH() {
        return MASACH;
    }

    public void setMASACH(String mASACH) {
        MASACH = mASACH;
    }

}
