/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import models.User;
import java.util.ArrayList;
import java.sql.*;
import java.time.LocalDate;

/**
 *
 * @author admin
 */
public class UserDAO {
    private Connection connect;
    public static UserDAO INSTANCE = new UserDAO();

    public UserDAO() {
        if (INSTANCE == null) {
            connect = new DBContext().connect;
        } else {
            INSTANCE = this;
        }
    }

    public ArrayList<User> getUsers() {
        ArrayList<User> users = new ArrayList<>();
        String sql = "SELECT * FROM [User]";
        try {
            PreparedStatement ps = connect.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                User user = new User();
                user.setUserId(rs.getInt("userId"));
                user.setRoleId(rs.getInt("roleId"));
                user.setUserName(rs.getString("userName"));
                user.setPassword(rs.getString("password"));
                user.setEmail(rs.getString("email"));
                user.setPhoneNumber(rs.getString("phoneNumber"));
                user.setAvatar(rs.getString("avatar"));
                user.setName(rs.getString("name"));
                user.setCreatedBy(rs.getString("createdBy"));
                user.setCreatedDate(rs.getObject("createdDate", LocalDate.class));
                user.setUpdatedBy(rs.getString("updatedBy"));
                user.setLastUpdatedDate(rs.getObject("lastUpdatedDate", LocalDate.class));
                user.setIsDeleted(rs.getBoolean("isDeleted"));
                users.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return users;
    }

    public boolean addUser(User user) {
        String sql = "INSERT INTO [User](roleId, userName, password, email, phoneNumber, avatar, name, createdBy, createdDate, updatedBy, lastUpdatedDate, isDeleted) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        boolean added = false;
        try {
            PreparedStatement ps = connect.prepareStatement(sql);
            ps.setInt(1, user.getRoleId());
            ps.setString(2, user.getUserName());
            ps.setString(3, user.getPassword());
            ps.setString(4, user.getEmail());
            ps.setString(5, user.getPhoneNumber());
            ps.setString(6, user.getAvatar());
            ps.setString(7, user.getName());
            ps.setString(8, user.getCreatedBy());
            ps.setObject(9, user.getCreatedDate());
            ps.setString(10, user.getUpdatedBy());
            ps.setObject(11, user.getLastUpdatedDate());
            ps.setBoolean(12, user.isIsDeleted());
            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                added = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            added = false;
        }
        return added;
    }
    
    public User authenticateUser(String email, String password) {
        String sql = "SELECT * FROM [User] WHERE email = ? AND password = ?";
        try {
            PreparedStatement ps = connect.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                User user = new User();
                user.setUserId(rs.getInt("userId"));
                user.setRoleId(rs.getInt("roleId"));
                user.setUserName(rs.getString("userName"));
                user.setPassword(rs.getString("password"));
                user.setEmail(rs.getString("email"));
                user.setPhoneNumber(rs.getString("phoneNumber"));
                user.setAvatar(rs.getString("avatar"));
                user.setName(rs.getString("name"));
                user.setCreatedBy(rs.getString("createdBy"));
                user.setCreatedDate(rs.getDate("createdDate").toLocalDate());
                user.setUpdatedBy(rs.getString("updatedBy"));
                user.setLastUpdatedDate(rs.getDate("lastUpdatedDate").toLocalDate());
                user.setIsDeleted(rs.getBoolean("isDeleted"));
                return user;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    public boolean updateUserInformation(User user) {
        String sql = "UPDATE [User] SET roleId = ?, userName = ?, password = ?, email = ?, phoneNumber = ?, avatar = ?, name = ?, updatedBy = ?, lastUpdatedDate = ?, isDeleted = ? WHERE userId = ?";
        boolean updated = false;
        try {
            PreparedStatement ps = connect.prepareStatement(sql);
            ps.setInt(1, user.getRoleId());
            ps.setString(2, user.getUserName());
            ps.setString(3, user.getPassword());
            ps.setString(4, user.getEmail());
            ps.setString(5, user.getPhoneNumber());
            ps.setString(6, user.getAvatar());
            ps.setString(7, user.getName());
            ps.setString(8, user.getUpdatedBy());
            ps.setObject(9, user.getLastUpdatedDate());
            ps.setBoolean(10, user.isIsDeleted());
            ps.setInt(11, user.getUserId());
            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                updated = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            updated = false;
        }
        return updated;
    }

    public User getUserById(int id) {
        String sql = "SELECT * FROM [User] WHERE userId = ?";
        User user = null;
        try {
            PreparedStatement ps = connect.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                user = new User();
                user.setUserId(rs.getInt("userId"));
                user.setRoleId(rs.getInt("roleId"));
                user.setUserName(rs.getString("userName"));
                user.setPassword(rs.getString("password"));
                user.setEmail(rs.getString("email"));
                user.setPhoneNumber(rs.getString("phoneNumber"));
                user.setAvatar(rs.getString("avatar"));
                user.setName(rs.getString("name"));
                user.setCreatedBy(rs.getString("createdBy"));
                user.setCreatedDate(rs.getObject("createdDate", LocalDate.class));
                user.setUpdatedBy(rs.getString("updatedBy"));
                user.setLastUpdatedDate(rs.getObject("lastUpdatedDate", LocalDate.class));
                user.setIsDeleted(rs.getBoolean("isDeleted"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }

    public boolean deleteUser(int userId) {
        boolean deleted = false;
        String sql = "UPDATE [User] SET isDeleted = 1 WHERE userId = ?";
        try {
            PreparedStatement ps = connect.prepareStatement(sql);
            ps.setInt(1, userId);
            if (ps.executeUpdate() > 0) {
                deleted = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return deleted;
    }

    public User getUserByEmail(String email) {
        String sql = "SELECT * FROM [User] WHERE email = ?";
        User user = null;
        try {
            PreparedStatement ps = connect.prepareStatement(sql);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                user = new User();
                user.setUserId(rs.getInt("userId"));
                user.setRoleId(rs.getInt("roleId"));
                user.setUserName(rs.getString("userName"));
                user.setPassword(rs.getString("password"));
                user.setEmail(rs.getString("email"));
                user.setPhoneNumber(rs.getString("phoneNumber"));
                user.setAvatar(rs.getString("avatar"));
                user.setName(rs.getString("name"));
                user.setCreatedBy(rs.getString("createdBy"));
                user.setCreatedDate(rs.getObject("createdDate", LocalDate.class));
                user.setUpdatedBy(rs.getString("updatedBy"));
                user.setLastUpdatedDate(rs.getObject("lastUpdatedDate", LocalDate.class));
                user.setIsDeleted(rs.getBoolean("isDeleted"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }

    public static void main(String[] args) {
        System.out.println(UserDAO.INSTANCE.getUsers().toString());
    }
}
