package ptithcm.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DateHelper {
    public Date convertStringToDate(String date) {
        // date is yyyy-mm-dd
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        try {
            return formatter.parse(date);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}
