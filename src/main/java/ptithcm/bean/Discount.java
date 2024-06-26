package ptithcm.bean;

import java.util.*;

import javax.persistence.*;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "KhuyenMai")
public class Discount {
    @Id
    @GeneratedValue
    private Integer MAKM;// property
    private String TENKM;// property
    @Temporal(TemporalType.DATE)
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date NGAYBD;// property

    @Temporal(TemporalType.DATE)
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date NGAYKT;// property

    @OneToMany(mappedBy = "discountdetail_discount", fetch = FetchType.LAZY)
    private Collection<DiscountDetail> discountdetails;

    public Discount() {
    };

    public Discount(String TENKM, Date NGAYBD, Date NGAYKT) {
        this.TENKM = TENKM;
        this.NGAYBD = NGAYBD;
        this.NGAYKT = NGAYKT;
    }

    public Discount(Integer id, String TENKM, Date NGAYBD, Date NGAYKT) {
        this.MAKM = id;
        this.TENKM = TENKM;
        this.NGAYBD = NGAYBD;
        this.NGAYKT = NGAYKT;
    }

    public Integer getMAKM() {
        return MAKM;
    }

    public void setMAKM(Integer mAKM) {
        MAKM = mAKM;
    }

    public String getTENKM() {
        return TENKM;
    }

    public void setTENKM(String tENKM) {
        TENKM = tENKM;
    }

    public Date getNGAYBD() {
        return NGAYBD;
    }

    public void setNGAYBD(Date nGAYBD) {
        NGAYBD = nGAYBD;
    }

    public Date getNGAYKT() {
        return NGAYKT;
    }

    public void setNGAYKT(Date nGAYKT) {
        NGAYKT = nGAYKT;
    }

    public Collection<DiscountDetail> getDiscountdetails() {
        return discountdetails;
    }

    public void setDiscountdetails(Collection<DiscountDetail> discountdetails) {
        this.discountdetails = discountdetails;
    }

    @Override
    public String toString() {
        return "Discount [MAKM=" + MAKM + ", TENKM=" + TENKM + ", NGAYBD=" + NGAYBD + ", NGAYKT=" + NGAYKT + "]";
    }

}
