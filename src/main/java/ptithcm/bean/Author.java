package ptithcm.bean;

import java.util.Collection;

import javax.persistence.*;

@Entity
@Table(name = "TacGia")
public class Author {
	@Id
	@GeneratedValue
	private String MATG;
	private String HO;
	private String TEN;
	private String EMAIL;

	@OneToMany(mappedBy = "author", fetch = FetchType.EAGER)
	private Collection<Book> books;

	public Author() {
	};

	public Author(String MATG, String HO, String TEN, String EMAIL) {
		this.MATG = MATG;
		this.HO = HO;
		this.TEN = TEN;
		this.EMAIL = EMAIL;

	}

	public String getMATG() {
		return MATG;
	}

	public void setMATG(String MATG) {
		this.MATG = MATG;
	}

	public String getHO() {
		return HO;
	}

	public void setHO(String HO) {
		this.HO = HO;
	}

	public String getTEN() {
		return TEN;
	}

	public void setTEN(String TEN) {
		this.TEN = TEN;
	}

	public String getEMAIL() {
		return EMAIL;
	}

	public void setEMAIL(String EMAIL) {
		this.EMAIL = EMAIL;
	}

	public Collection<Book> getBooks() {
		return books;
	}

	public void setBooks(Collection<Book> books) {
		this.books = books;
	}
}
