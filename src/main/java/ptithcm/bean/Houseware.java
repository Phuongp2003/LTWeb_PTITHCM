package ptithcm.bean;

import java.util.Collection;
// import ptithcm.bean.*;
import javax.persistence.*;

@Entity
@Table(name = "KhoMoi")
public class Houseware {
	@Id
	@GeneratedValue
	private Integer MAKHOMOI;// property
	private String DIACHI;// property
	private String TENKHOMOI;// property

	@OneToMany(mappedBy = "receivedbill_houseware", fetch = FetchType.LAZY)
	private Collection<ReceivedBill> receivedbills;

	@OneToMany(mappedBy = "order_houseware", fetch = FetchType.LAZY)
	private Collection<Order> orders;

	public Houseware() {
	};

	public Houseware(Integer MAKHOMOI, String DIACHI, String TENKHOMOI) {
		this.MAKHOMOI = MAKHOMOI;
		this.DIACHI = DIACHI;
		this.TENKHOMOI = TENKHOMOI;

	}

	public Integer getMAKHOMOI() {
		return MAKHOMOI;
	}

	public void setMAKHOMOI(Integer MAKHOMOI) {
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
