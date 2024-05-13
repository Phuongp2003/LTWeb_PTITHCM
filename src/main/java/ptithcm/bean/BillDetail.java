package ptithcm.bean;

import javax.persistence.*;

@Entity
@Table(name = "CT_HoaDon")
public class BillDetail {
    @EmbeddedId
    private BillDetailPrimary id;// property

    @ManyToOne
    @MapsId("MAHD")
    @JoinColumn(name = "MAHD")
    private Bill bill;

    @ManyToOne
    @MapsId("MASACH")
    @JoinColumn(name = "MASACH")
    private Book billdetail_book;

    private int SOLUONG;// property
    private Float DONGIA;// property

    public BillDetail() {
    }

    public BillDetail(BillDetailPrimary id, int SOLUONG, float DONGIA) {
        this.id = id;
        this.SOLUONG = SOLUONG;
        this.DONGIA = DONGIA;
    }

    public BillDetailPrimary getId() {
        return id;
    }

    public void setId(BillDetailPrimary id) {
        this.id = id;
    }

    public Bill getBill() {
        return bill;
    }

    public void setBill(Bill bill) {
        this.bill = bill;
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

    public Book getBilldetail_book() {
        return billdetail_book;
    }

    public void setBilldetail_book(Book billdetail_book) {
        this.billdetail_book = billdetail_book;
    }
    
}
