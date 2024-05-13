package ptithcm.bean;

import java.util.Collection;

import javax.persistence.*;

@Entity
@Table(name = "LuotThich")
public class Like {
    @Id
    @GeneratedValue
    private int MALT;// property
    private String CAMXUC;// property

    public Like(int mALT, String cAMXUC) {
        MALT = mALT;
        CAMXUC = cAMXUC;
    }

    public int getMALT() {
        return MALT;
    }

    public void setMALT(int mALT) {
        MALT = mALT;
    }

    public String getCAMXUC() {
        return CAMXUC;
    }

    public void setCAMXUC(String cAMXUC) {
        CAMXUC = cAMXUC;
    }
}
