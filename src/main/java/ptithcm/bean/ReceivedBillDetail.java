package ptithcm.bean;

import javax.persistence.*;

@Entity
@Table(name = "CT_PhieuNhap")
public class ReceivedBillDetail {
    @EmbeddedId
    private ReceivedBillDetailPrimary id;// property

    @ManyToOne
    @MapsId("MAPN")
    @JoinColumn(name = "MAPN")
    private ReceivedBill receivedbill;

    @ManyToOne
    @MapsId("MASACH")
    @JoinColumn(name = "MASACH")
    private Book receivedbilldetail_book;

    private int SOLUONG;// property
    private Float DONGIA;// property

    public ReceivedBillDetail() {
    };

    public ReceivedBillDetail(
            ReceivedBillDetailPrimary id, int SOLUONG, Float DONGIA) {
        this.id = id;
        this.SOLUONG = SOLUONG;
        this.DONGIA = DONGIA;

    }

    public ReceivedBillDetailPrimary getId() {
        return id;
    }

    public void setId(ReceivedBillDetailPrimary id) {
        this.id = id;
    }

    public ReceivedBill getReceivedbill() {
        return receivedbill;
    }

    public void setReceivedbill(ReceivedBill receivedbill) {
        this.receivedbill = receivedbill;
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

    public Book getReceivedbilldetail_book() {
        return receivedbilldetail_book;
    }

    public void setReceivedbilldetail_book(Book receivedbilldetail_book) {
        this.receivedbilldetail_book = receivedbilldetail_book;
    }

}
