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

    private StandDAO() {
        if (INSTANCE == null) {
            con = new DBContext().connect;
        } else {
            INSTANCE = this;
        }
    }

    public ArrayList<Stand> getStands(String standName) {
        ArrayList<Stand> stands = new ArrayList<>();
        String sql = "SELECT * FROM Stand WHERE isDeleted = 0"
                + " AND standName LIKE ?";

        try {
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, "%" + standName + "%");

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Stand stand = new Stand();
                stand.setStandId(rs.getInt("standId"));
                stand.setStandName(rs.getString("standName"));
                stand.setCreatedBy(rs.getString("createdBy"));
                stand.setCreatedDate(rs.getTimestamp("createdDate").toLocalDateTime());
                stand.setUpdatedBy(rs.getString("updatedBy"));
                stand.setLastUpdatedDate(rs.getTimestamp("lastUpdatedDate") == null ? null : rs.getTimestamp("lastUpdatedDate").toLocalDateTime());
                stand.setIsDeleted(rs.getBoolean("isDeleted"));
                stands.add(stand);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return stands;
    }

    public boolean createStand(Stand stand) {
        boolean created = false;
        String sql = "insert into stand(standName, createdBy) values(?,?)";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, stand.getStandName());
            ps.setString(2, stand.getCreatedBy());
            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                created = true;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return created;
    }

    public boolean deleteStand(int standId) {
        boolean deleted = false;
        String sql = "update stand set isDeleted = 1 where standId = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, standId);
            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                deleted = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return deleted;
    }

    public boolean updateStand(Stand stand) {
        boolean updated = false;
        String sql = "update stand set standName = ?, updatedBy = ? where standId = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, stand.getStandName());
            ps.setString(2, stand.getUpdatedBy());
            ps.setInt(3, stand.getStandId());
            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                updated = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return updated;
    }

}
