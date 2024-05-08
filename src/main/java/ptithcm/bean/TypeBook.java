package ptithcm.bean;

import java.util.Collection;
import javax.persistence.*;

@Entity
@Table(name = "TheLoai")

public class TypeBook {
	@Id
	private String MATL;// property
	private String TENTL;// property

	@OneToMany(mappedBy = "typebook", fetch = FetchType.EAGER)
	private Collection<Book> books;

	public TypeBook() {
	};

	public TypeBook(String MATL, String TENTL) {
		this.MATL = MATL;
		this.TENTL = TENTL;
	}

	public String getMATL() {
		return MATL;
	}

	public void setMATL(String MATL) {
		this.MATL = MATL;
	}

	public String getTENTL() {
		return TENTL;
	}

	public void setTENTL(String TENTL) {
		this.TENTL = TENTL;
	}

	public Collection<Book> getBooks() {
		return books;
	}

	public void setBooks(Collection<Book> books) {
		this.books = books;
	}
}
