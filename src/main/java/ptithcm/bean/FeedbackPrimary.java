package ptithcm.bean;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Embeddable
public class FeedbackPrimary implements Serializable {
    // @ManyToOne
    // @JoinColumn(name = "MAKH")
    // private Customer customer;

    // @ManyToOne
    // @JoinColumn(name = "MASACH")
    // private Book book;

    // public FeedbackPrimary(){}

    // public FeedbackPrimary(Customer customer, Book book) {
    //     this.customer = customer;
    //     this.book = book;
    // }
    
    // public Customer getCustomer() {
    //     return customer;
    // }
    // public void setCustomer(Customer customer) {
    //     this.customer = customer;
    // }
    // public Book getBook() {
    //     return book;
    // }
    // public void setBook(Book book) {
    //     this.book = book;
    // }

    @Column(name="MAKH")
    int MAKH;

    @Column(name="MASACH")
    int MASACH;

    public FeedbackPrimary() {}

    public FeedbackPrimary(int mAKH, int mASACH) {
        MAKH = mAKH;
        MASACH = mASACH;
    }

    public int getMAKH() {
        return MAKH;
    }

    public void setMAKH(int mAKH) {
        MAKH = mAKH;
    }

    public int getMASACH() {
        return MASACH;
    }

    public void setMASACH(int mASACH) {
        MASACH = mASACH;
    }
}
