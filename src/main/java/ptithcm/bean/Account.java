package ptithcm.bean;

import java.util.Collection;

import javax.persistence.*;

@Entity
@Table(name = "TaiKhoan")
public class Account {
    @Id
    @GeneratedValue
    private Integer ID;// property
    private String USERNAME;// property
    private String PASSWORD;// property

    @OneToOne
    @MapsId
    @JoinColumn(name = "MANV")
    private Employee account_employee;// property

    @OneToOne
    @JoinColumn(name = "MAKH")
    private Customer account_customer;// property

    public Account() {
    };

    public Account(Integer ID, String USERNAME, String PASSWORD, Employee account_employee, Customer account_customer) {
        this.ID = ID;
        this.USERNAME = USERNAME;
        this.PASSWORD = PASSWORD;
        this.account_employee = account_employee;
        this.account_customer = account_customer;

    }

    public Integer getID() {
        return ID;
    }

    public void setID(Integer iD) {
        ID = iD;
    }

    public String getUSERNAME() {
        return USERNAME;
    }

    public void setUSERNAME(String uSERNAME) {
        USERNAME = uSERNAME;
    }

    public String getPASSWORD() {
        return PASSWORD;
    }

    public void setPASSWORD(String pASSWORD) {
        PASSWORD = pASSWORD;
    }

    public Customer getAccount_customer() {
        return account_customer;
    }

    public void setAccount_customer(Customer account_customer) {
        this.account_customer = account_customer;
    }

    public Employee getAccount_employee() {
        return account_employee;
    }

    public void setAccount_employee(Employee account_employee) {
        this.account_employee = account_employee;
    }

}
