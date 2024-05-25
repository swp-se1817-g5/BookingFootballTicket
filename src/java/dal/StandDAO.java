    /*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;
import java.sql.*;
import java.util.ArrayList;
import models.Stand;

/**
 *
 * @author admin
 */
public class StandDAO {
    public static StandDAO INSTANCE = new StandDAO();
     private Connection con;
    private PreparedStatement ps;

    private StandDAO() {
        if (INSTANCE == null) {
            con = new DBContext().connect;
        } else {
            INSTANCE = this;
        }
    }
    public ArrayList<Stand> getStands() {
    ArrayList<Stand> stands = new ArrayList<>();
    String sql = "SELECT * FROM Stand";
    try {
        PreparedStatement ps = con.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            Stand stand = new Stand();
            stand.setStandId(rs.getInt("standId"));
            stand.setStandName(rs.getString("standName"));
            stand.setPrice(rs.getBigDecimal("price"));
            stand.setQuantity(rs.getInt("quantity"));
            stand.setCreatedBy(rs.getString("createdBy"));
            stand.setCreatedDate(rs.getTimestamp("createdDate").toLocalDateTime());
            stand.setUpdatedBy(rs.getString("updatedBy"));
            stand.setLastUpdatedDate(rs.getTimestamp("lastUpdatedDate").toLocalDateTime());
            stand.setIsDeleted(rs.getBoolean("isDeleted"));
            stands.add(stand);
        }
    } catch (SQLException e) {
        e.printStackTrace(); // Proper exception handling
    }
    return stands;
}

    
}
