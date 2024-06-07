package ptithcm.bean;

import javax.persistence.*;

@Entity
@Table(name = "CT_KhuyenMai")
public class DiscountDetail {
    @EmbeddedId
    private DiscountDetailPrimary id;// property

    @ManyToOne
    @MapsId("MAKM")
    @JoinColumn(name = "MAKM")
    private Discount discountdetail_discount;

    @ManyToOne
    @MapsId("MASACH")
    @JoinColumn(name = "MASACH")
    private Book discountdetail_book;

    // @SuppressWarnings("unused")
    private int TYLE;// property

    public DiscountDetail() {
    }

    public DiscountDetail(Discount discount, Book book, int TYLE) {
        this.discountdetail_discount = discount;
        this.discountdetail_book = book;
        this.TYLE = TYLE;
    }

    public Discount getDiscountdetail_discount() {
        return discountdetail_discount;
    }

    public void setDiscountdetail_discount(Discount discountdetail_discount) {
        this.discountdetail_discount = discountdetail_discount;
    }

    public Book getDiscountdetail_book() {
        return discountdetail_book;
    }

    public void setDiscountdetail_book(Book discountdetail_book) {
        this.discountdetail_book = discountdetail_book;
    }

    public int getTYLE() {
        return TYLE;
    }

    public void setTYLE(int tYLE) {
        TYLE = tYLE;
    }

    @Override
    public String toString() {
        return "DiscountDetail [discountdetail_book=" + discountdetail_book + ", discountdetail_discount="
                + discountdetail_discount + ", TYLE=" + TYLE + "]";
    }

}
