package ptithcm.bean;

import java.io.Serializable;

import javax.persistence.*;

@Embeddable
public class BillDetailPrimary implements Serializable {
    @Column(name = "MAHD")
    String MAHD;

    @Column(name = "MASACH")
    String MASACH;

    public String getMAHD() {
        return MAHD;
    }

    public void setMAHD(String mAHD) {
        MAHD = mAHD;
    }

    public String getMASACH() {
        return MASACH;
    }

    public void setMASACH(String mASACH) {
        MASACH = mASACH;
    }
}
