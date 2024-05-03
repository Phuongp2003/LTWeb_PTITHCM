package ptithcm.bean;

import javax.persistence.*;
import java.util.*;
import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "NhanVien")
public class Employee {
    @Id
	@GeneratedValue
	private String MANV;
	private String HO;
	private String TEN;
    private String CCCD;
	private String SDT;
    private String EMAIL;
    private Boolean GIOTINH;
    @Temporal(TemporalType.DATE)
    @DateTimeFormat(pattern = "MM/dd/yyyy")
    private Date NGAYSINH;
    @OneToMany(mappedBy="author", fetch=FetchType.EAGER)
	private Collection<Post> posts;

    public Employee(){};
    public Employee(String MANV, String HO, String TEN, String CCCD, String SDT, String EMAIL,Boolean GIOTINH){
        this.MANV = MANV;
        this.HO = HO;
        this.TEN = TEN;
        this.CCCD = CCCD;
        this.SDT = SDT;
        this.EMAIL = EMAIL;
        this.GIOTINH = GIOTINH;
        

    }

    public String getMANV() {
		return MANV;
	}

	public void setMANV(String MATG) {
		this.MANV = MANV;
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
    
    public String getCCCD() {
		return CCCD;
	}

	public void setCCCD(String CCCD) {
		this.CCCD = CCCD;
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
