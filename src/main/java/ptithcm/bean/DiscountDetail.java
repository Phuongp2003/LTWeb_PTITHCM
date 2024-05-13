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

    public DiscountDetail(DiscountDetailPrimary id, Book discountdetail_book, int TYLE) {
        this.id = id;
        this.discountdetail_book = discountdetail_book;
        this.TYLE = TYLE;
    }
}
