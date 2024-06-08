package ptithcm.service;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import ptithcm.bean.*;

@Repository
@SuppressWarnings("unchecked")
public class BillService {
    public static final int List = 0;
    @Autowired
    SessionFactory factory;

    // @Transactional
    // @ModelAttribute("billlist")
    // public Bill getBillList(int MAHD) {
    // Session session = factory.getCurrentSession();
    // String hql = "FROM Bill WHERE MAHD = :MAHD";
    // Query query = session.createQuery(hql);
    // query.setParameter("MAHD", MAHD);
    // Bill list = (Bill) query.list().get(0);
    // return list;
    // }

    @Transactional
    @ModelAttribute("bill")
    public Bill getBillByID(int MAHD) {
        Session session = factory.getCurrentSession();
        String hql = "FROM Bill  WHERE MAHD = :MAHD";
        Query query = session.createQuery(hql);
        query.setParameter("MAHD", MAHD);
        Bill list = (Bill) query.list().get(0);
        return list;
    }

    @Transactional
    @ModelAttribute("billdetail")
    public List<BillDetail> getBillDetail(int MAHD) {
        Session session = factory.getCurrentSession();
        String hql = "FROM BillDetail  WHERE bill.MAHD = :MAHD";
        Query query = session.createQuery(hql);
        query.setParameter("MAHD", MAHD);
        List<BillDetail> list = query.list();
        return list;
    }

    @Transactional
    @ModelAttribute("billByUserId")
    public Bill getBill(int userId) {
        Session session = factory.getCurrentSession();
        String hql = "from Bill where bill_customer.MAKH = :id";
        Query query = session.createQuery(hql);

        query.setParameter("id", userId);

        Bill list = (Bill) query.list().get(0);
        return list;
    }

    @Transactional
    @ModelAttribute("billlist")
    public List<Bill> getBillByStatus(int status) {
        Session session = factory.getCurrentSession();
        String hql = "FROM Bill b " +
                "WHERE b.status.MATT = :status";
        Query query = session.createQuery(hql);

        query.setParameter("status", status);

        List<Bill> list = query.list();
        return list;
    }

    @Transactional
    @ModelAttribute("allbill")
    public List<Bill> getAllBill() {
        Session session = factory.getCurrentSession();
        String hql = "from Bill";
        Query query = session.createQuery(hql);
        List<Bill> list = query.list();
        return list;
    }

    public float[] getMoneyInMonth(int year) {
        // Bắt đầu một phiên giao dịch
        Session session = factory.getCurrentSession();
        session.beginTransaction();

        // Cập nhật HQL để tính tổng số tiền của các hóa đơn cho từng tháng trong một
        // năm cụ thể
        String hql = "select month(b.ngayLap), sum(b.amount) from Bill b where year(b.ngayLap) = :year group by month(b.ngayLap)";
        Query query = session.createQuery(hql);

        // Thiết lập tham số cho năm
        query.setParameter("year", year);

        // Thực hiện truy vấn và lấy kết quả
        List<Object[]> results = query.list();

        // Mảng để lưu tổng số tiền cho mỗi tháng, giả sử có 12 tháng
        float[] monthlyTotals = new float[12]; // Tạo mảng 0.0f cho tất cả các tháng

        // Duyệt qua kết quả và lưu vào mảng
        for (Object[] result : results) {
            int month = (Integer) result[0] - 1; // Chỉ số mảng bắt đầu từ 0, tháng từ 1 đến 12
            float amount = result[1] != null ? (Float) result[1] : 0.0f;
            monthlyTotals[month] = amount;
        }

        // Kết thúc phiên giao dịch
        session.getTransaction().commit();

        return monthlyTotals;
    }

    @Transactional
    @ModelAttribute("billupdate")
    public Bill updateBill(Bill bill) {
        Session session = factory.openSession();
        Transaction t = session.beginTransaction();

        try {
            session.update(bill);
            t.commit();
        } catch (Exception e) {
            e.printStackTrace();
            t.rollback();
            // return 0;
        } finally {
            session.close();
        }
        return bill;
    }

    @Transactional
    @ModelAttribute("bill")
    public Bill insertBill(Bill bill) {
        Session session = factory.openSession();
        Transaction t = session.beginTransaction();

        try {
            session.save(bill);
            t.commit();
        } catch (Exception e) {
            e.printStackTrace();
            t.rollback();
        } finally {
            session.close();
        }
        return bill;
    }

    @Transactional
    @ModelAttribute("bill")
    public BillDetail addDetail(BillDetail detail) {
        Session session = factory.openSession();
        Transaction t = session.beginTransaction();

        try {
            session.save(detail);
            t.commit();
        } catch (Exception e) {
            t.rollback();
        } finally {
            session.close();
        }
        return detail;
    }

    @Transactional
    @ModelAttribute("bill")
    public int addBillDetail(List<CartDetail> list, int MAHD) {
        BillDetail detail = new BillDetail();
        BillDetailPrimary key = new BillDetailPrimary();
        int count = 0;
        for (CartDetail c : list) {
            Integer MASACH = c.getId().getMASACH();
            Integer SOLUONG = c.getSOLUONG();
            Float DONGIA = c.getDONGIA();
            if (MASACH != null && SOLUONG != null && DONGIA != null) {
                key.setMASACH(c.getId().getMASACH());
                key.setMAHD(MAHD);
                detail.setId(key);
                detail.setDONGIA(c.getDONGIA());
                detail.setSOLUONG(c.getSOLUONG());
                addDetail(detail);
                count += 1;
            }

        }
        if (count < list.size()) {
            return 0;
        }
        return 1;

    }

}
