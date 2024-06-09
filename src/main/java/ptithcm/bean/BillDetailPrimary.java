package ptithcm.bean;

import java.io.Serializable;

import javax.persistence.*;

@Embeddable
public class BillDetailPrimary implements Serializable {
    @Column(name = "MAHD")
    int MAHD;

    @Column(name = "MASACH")
    int MASACH;

    public int getMAHD() {
        return MAHD;
    }

    public void setMAHD(int mAHD) {
        MAHD = mAHD;
    }

    public int getMASACH() {
        return MASACH;
    }

    public void setMASACH(int mASACH) {
        MASACH = mASACH;
    }
}
