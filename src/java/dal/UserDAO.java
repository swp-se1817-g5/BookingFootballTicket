/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.logging.Level;
import java.util.logging.Logger;
import models.*;

/**
 *
 * @author Vinh
 */
public class UserDAO {

    public static UserDAO INSTANCE = new UserDAO();
    private Connection con;
    private PreparedStatement ps;
    private ResultSet rs;

    private UserDAO() {
        if (INSTANCE == null) {
            con = new DBContext().connect;
        } else {
            INSTANCE = this;
        }
    }

    public static UserDAO getINSTANCE() {
        return INSTANCE;
    }

    public ArrayList<User> getallUser() {
        ArrayList<User> users = new ArrayList<>();
        try {
            String sql = "select * from [dbo].[User] where isDeleted = 0";
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                User u = new User();
                u.setUserId(rs.getInt(1));
                u.setRoleId(rs.getInt(2));
                u.setUserName(rs.getString(3));
                u.setPassword(rs.getString(4));
                u.setEmail(rs.getString(5));
                u.setPhoneNumber(rs.getString(6));
                u.setAvatar(rs.getString(7));
                u.setName(rs.getString(8));
                u.setCreatedBy(rs.getString(9));
                u.setCreatedDate(rs.getTimestamp(10).toLocalDateTime());
                u.setUpdatedBy(rs.getString(11));
                u.setLastUpdatedDate(rs.getTimestamp(12).toLocalDateTime());
                users.add(u);
            }
        } catch (SQLException e) {
        }
        return users;
    }

    public User getUserbyID(String userID) {
        User u = new User();
        try {
            String sql = "select * from [dbo].[User] where userId = ? and isDeleted = 0";
            ps = con.prepareStatement(sql);
            ps.setString(1, userID);
            rs = ps.executeQuery();
            while (rs.next()) {
                u.setUserId(rs.getInt(1));
                u.setRoleId(rs.getInt(2));
                u.setUserName(rs.getString(3));
                u.setPassword(rs.getString(4));
                u.setEmail(rs.getString(5));
                u.setPhoneNumber(rs.getString(6));
                u.setAvatar(rs.getString(7));
                u.setName(rs.getString(8));
                u.setCreatedBy(rs.getString(9));
                u.setCreatedDate(rs.getTimestamp(10).toLocalDateTime());
                u.setUpdatedBy(rs.getString(11));
                u.setLastUpdatedDate(rs.getTimestamp(12).toLocalDateTime());
            }
        } catch (SQLException e) {
        }
        return u;
    }

    public ArrayList<User> getUserbyName(String keyword) {
        ArrayList<User> users = new ArrayList<>();
        try {
            String sql = "select * from [dbo].[User] where (userName LIKE ? or name LIKE ?) and isDeleted = 0";
            ps = con.prepareStatement(sql);
            ps.setString(1, "%" + keyword + "%");
            ps.setString(2, "%" + keyword + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                User u = new User();
                u.setUserId(rs.getInt(1));
                u.setRoleId(rs.getInt(2));
                u.setUserName(rs.getString(3));
                u.setPassword(rs.getString(4));
                u.setEmail(rs.getString(5));
                u.setPhoneNumber(rs.getString(6));
                u.setAvatar(rs.getString(7));
                u.setName(rs.getString(8));
                u.setCreatedBy(rs.getString(9));
                u.setCreatedDate(rs.getTimestamp(10).toLocalDateTime());
                u.setUpdatedBy(rs.getString(11));
                u.setLastUpdatedDate(rs.getTimestamp(12).toLocalDateTime());
                users.add(u);
            }
        } catch (SQLException e) {
        }
        return users;
    }

    public void createUser(User user) throws SQLException {
        String sql = "INSERT INTO [dbo].[User] (roleId, userName, password, email, phoneNumber, avatar, name, "
                + "createdBy,updatedBy\n"
                + "      ,lastUpdatedDate,isDeleted) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ? ,? , ? )";
        ps = con.prepareStatement(sql);

        int userRoleId = 2;

        ps.setInt(1, userRoleId);
        ps.setString(2, user.getUserName());
        ps.setString(3, user.getPassword());
        ps.setString(4, user.getEmail());
        ps.setString(5, user.getPhoneNumber());
        ps.setString(6, user.getAvatar());
        ps.setString(7, user.getName());
        ps.setString(8, "admin");
        ps.setString(9, "");
        ps.setString(10, "");
        ps.setBoolean(11, false);
        ps.executeUpdate();
    }

    public void updateUser(User user) throws SQLException {
        String sql = "UPDATE [dbo].[User] SET roleId = ?, userName = ?, password = ?, email = ?, phoneNumber = ?, "
                + "avatar = ?, name = ?, updatedBy = ? ,lastUpdatedDate = ? WHERE userId = ? and isDeleted = 0";
        user.setLastUpdatedDate(LocalDateTime.now());
        ps = con.prepareStatement(sql);

        ps.setInt(1, user.getRoleId());
        ps.setString(2, user.getUserName());
        ps.setString(3, user.getPassword());
        ps.setString(4, user.getEmail());
        ps.setString(5, user.getPhoneNumber());
        ps.setString(6, user.getAvatar());
        ps.setString(7, user.getName());
        ps.setString(8, "admin");
        LocalDateTime currentTime = LocalDateTime.now();
        user.setLastUpdatedDate(currentTime);
        ps.setTimestamp(9, Timestamp.valueOf(currentTime));
        ps.setInt(10, user.getUserId());
        ps.executeUpdate();

    }

    public void deleteUser(User user) throws SQLException {
        String sql = "UPDATE [dbo].[User] SET isDeleted = 1 WHERE userId = ?";
        ps = con.prepareStatement(sql);
        ps.executeUpdate();
    }

    public static void main(String[] args) {
//        User u = new User("VINH", "123", "vinh123@gmail.com", "012345678910", "", "Vin");
//        try {
//            UserDAO.INSTANCE.insertUser(u);
//        } catch (SQLException ex) {
//            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
//        }
//          ArrayList<User> users = UserDAO.INSTANCE.getallUser();
//          System.out.println(users.toString());
//        User u = UserDAO.INSTANCE.getUserbyID("1");
//        System.out.println(u);
//        UserDAO.INSTANCE.updateUser(u);
    }

}
