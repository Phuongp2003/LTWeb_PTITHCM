package ptithcm.bean;

import java.util.*;
import javax.persistence.*;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "GioHang")
public class Cart {
    @Id
    @GeneratedValue
    private Integer IDGH;// property
    @Temporal(TemporalType.DATE)
    @DateTimeFormat(pattern = "MM/dd/yyyy")
    private Date NGAYLAP;// property

    @OneToOne
    @MapsId
    @JoinColumn(name = "MAKH")
    private Customer cart_customer;// property

    @OneToMany(mappedBy = "cartdetail_cart", fetch = FetchType.LAZY)
    private Collection<CartDetail> cartdetails;

    public Cart() {
    }

    public Cart(Integer IDGH, Date NGAYLAP, Customer cart_customer) {
        this.IDGH = IDGH;
        this.NGAYLAP = NGAYLAP;
        this.cart_customer = cart_customer;
    }

    public Integer getIDGH() {
        return IDGH;
    }

    public void setIDGH(Integer iDGH) {
        IDGH = iDGH;
    }

    public Date getNGAYLAP() {
        return NGAYLAP;
    }

    public void setNGAYLAP(Date nGAYLAP) {
        NGAYLAP = nGAYLAP;
    }

    public Collection<CartDetail> getCartdetails() {
        return cartdetails;
    }

    public void setCartdetails(Collection<CartDetail> cartdetails) {
        this.cartdetails = cartdetails;
    }

    // public Collection<Bill> getBills() {
    // return bills;
    // }

    // public void setBills(Collection<Bill> bills) {
    // this.bills = bills;
    // }

    public Customer getCart_customer() {
        return cart_customer;
    }

    public void setCart_customer(Customer cart_customer) {
        this.cart_customer = cart_customer;
    }

}
