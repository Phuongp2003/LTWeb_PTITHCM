package ptithcm.bean;

import java.util.Collection;
import javax.persistence.*;

@Entity
@Table(name = "NhaXuatBan")
public class Producer {
	@Id
	@GeneratedValue
	private Integer MANXB;// property
	private String TENNXB;// property
	private String EMAIL;// property
	private String SDT;// property
	private String DIACHI;// property

	@OneToMany(mappedBy = "producer", fetch = FetchType.EAGER)
	private Collection<Book> books;

	public Producer() {
	};

	public Producer(Integer MANXB, String TENNXB, String EMAIL, String SDT, String DIACHI) {
		this.MANXB = MANXB;
		this.TENNXB = TENNXB;
		this.EMAIL = EMAIL;
		this.SDT = SDT;
		this.DIACHI = DIACHI;

	}

	public Integer getMANXB() {
		return MANXB;
	}

	public void setMANXB(Integer MANXB) {
		this.MANXB = MANXB;
	}

	public String getTENNXB() {
		return TENNXB;
	}

	public void setTENNXB(String TENNXB) {
		this.TENNXB = TENNXB;
	}

	public String getEMAIL() {
		return EMAIL;
	}

	public void setEMAIL(String EMAIL) {
		this.EMAIL = EMAIL;
	}

	public String getSDT() {
		return SDT;
	}

	public void setSDT(String SDT) {
		this.SDT = SDT;
	}

	public String getDIACHI() {
		return DIACHI;
	}

	public void setDIACHI(String DIACHI) {
		this.DIACHI = DIACHI;
	}

	public Collection<Book> getBooks() {
		return books;
	}

	public void setBooks(Collection<Book> books) {
		this.books = books;
	}
}
