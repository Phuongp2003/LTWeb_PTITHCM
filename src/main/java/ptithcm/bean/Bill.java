package ptithcm.bean;

import java.util.*;

import javax.persistence.*;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "HoaDon")
public class Bill {
    @Id
    @GeneratedValue
    private Integer MAHD;// property
    @Temporal(TemporalType.DATE)
    @DateTimeFormat(pattern = "MM/dd/yyyy")
    private Date NGAYLAP;// property
    private Float TONGTIEN;// property
    private String HOTENNN;// property
    private String DIACHINN;// property
    private String SDTNN; // property
    private String GHICHU;// property
    private String EMAILNN;// property

    @ManyToOne
    @JoinColumn(name = "TRANGTHAI")
    private Status status;// property

    @ManyToOne
    @JoinColumn(name = "MANV")
    private Employee bill_employee;// property

    @ManyToOne
    @JoinColumn(name = "MAKH")
    private Customer bill_customer;// property

    @OneToMany(mappedBy = "bill", fetch = FetchType.EAGER)
    private Collection<BillDetail> billdetails;

    public Bill() {
    }

    public Bill(Integer mAHD, Date nGAYLAP, Float tONGTIEN, String hOTENNN, String dIACHINN, String sDTNN,
            String gHICHU, String eMAILNN, Status status, Employee bill_employee, Customer bill_customer) {
        MAHD = mAHD;
        NGAYLAP = nGAYLAP;
        TONGTIEN = tONGTIEN;
        HOTENNN = hOTENNN;
        DIACHINN = dIACHINN;
        SDTNN = sDTNN;
        GHICHU = gHICHU;
        EMAILNN = eMAILNN;
        this.status = status;
        this.bill_employee = bill_employee;
        this.bill_customer = bill_customer;
    }

    public Bill(Integer mAHD, Date nGAYLAP, Float tONGTIEN, String hOTENNN, String dIACHINN, String sDTNN,
            String gHICHU, String eMAILNN, Employee bill_employee, Customer bill_customer) {
        MAHD = mAHD;
        NGAYLAP = nGAYLAP;
        TONGTIEN = tONGTIEN;
        HOTENNN = hOTENNN;
        DIACHINN = dIACHINN;
        SDTNN = sDTNN;
        GHICHU = gHICHU;
        EMAILNN = eMAILNN;
        this.bill_employee = bill_employee;
        this.bill_customer = bill_customer;

    }

    public Integer getMAHD() {
        return MAHD;
    }

    public void setMAHD(Integer mAHD) {
        MAHD = mAHD;
    }

    public Date getNGAYLAP() {
        return NGAYLAP;
    }

    public void setNGAYLAP(Date nGAYLAP) {
        NGAYLAP = nGAYLAP;
    }

    public Customer getBill_customer() {
        return bill_customer;
    }

    public void setBill_customer(Customer bill_customer) {
        this.bill_customer = bill_customer;
    }

    public Collection<BillDetail> getBilldetails() {
        return billdetails;
    }

    public void setBilldetails(Collection<BillDetail> billdetails) {
        this.billdetails = billdetails;
    }

    public Employee getBill_employee() {
        return bill_employee;
    }

    public void setBill_employee(Employee bill_employee) {
        this.bill_employee = bill_employee;
    }

    public Float getTONGTIEN() {
        return TONGTIEN;
    }

    public void setTONGTIEN(Float tONGTIEN) {
        TONGTIEN = tONGTIEN;
    }

    public String getHOTENNN() {
        return HOTENNN;
    }

    public void setHOTENNN(String hOTENNN) {
        HOTENNN = hOTENNN;
    }

    public String getDIACHINN() {
        return DIACHINN;
    }

    public void setDIACHINN(String dIACHINN) {
        DIACHINN = dIACHINN;
    }

    public String getSDTNN() {
        return SDTNN;
    }

    public void setSDTNN(String sDTNN) {
        SDTNN = sDTNN;
    }

    public String getGHICHU() {
        return GHICHU;
    }

    public void setGHICHU(String gHICHU) {
        GHICHU = gHICHU;
    }

    public String getEMAILNN() {
        return EMAILNN;
    }

    public void setEMAILNN(String eMAILNN) {
        EMAILNN = eMAILNN;
    }

    public Status getStatus() {
        return status;
    }

    public void setStatus(Status status) {
        this.status = status;
    }

}
