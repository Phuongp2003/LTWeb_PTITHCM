package ptithcm.bean;

import javax.persistence.*;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.*;

@Entity
@Table(name = "KhachHang")
public class Customer {
	@Id
	@GeneratedValue
	private Integer MAKH;// property
	private String HO;// property
	private String TEN;// property
	private String EMAIL;// property
	private String SDT;// property
	private Boolean GIOITINH;// property
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "MM/dd/yyyy")
	private Date NGAYSINH;// property
	@OneToMany(mappedBy = "author", fetch = FetchType.EAGER)
	private Collection<Post> posts;

	@OneToOne(mappedBy = "account_customer", cascade = CascadeType.ALL)
	@PrimaryKeyJoinColumn
	private Account account;

	@OneToOne(mappedBy = "cart_customer", cascade = CascadeType.ALL)
	@PrimaryKeyJoinColumn
	private Cart cart;

	@OneToMany(mappedBy = "bill_customer", fetch = FetchType.LAZY)
	private Collection<Bill> bills;

	public Customer() {
	};

	public Customer(String HO, String TEN, String EMAIL, String SDT, Boolean GIOITINH, Date NGAYSINH) {
		this.HO = HO;
		this.TEN = TEN;
		this.SDT = SDT;
		this.EMAIL = EMAIL;
		this.GIOITINH = GIOITINH;
		this.NGAYSINH = NGAYSINH;

	}

	public Integer getMAKH() {
		return MAKH;
	}

	public void setMAKH(Integer MAKH) {
		this.MAKH = MAKH;
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

	public String getSDT() {
		return SDT;
	}

	public void setSDT(String SDT) {
		this.SDT = SDT;
	}

	public String getEMAIL() {
		return EMAIL;
	}

	public void setEMAIL(String EMAIL) {
		this.EMAIL = EMAIL;
	}

	public Boolean getGIOITINH() {
		return GIOITINH;

	}

	public void setGIOITINH(Boolean GIOITINH) {
		this.GIOITINH = GIOITINH;
	}

	public Date getNGAYSINH() {
		return NGAYSINH;
	}

	public void setNGAYSINH(Date NGAYSINH) {
		this.NGAYSINH = NGAYSINH;
	}

	public Collection<Post> getPosts() {
		return posts;
	}

	public void setPosts(Collection<Post> posts) {
		this.posts = posts;
	}

	// public Cart getCart() {
	// return cart;
	// }

	// public void setCart(Cart cart) {
	// this.cart = cart;
	// }

	// public Collection<Bill> getBills() {
	// return bills;
	// }

	// public void setBills(Collection<Bill> bills) {
	// this.bills = bills;
	// }

	public void setAccount(Account account) {
		this.account = account;
	}

	// public Cart getCart() {
	// return cart;
	// }

	// public void setCart(Cart cart) {
	// this.cart = cart;
	// }

	// public Collection<Bill> getBills() {
	// return bills;
	// }

	// public void setBills(Collection<Bill> bills) {
	// this.bills = bills;
	// }

	public String getFullname() {
		return HO + " " + TEN;
	}

}
