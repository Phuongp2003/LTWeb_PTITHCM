package ptithcm.bean;

import java.util.*;
import javax.persistence.*;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "GioHang")
public class Cart {
    @Id
    private int IDGH;// property
    @Temporal(TemporalType.DATE)
    @DateTimeFormat(pattern = "dd/MM/yyyy")
    private Date NGAYLAP;// property

    @OneToOne
    @MapsId
    @JoinColumn(name = "MAKH")
    private Customer cart_customer;// property

    @OneToMany(mappedBy = "cartdetail_cart", fetch = FetchType.LAZY)
    private Collection<CartDetail> cartdetails;

    public Cart() {
    }

    public Cart(int IDGH, Date NGAYLAP, Customer cart_customer) {
        this.IDGH = IDGH;
        this.NGAYLAP = NGAYLAP;
        this.cart_customer = cart_customer;
    }

    public int getIDGH() {
        return IDGH;
    }

    public void setIDGH(int iDGH) {
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

    public Customer getCart_customer() {
        return cart_customer;
    }

    public void setCart_customer(Customer cart_customer) {
        this.cart_customer = cart_customer;
    }

}
