package ptithcm.bean;

// import java.util.Collection;

import javax.persistence.*;
@Entity
@Table(name = "KhoMoi")
public class Houseware {
    @Id
	@GeneratedValue
	private String MAKHOMOI;
	private String DIACHI;
	private String TENKHOMOI;


    // @OneToMany(mappedBy="author", fetch=FetchType.EAGER)
	// private Collection<Book> books;


    public Houseware(){};
    public Houseware(String MAKHOMOI, String DIACHI, String TENKHOMOI){
        this.MAKHOMOI = MAKHOMOI;
        this.DIACHI = DIACHI;
        this.TENKHOMOI = TENKHOMOI;

    }

    public String getMAKHOMOI() {
		return MAKHOMOI;
	}

	public void setMAKHOMOI(String MAKHOMOI) {
		this.MAKHOMOI = MAKHOMOI;
	}

    public String getDIACHI() {
		return DIACHI;
	}

	public void setDIACHI(String DIACHI) {
		this.DIACHI = DIACHI;
	}

    public String getTENKHOMOI() {
		return TENKHOMOI;
	}

	public void setTENKHOMOI(String TENKHOMOI) {
		this.TENKHOMOI = TENKHOMOI;
	}
}
