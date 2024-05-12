package ptithcm.bean;

import javax.persistence.*;

import org.springframework.format.annotation.DateTimeFormat;
import java.util.*;

@Entity
@Table(name = "DonDatHang")
public class Order {
    @Id
    @GeneratedValue
    private int MADDH;// property
    @Temporal(TemporalType.DATE)
    @DateTimeFormat(pattern = "MM/dd/yyyy")
    private Date NGAYLAP;// property

    @ManyToOne
    @JoinColumn(name = "MANCC")
    private Supplier supplier;// property

    @ManyToOne
    @JoinColumn(name = "MANV")
    private Employee employee;// property

    @ManyToOne
    @JoinColumn(name = "MAKHOMOI")
    private Houseware order_houseware;// property

    @OneToOne(mappedBy = "receivedbill_order", cascade = CascadeType.ALL)
    @PrimaryKeyJoinColumn
    private ReceivedBill receivedbill;

    @OneToMany(mappedBy = "orderdetail_order", fetch = FetchType.EAGER)
    private Collection<OrderDetail> orderdetails;

    public Order() {
    }

    public Order(int MADDH, Date NGAYLAP, Supplier supplier, Employee employee, Houseware order_houseware) {
        this.MADDH = MADDH;
        this.NGAYLAP = NGAYLAP;
        this.supplier = supplier;
        this.employee = employee;
        this.order_houseware = order_houseware;
    }

    public int getMADDH() {
        return MADDH;
    }

    public void setMADDH(int mADDH) {
        MADDH = mADDH;
    }

    public Date getNGAYLAP() {
        return NGAYLAP;
    }

    public void setNGAYLAP(Date nGAYLAP) {
        NGAYLAP = nGAYLAP;
    }

    public Supplier getSupplier() {
        return supplier;
    }

    public void setSupplier(Supplier supplier) {
        this.supplier = supplier;
    }

    public Employee getEmployee() {
        return employee;
    }

    public void setEmployee(Employee employee) {
        this.employee = employee;
    }

    public ReceivedBill getReceivedbill() {
        return receivedbill;
    }

    public void setReceivedbill(ReceivedBill receivedbill) {
        this.receivedbill = receivedbill;
    }

    public Collection<OrderDetail> getOrderdetails() {
        return orderdetails;
    }

    public void setOrderdetails(Collection<OrderDetail> orderdetails) {
        this.orderdetails = orderdetails;
    }

    public Houseware getOrder_houseware() {
        return order_houseware;
    }

    public void setOrder_houseware(Houseware order_houseware) {
        this.order_houseware = order_houseware;
    }
    

}
