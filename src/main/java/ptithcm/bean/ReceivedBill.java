package ptithcm.bean;

import javax.persistence.*;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.*;

@Entity
@Table(name = "PhieuNhap")
public class ReceivedBill {
    @Id
    @GeneratedValue
    private String MAPN;// property
    @Temporal(TemporalType.DATE)
    @DateTimeFormat(pattern = "MM/dd/yyyy")
    private Date NGAYLAP;// property

    @ManyToOne
    @JoinColumn(name = "MAKHOMOI")
    private Houseware receivedbill_houseware;// property

    @ManyToOne
    @JoinColumn(name = "MANV")
    private Employee receivedbill_employee;// property

    @OneToOne
    @MapsId
    @JoinColumn(name = "MADDH")
    private Order receivedbill_order;// property

    @OneToMany(mappedBy = "receivedbill", fetch = FetchType.EAGER)
    private Collection<ReceivedBillDetail> receivedbilldetails;

    public ReceivedBill() {
    }

    public ReceivedBill(String MAPN, Date NGAYLAP, Houseware receivedbill_houseware, Employee receivedbill_employee, Order receivedbill_order) {
        this.MAPN = MAPN;
        this.NGAYLAP = NGAYLAP;
        this.receivedbill_houseware = receivedbill_houseware;
        this.receivedbill_order = receivedbill_order;
        this.receivedbill_employee = receivedbill_employee;
    }

    public String getMAPN() {
        return MAPN;
    }

    public void setMAPN(String mAPN) {
        MAPN = mAPN;
    }

    public Date getNGAYLAP() {
        return NGAYLAP;
    }

    public void setNGAYLAP(Date nGAYLAP) {
        NGAYLAP = nGAYLAP;
    }

    public Collection<ReceivedBillDetail> getReceivedbilldetails() {
        return receivedbilldetails;
    }

    public void setReceivedbilldetails(Collection<ReceivedBillDetail> receivedbilldetails) {
        this.receivedbilldetails = receivedbilldetails;
    }

    public Employee getReceivedbill_employee() {
        return receivedbill_employee;
    }

    public void setReceivedbill_employee(Employee receivedbill_employee) {
        this.receivedbill_employee = receivedbill_employee;
    }

    public Houseware getReceivedbill_houseware() {
        return receivedbill_houseware;
    }

    public void setReceivedbill_houseware(Houseware receivedbill_houseware) {
        this.receivedbill_houseware = receivedbill_houseware;
    }

    public Order getReceivedbill_order() {
        return receivedbill_order;
    }

    public void setReceivedbill_order(Order receivedbill_order) {
        this.receivedbill_order = receivedbill_order;
    }
    
    

}
