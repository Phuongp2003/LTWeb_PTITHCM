package ptithcm.bean;

import javax.persistence.*;

import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.util.*;

@Entity
@Table(name="CT_DanhGia")
public class Feedback implements Serializable{
    @Id
    @ManyToOne
    @JoinColumn(name = "MAKH")
    private Customer customer;

    @Id
    @ManyToOne
    @JoinColumn(name = "MASACH")
    private Book book;

    private String NOIDUNG;

    @Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern="dd/MM/yyyy")
    private Date THOIGIAN;
    private Integer VOTE;
    
    public Customer getCustomer() {
        return customer;
    }
    public void setCustomer(Customer customer) {
        this.customer = customer;
    }
    public Book getBook() {
        return book;
    }
    public void setBook(Book book) {
        this.book = book;
    }
    public String getNOIDUNG() {
        return NOIDUNG;
    }
    public void setNOIDUNG(String nOIDUNG) {
        NOIDUNG = nOIDUNG;
    }
    public Date getTHOIGIAN() {
        return THOIGIAN;
    }
    public void setTHOIGIAN(Date tHOIGIAN) {
        THOIGIAN = tHOIGIAN;
    }
    public Integer getVOTE() {
        return VOTE;
    }
    public void setVOTE(Integer vOTE) {
        VOTE = vOTE;
    }

    
}
