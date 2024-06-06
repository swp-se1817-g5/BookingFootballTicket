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
                    + "  FROM [dbo].[Role]";
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Role r = new Role();
                r.setRoleId(rs.getInt(1));
                r.setRoleName(rs.getString(2));
                roles.add(r);
            }
        } catch (SQLException e) {
            roles = null;
        }
        return roles;
    }

    public Role getRolebyID(int roleID) {
        Role role = new Role();
        String sql = "SELECT [roleId]\n"
                + "      ,[roleName]\n"
                + "  FROM [dbo].[Role] WHERE [roleId] = ?";
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, roleID);
            rs = ps.executeQuery();
            role.setRoleId(roleID);
            role.setRoleName(rs.getString(2));
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return role;
    }

    public void createRole(Role role) {
        String sql = "INSERT INTO [dbo].[Role] "
                + "([roleName] "
                + "VALUES (? )";

        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, role.getRoleName());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updateRole(Role role) {
        String sql = "UPDATE [dbo].[Role]\n"
                + "   SET [roleName] = ?\n"
                + " WHERE [roleId] = ?";
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, role.getRoleName());
            ps.setInt(2,role.getRoleId() );
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public ArrayList<Role> getRoles(int offset, int noOfRecords) {
        ArrayList<Role> roles = new ArrayList<>();
        String query = "SELECT * FROM [dbo].[Role] ORDER BY roleId OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";

        try (PreparedStatement ps = con.prepareStatement(query)) {
            ps.setInt(1, offset);
            ps.setInt(2, noOfRecords);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Role r = new Role();
                    r.setRoleId(rs.getInt(1));
                    r.setRoleName(rs.getString(2));
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
        ArrayList<Role> roles = RoleDAO.getINSTANCE().getAllRole();
        for (Role role : roles) {
            System.out.println(role.toString());
        }
    }
}
