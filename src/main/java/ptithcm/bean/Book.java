package ptithcm.bean;

import javax.persistence.*;

@Entity
@Table(name = "Sach")
public class Book {
	@Id
	@GeneratedValue
	private String MASACH;
	private String TENSACH;
	private Integer LANTAIBAN;

	public Book() {
	}

	public Book(String MASACH, String TENSACH, Integer LANTAIBAN, Integer Price) {
		this.MASACH = MASACH;
		this.TENSACH = TENSACH;
		this.LANTAIBAN = LANTAIBAN;
	}

	public String getMASACH() {
		return MASACH;
	}

	public void setMASACH(String MASACH) {
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

	@Override
	public String toString() {
		return "Book{" +
				"MASACH='" + MASACH + '\'' +
				", TENSACH='" + TENSACH + '\'' +
				", LANTAIBAN=" + LANTAIBAN +
				'}';
	}
}
