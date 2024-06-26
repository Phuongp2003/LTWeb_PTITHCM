package ptithcm.bean;

import javax.persistence.*;

@Entity
@Table(name = "CT_GioHang")
public class CartDetail {
    @EmbeddedId
    private CartDetailPrimary id;// property

    @ManyToOne
    @MapsId("IDGH")
    @JoinColumn(name = "IDGH")
    private Cart cartdetail_cart;

    @ManyToOne
    @MapsId("MASACH")
    @JoinColumn(name = "MASACH")
    private Book cartdetail_book;

    private int SOLUONG;// property
    private Float DONGIA;// property
    private int CHON;// property

    public CartDetail() {
    }

    public CartDetail(CartDetailPrimary id, int SOLUONG, float DONGIA, int CHON) {

        this.id = id;
        this.SOLUONG = SOLUONG;
        this.DONGIA = DONGIA;
        this.CHON = CHON;
    }

    public CartDetailPrimary getId() {
        return id;
    }

    public void setId(CartDetailPrimary id) {
        this.id = id;
    }

    public int getSOLUONG() {
        return SOLUONG;
    }

    public void setSOLUONG(int sOLUONG) {
        SOLUONG = sOLUONG;
    }

    public Float getDONGIA() {
        return DONGIA;
    }

    public void setDONGIA(Float dONGIA) {
        DONGIA = dONGIA;
    }

    public Book getCartdetail_book() {
        return cartdetail_book;
    }

    public void setCartdetail_book(Book cartdetail_book) {
        this.cartdetail_book = cartdetail_book;
    }

    public Cart getCartdetail_cart() {
        return cartdetail_cart;
    }

    public void setCartdetail_cart(Cart cartdetail_cart) {
        this.cartdetail_cart = cartdetail_cart;
    }

    public int getCHON() {
        return CHON;
    }

    public void setCHON(int cHON) {
        CHON = cHON;
    }

    @Override
    public String toString() {
        return "CartDetail [id=" + id + ", cartdetail_cart=" + cartdetail_cart + ", cartdetail_book=" + cartdetail_book
                + ", SOLUONG=" + SOLUONG + ", DONGIA=" + DONGIA + ", CHON=" + CHON + "]";
    }

}
