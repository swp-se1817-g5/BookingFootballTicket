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

    public Role getRolebyID(int ID) {
        Role role = new Role();
        String sql = "SELECT [roleId]\n"
                + "      ,[roleName]\n"
                + "      ,[createdBy]\n"
                + "      ,[createdDate]\n"
                + "      ,[updatedBy]\n"
                + "      ,[lastUpdatedDate]\n"
                + "  FROM [dbo].[Role] WHERE [roleId] = ? AND [isDeleted] = 0";
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, ID);
            rs = ps.executeQuery();
            role.setRoleId(ID);
            role.setRoleName(rs.getString(2));
            role.setCreateBy(rs.getString(3));
            role.setCreatedDate(rs.getTimestamp(4).toLocalDateTime());
            role.setUpdatedBy(rs.getString(5));
            role.setLastUpdatedDate(rs.getTimestamp(6).toLocalDateTime());
        } catch (SQLException e) {
        }
        return role;
    }

    public void createRole(Role role) {
        String sql = "INSERT INTO [dbo].[Role] "
                + "([roleName], [createdBy],[updatedBy]\n"
                + "      ,[lastUpdatedDate],[isDeleted]) "
                + "VALUES (?, ?, ? , ? , ? )";

        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, role.getRoleName());
            ps.setString(2, role.getCreateBy());
            ps.setString(3, null);
            ps.setString(4, null);
            ps.setBoolean(5, false);
            ps.executeUpdate();
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

    public ArrayList<Role> getRoles(int offset, int noOfRecords) {
        ArrayList<Role> roles = new ArrayList<>();
        String query = "SELECT * FROM [dbo].[Role] WHERE [isDeleted] = 0 ORDER BY roleId OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";

        try (PreparedStatement ps = con.prepareStatement(query)) {
            ps.setInt(1, offset);
            ps.setInt(2, noOfRecords);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Role r = new Role();
                    r.setRoleId(rs.getInt(1));
                    r.setRoleName(rs.getString(2));
                    r.setCreateBy(rs.getString(3));
                    r.setCreatedDate(rs.getTimestamp(4).toLocalDateTime());
                    r.setUpdatedBy(rs.getString(5));
                    Timestamp updatedTimestamp = rs.getTimestamp(6);
                    r.setLastUpdatedDate(updatedTimestamp != null ? updatedTimestamp.toLocalDateTime() : null);
                    roles.add(r);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return roles;
    }

    public int getNoOfRecords() {
        String query = "SELECT COUNT(*) FROM [Role]";
        try (PreparedStatement ps = con.prepareStatement(query); ResultSet rs = ps.executeQuery()) {
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    public static void main(String[] args) {
//        Role role = new Role("customer","admin");
//        RoleDAO.INSTANCE.insertRole(role);
        ArrayList<Role> roles = RoleDAO.INSTANCE.getRoles(1, 5);
        for (Role role : roles) {
            System.out.println(role.toString());
        }
    }
}
