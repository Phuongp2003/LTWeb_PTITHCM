package ptithcm.bean;

import javax.persistence.*;
import java.util.*;

@Entity
@Table(name = "Sach")
public class Book {
	@Id
	@GeneratedValue
	private int MASACH;// property
	private String TENSACH;// property
	private Integer LANTAIBAN;// property

	@ManyToOne
	@JoinColumn(name = "MATL")
	private TypeBook typebook;// property

	@ManyToOne
	@JoinColumn(name = "MATG")
	private Author author;// property
	@ManyToOne
	@JoinColumn(name = "MANXB")
	private Producer producer;// property

	@OneToMany(mappedBy = "receivedbilldetail_book", fetch = FetchType.LAZY)
	private Collection<ReceivedBillDetail> receivedbilldetails;

	@OneToMany(mappedBy = "orderdetail_book", fetch = FetchType.LAZY)
	private Collection<OrderDetail> orderdetails;

	@OneToMany(mappedBy = "billdetail_book", fetch = FetchType.LAZY)
	private Collection<BillDetail> billdetails;

	@OneToMany(mappedBy = "cartdetail_book", fetch = FetchType.LAZY)
	private Collection<CartDetail> cartdetails;

	public Book() {
	}

	public Book(int MASACH, String TENSACH, Integer LANTAIBAN) {
		this.MASACH = MASACH;
		this.TENSACH = TENSACH;
		this.LANTAIBAN = LANTAIBAN;
	}

	public int getMASACH() {
		return MASACH;
	}

	public void setMASACH(int mASACH) {

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

	@Override
	public String toString() {
		return "Book{" +
				"MASACH='" + MASACH + '\'' +
				", TENSACH='" + TENSACH + '\'' +
				", LANTAIBAN=" + LANTAIBAN +
				'}';
	}
}
