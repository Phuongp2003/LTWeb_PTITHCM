package ptithcm.bean;

import java.util.Date;

public class RegistrationForm {
    private Account account;
    private Customer customer;

    public RegistrationForm() {
        this.account = new Account();
        this.customer = new Customer();
    }

    public Account getAccount() {
        return account;
    }

    public void setAccount(Account account) {
        this.account = account;
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    public void setUSERNAME(String username) {
        this.account.setUSERNAME(username);
    }

    public void setPASSWORD(String password) {
        this.account.setPASSWORD(password);
    }

    public void setHO(String ho) {
        this.customer.setHO(ho);
    }

    public void setTEN(String ten) {
        this.customer.setTEN(ten);
    }

    public void setEMAIL(String email) {
        this.customer.setEMAIL(email);
    }

    public void setSDT(String SDT) {
        this.customer.setSDT(SDT);
    }

    public void setGIOITINH(Boolean gioitinh) {
        this.customer.setGIOITINH(gioitinh);
    }

    public void setNGAYSINH(Date ngaysinh) {
        this.customer.setNGAYSINH(ngaysinh);
    }

    public String getUSERNAME() {
        return this.account.getUSERNAME();
    }

    public String getPASSWORD() {
        return this.account.getPASSWORD();
    }

    public String getHO() {
        return this.customer.getHO();
    }

    public String getTEN() {
        return this.customer.getTEN();
    }

    public String getEMAIL() {
        return this.customer.getEMAIL();
    }

    public String getSDT() {
        return this.customer.getSDT();
    }

    public Boolean getGIOITINH() {
        return this.customer.getGIOITINH();
    }

    public Date getNGAYSINH() {
        return this.customer.getNGAYSINH();
    }

    @Override
    public String toString() {
        return "RegistrationForm [account=" + account + ", customer=" + customer + "]";
    }
}
