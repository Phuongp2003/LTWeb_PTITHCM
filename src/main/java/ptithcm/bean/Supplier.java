
package ptithcm.bean;

import java.util.Collection;
import javax.persistence.*;


@Entity
@Table(name = "NhaCungCap")
public class Supplier {
    @Id
	@GeneratedValue
	private Integer MANCC;// property
	private String TENNCC;// property
	private String EMAIL;// property
    private String SDT;// property
    private String DIACHI;// property

	@OneToMany(mappedBy="producer", fetch=FetchType.EAGER)
	private Collection<Book> books;

    public Supplier(Integer MANCC, String TENNCC, String EMAIL, String SDT, String DIACHI, Collection<Book> books) {
        this.MANCC = MANCC;
        this.TENNCC = TENNCC;
        this.EMAIL = EMAIL;
        this.SDT = SDT;
        this.DIACHI = DIACHI;
        this.books = books;
    }

    public Integer getMANCC() {
        return MANCC;
    }

    public void setMANCC(Integer mANCC) {
        MANCC = mANCC;
    }

    public String getTENNCC() {
        return TENNCC;
    }

    public void setTENNCC(String tENNCC) {
        TENNCC = tENNCC;
    }

    public String getEMAIL() {
        return EMAIL;
    }

    public void setEMAIL(String eMAIL) {
        EMAIL = eMAIL;
    }

    public String getSDT() {
        return SDT;
    }

    public void setSDT(String sDT) {
        SDT = sDT;
    }

    public String getDIACHI() {
        return DIACHI;
    }

    public void setDIACHI(String dIACHI) {
        DIACHI = dIACHI;
    }

    public Collection<Book> getBooks() {
        return books;
    }

    public void setBooks(Collection<Book> books) {
        this.books = books;
    }

    
}

