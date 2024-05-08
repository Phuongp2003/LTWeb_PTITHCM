package ptithcm.bean;

import javax.persistence.*;

@Entity
@Table(name = "CT_DonDatHang")
public class OrderDetail {
    @EmbeddedId
    private OrderDetailPrimary id;// property

    @ManyToOne
    @MapsId("MADDH")
    @JoinColumn(name = "MADDH")
    private Order orderdetail_order;

    @ManyToOne
    @MapsId("MASACH")
    @JoinColumn(name = "MASACH")
    private Book orderdetail_book;

    private int SOLUONG;// property
    private float DONGIA;// property

    public OrderDetail() {
    }

    public OrderDetail(OrderDetailPrimary id, int SOLUONG, float DONGIA) {
        this.id = id;
        this.SOLUONG = SOLUONG;
        this.DONGIA = DONGIA;
    }

    public OrderDetailPrimary getId() {
        return id;
    }

    public void setId(OrderDetailPrimary id) {
        this.id = id;
    }

    public int getSOLUONG() {
        return SOLUONG;
    }

    public void setSOLUONG(int sOLUONG) {
        SOLUONG = sOLUONG;
    }

    public float getDONGIA() {
        return DONGIA;
    }

    public void setDONGIA(float dONGIA) {
        DONGIA = dONGIA;
    }

    public Order getOrderdetail_order() {
        return orderdetail_order;
    }

    public void setOrderdetail_order(Order orderdetail_order) {
        this.orderdetail_order = orderdetail_order;
    }

    public Book getOrderdetail_book() {
        return orderdetail_book;
    }

    public void setOrderdetail_book(Book orderdetail_book) {
        this.orderdetail_book = orderdetail_book;
    }
    
    
}
