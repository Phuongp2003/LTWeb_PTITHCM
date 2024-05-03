package ptithcm.bean;

import javax.persistence.*;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.*;

@Entity
@Table(name = "KhachHang")
public class Customer {
    @Id
	@GeneratedValue
	private String MAKH;
	private String HO;
	private String TEN;
    private String EMAIL;
	private String SDT;
    private Boolean GIOTINH;
    @Temporal(TemporalType.DATE)
    @DateTimeFormat(pattern = "MM/dd/yyyy")
    private Date NGAYSINH;
    @OneToMany(mappedBy="author", fetch=FetchType.EAGER)
	private Collection<Post> posts;

    public Customer(){};
    public Customer(String MAKH, String HO, String TEN, String EMAIL, String SDT, Boolean GIOTINH, Date NGAYSINH){
        this.MAKH = MAKH;
        this.HO = HO;
        this.TEN = TEN;
        this.SDT = SDT;
        this.EMAIL = EMAIL;
        this.GIOTINH = GIOTINH;
        this.NGAYSINH = NGAYSINH;
        

    }

    public String getMAKH() {
		return MAKH;
	}

	public void setMAKH(String MAKH) {
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
    
    public Boolean getGIOTINH() {
		return GIOTINH;
	}

	public void setGIOTINH(Boolean GIOTINH) {
		this.GIOTINH = GIOTINH;
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

}