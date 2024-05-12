package ptithcm.bean;

import java.util.Collection;

import javax.persistence.*;

@Entity
@Table(name = "TacGia")
public class Author {
	@Id
	@GeneratedValue
	private int MATG;// property
	private String HO;// property
	private String TEN;// property
    private String EMAIL;// property

	@OneToMany(mappedBy = "author", fetch = FetchType.EAGER)
	private Collection<Book> books;

	public Author() {
	};

	public Author(int MATG, String HO, String TEN, String EMAIL) {
		this.MATG = MATG;
		this.HO = HO;
		this.TEN = TEN;
		this.EMAIL = EMAIL;

	}

	public int getMATG() {
		return MATG;
	}

	public void setMATG(int MATG) {
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
