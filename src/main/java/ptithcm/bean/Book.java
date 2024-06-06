package ptithcm.bean;

import javax.persistence.*;
import java.util.*;

@Entity
@Table(name = "Sach")
public class Book {
	@Id
	@GeneratedValue
	private Integer MASACH;// property
	private String TENSACH;// property
	private Integer LANTAIBAN;// property
	private Float GIA;// property
	private String ANH;// property

	@ManyToOne
	@JoinColumn(name = "MATL")
	private TypeBook typebook;// property

	@ManyToOne
	@JoinColumn(name = "MATG")
	private Author author;// property

	@ManyToOne
	@JoinColumn(name = "MANXB")
	private Producer producer;// property

	@OneToMany(mappedBy = "book", fetch = FetchType.EAGER)
	private Collection<Feedback> feedback;

	@OneToMany(mappedBy = "receivedbilldetail_book", fetch = FetchType.LAZY)
	private Collection<ReceivedBillDetail> receivedbilldetails;

	@OneToMany(mappedBy = "orderdetail_book", fetch = FetchType.LAZY)
	private Collection<OrderDetail> orderdetails;

	@OneToMany(mappedBy = "billdetail_book", fetch = FetchType.LAZY)
	private Collection<BillDetail> billdetails;

	@OneToMany(mappedBy = "cartdetail_book", fetch = FetchType.LAZY)
	private Collection<CartDetail> cartdetails;

	@OneToMany(mappedBy = "discountdetail_book", fetch = FetchType.LAZY)
	private Collection<DiscountDetail> discountdetails;

	public Book() {
	}

	public Book(Integer mASACH, String tENSACH, Integer lANTAIBAN, Float gIA, String aNH, 
	TypeBook typebook, Author author, Producer producer) {
		MASACH = mASACH;
		TENSACH = tENSACH;
		LANTAIBAN = lANTAIBAN;
		GIA = gIA;
		ANH = aNH;
		this.typebook = typebook;
		this.author = author;
		this.producer = producer;
	}

	public Integer getMASACH() {
		return MASACH;
	}

	public void setMASACH(Integer mASACH) {
		MASACH = mASACH;
	}

	public String getTENSACH() {
		return TENSACH;
	}

	public void setTENSACH(String tENSACH) {
		TENSACH = tENSACH;
	}

	public Integer getLANTAIBAN() {
		return LANTAIBAN;
	}

	public void setLANTAIBAN(Integer lANTAIBAN) {
		LANTAIBAN = lANTAIBAN;
	}

	public TypeBook getTypebook() {
		return typebook;
	}

	public void setTypebook(TypeBook typebook) {
		this.typebook = typebook;
	}

	public Author getAuthor() {
		return author;
	}

	public void setAuthor(Author author) {
		this.author = author;
	}

	public Producer getProducer() {
		return producer;
	}

	public void setProducer(Producer producer) {
		this.producer = producer;
	}

	public Collection<Feedback> getFeedback() {
		return feedback;
	}

	public void setFeedback(Collection<Feedback> feedback) {
		this.feedback = feedback;
	}

	public Collection<CartDetail> getCartdetails() {
		return cartdetails;
	}

	public void setCartdetails(Collection<CartDetail> cartdetails) {
		this.cartdetails = cartdetails;
	}

	public Collection<ReceivedBillDetail> getReceivedbilldetails() {
		return receivedbilldetails;
	}

	public void setReceivedbilldetails(Collection<ReceivedBillDetail> receivedbilldetails) {
		this.receivedbilldetails = receivedbilldetails;
	}

	public Collection<OrderDetail> getOrderdetails() {
		return orderdetails;
	}

	public void setOrderdetails(Collection<OrderDetail> orderdetails) {
		this.orderdetails = orderdetails;
	}

	public Collection<BillDetail> getBilldetails() {
		return billdetails;
	}

	public void setBilldetails(Collection<BillDetail> billdetails) {
		this.billdetails = billdetails;
	}

	public Collection<DiscountDetail> getDiscountdetails() {
		return discountdetails;
	}

	public void setDiscountdetails(Collection<DiscountDetail> discountdetails) {
		this.discountdetails = discountdetails;
	}

	@Override
	public String toString() {
		return "Book{" +
				"MASACH='" + MASACH + '\'' +
				", TENSACH='" + TENSACH + '\'' +
				", LANTAIBAN=" + LANTAIBAN +
				'}';
	}

	public Float getGIA() {
		return GIA;
	}

	public void setGIA(Float gIA) {
		GIA = gIA;
	}

	public String getANH() {
		return ANH;
	}

	public void setANH(String aNH) {
		ANH = aNH;
	}
}
