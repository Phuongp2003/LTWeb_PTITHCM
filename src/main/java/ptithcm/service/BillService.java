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

import ptithcm.bean.*;

@Repository
@SuppressWarnings("unchecked")
public class BillService {
    @Autowired
    SessionFactory factory;

    @Transactional
    @ModelAttribute("bill")
    public Bill getBill(int userId) {
        Session session = factory.getCurrentSession();
        String hql = "from Bill where bill_customer.MAKH = :id";
        Query query = session.createQuery(hql);

        query.setParameter("id", userId);

        Bill list = (Bill) query.list().get(0);
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

    public int insertBill(List<CartDetail> cartdetail) {
        Session session = factory.openSession();
        Transaction t = session.beginTransaction();

        try {
            session.save(cartdetail);
            t.commit();
        } catch (Exception e) {
            e.printStackTrace();
            t.rollback();
            return 0;
        } finally {
            session.close();
        }
        return 1;
    }

}
