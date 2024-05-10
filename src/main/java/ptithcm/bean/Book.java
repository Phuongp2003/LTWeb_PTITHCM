package ptithcm.bean;

import javax.persistence.*;

@Entity
@Table(name = "Sach")
public class Book {
	@Id
	@GeneratedValue
	private int MASACH;
	private String TENSACH;
	private Integer LANTAIBAN;

	@ManyToOne
	@JoinColumn(name = "MATL")
	private TypeBook typebook;

	@ManyToOne
	@JoinColumn(name = "MATG")
	private Author author;

	@ManyToOne
	@JoinColumn(name = "MANXB")
	private Producer producer;

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

	public void setMASACH(int MASACH) {
		this.MASACH = MASACH;
	}

	public String getTENSACH() {
		return TENSACH;
	}

	public void setTENSACH(String TENSACH) {
		this.TENSACH = TENSACH;
	}

	public Integer getLANTAIBAN() {
		return LANTAIBAN;
	}

	public void setLANTAIBAN(Integer LANTAIBAN) {
		this.LANTAIBAN = LANTAIBAN;
	}

	public TypeBook getTypeBook() {
		return typebook;
	}

	public void setTypeBook(TypeBook typebook) {
		this.typebook = typebook;
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
