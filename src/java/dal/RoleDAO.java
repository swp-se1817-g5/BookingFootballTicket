/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import models.*;

/**
 *
 * @author Vinh
 */
public class RoleDAO {

    public static RoleDAO INSTANCE = new RoleDAO();
    private Connection con;
    private PreparedStatement ps;
    private ResultSet rs;

    private RoleDAO() {
        if (INSTANCE == null) {
            con = new DBContext().connect;
        } else {
            INSTANCE = this;
        }
    }

    public static RoleDAO getINSTANCE() {
        return INSTANCE;
    }

    public ArrayList<Role> getAllRole() {
        ArrayList<Role> roles = new ArrayList<>();
        try {
            String sql = "SELECT [roleId]\n"
                    + "      ,[roleName]\n"
                    + "      ,[createdBy]\n"
                    + "      ,[createdDate]\n"
                    + "      ,[updatedBy]\n"
                    + "      ,[lastUpdatedDate]\n"
                    + "  FROM [dbo].[Role] WHERE [isDeleted] = 0 ";
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Role r = new Role();
                r.setRoleId(rs.getInt(1));
                r.setRoleName(rs.getString(2));
                r.setCreateBy(rs.getString(3));
                r.setCreatedDate(rs.getTimestamp(4).toLocalDateTime());
                r.setUpdatedBy(rs.getString(5));
                r.setLastUpdatedDate(rs.getTimestamp(6).toLocalDateTime());
                roles.add(r);
            }
        } catch (SQLException e) {
            roles = null;
        }
        return roles;
    }

    public void createRole(Role role) {
        String sql = "INSERT INTO [dbo].[Role] "
                + "([roleName], [createdBy],[isDeleted]) "
                + "VALUES (?, ?, ?)";

        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, role.getRoleName());
            ps.setString(2, role.getCreateBy());
            ps.setBoolean(3, false);
            ps.executeUpdate(); // Execute the insert statement
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updateRole(Role role) {
        String sql = "UPDATE [dbo].[Role]\n"
                + "   SET [roleName] = ?\n"
                + "      ,[updatedBy] = ?\n"
                + "      ,[lastUpdatedDate] = ?\n"
                + " WHERE [roleId] = ?";
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, role.getRoleName());
            ps.setString(2, "admin");
            ps.setDate(3, java.sql.Date.valueOf(role.getLastUpdatedDate()));
            
        } catch (SQLException e) {
        }
    }

    public static void main(String[] args) {
//        Role role = new Role("customer","admin");
//        RoleDAO.INSTANCE.insertRole(role);
//        ArrayList<Role> roles = RoleDAO.INSTANCE.getAllRole();
//        for (Role role : roles) {
//            System.out.println(role.toString());
//        }
    }
}
