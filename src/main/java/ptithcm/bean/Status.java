package ptithcm.bean;

import java.util.*;

import javax.persistence.*;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "TrangThai")
public class Status {
    @Id
    @GeneratedValue
    @Column(name = "MATT") // property
    private int MATT;
    @Column(name = "TENTT")
    private String TENTT;// property
    @OneToMany(mappedBy = "status", fetch = FetchType.EAGER)
    private Collection<Bill> bills;

    public int getMATT() {
        return MATT;
    }

    public void setMATT(int mATT) {
        MATT = mATT;
    }

    public String getTENTT() {
        return TENTT;
    }

    public void setTENTT(String tENTT) {
        TENTT = tENTT;
    }

    public Collection<Bill> getBills() {
        return bills;
    }

    public void setBills(Collection<Bill> bills) {
        this.bills = bills;
    }

    public Status() {
    }

    public Status(int mATT, String tENTT) {
        MATT = mATT;
        TENTT = tENTT;
    }

}