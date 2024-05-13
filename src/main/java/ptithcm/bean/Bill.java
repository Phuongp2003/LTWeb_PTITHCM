package ptithcm.bean;

import java.util.*;

import javax.persistence.*;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "HoaDon")
public class Bill {
    @Id
    private int MAHD;// property
    @Temporal(TemporalType.DATE)
    @DateTimeFormat(pattern = "MM/dd/yyyy")
    private Date NGAYLAP;// property

    @ManyToOne
    @JoinColumn(name = "MANV")
    private Employee bill_employee;// property

    @ManyToOne
    @JoinColumn(name = "MAKH")
    private Customer bill_customer;// property

    @ManyToOne
    @JoinColumn(name = "IDGH")
    private Cart bill_cart;// property

    @OneToMany(mappedBy = "bill", fetch = FetchType.EAGER)
    private Collection<BillDetail> billdetails;

    public Bill() {
    }

    public Bill(int MAHD, Date NGAYLAP, Employee bill_employee, Customer bill_customer, Cart bill_cart) {
        this.MAHD = MAHD;
        this.NGAYLAP = NGAYLAP;
        this.bill_customer = bill_customer;
        this.bill_employee = bill_employee;
        this.bill_cart = bill_cart;
    }

    public int getMAHD() {
        return MAHD;
    }

    public void setMAHD(int mAHD) {
        MAHD = mAHD;
    }

    public Date getNGAYLAP() {
        return NGAYLAP;
    }

    public void setNGAYLAP(Date nGAYLAP) {
        NGAYLAP = nGAYLAP;
    }

    public Customer getBill_customer() {
        return bill_customer;
    }

    public void setBill_customer(Customer bill_customer) {
        this.bill_customer = bill_customer;
    }

    public Cart getBill_cart() {
        return bill_cart;
    }

    public void setBill_cart(Cart bill_cart) {
        this.bill_cart = bill_cart;
    }

    public Collection<BillDetail> getBilldetails() {
        return billdetails;
    }

    public void setBilldetails(Collection<BillDetail> billdetails) {
        this.billdetails = billdetails;
    }

    public Employee getBill_employee() {
        return bill_employee;
    }

    public void setBill_employee(Employee bill_employee) {
        this.bill_employee = bill_employee;
    }

}
