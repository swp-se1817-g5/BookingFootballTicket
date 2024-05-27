package dal;

import java.sql.*;
import java.time.LocalDateTime;
import java.util.ArrayList;
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

    public boolean addUserGoogle(User user) {
        int n = 0;
        try {
            String sql = "INSERT INTO [dbo].[User] (email, [name], avatar) VALUES (?, ?, ?)";
            PreparedStatement preparedStatement = con.prepareStatement(sql);
            preparedStatement.setString(1, user.getEmail());
            preparedStatement.setString(2, user.getName());
            preparedStatement.setString(3, user.getAvatar());
            n = preparedStatement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return n > 0;
    }

    public boolean addUser(User user) {

        String sql = "INSERT INTO [User](userName, password, email, phoneNumber, name)"
                + " VALUES (?, ?, ?, ?, ?)";
        boolean added = false;
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, user.getUserName());
            ps.setString(2, user.getPassword());
            ps.setString(3, user.getEmail());
            ps.setString(4, user.getPhoneNumber());
            ps.setString(5, user.getName());

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
            PreparedStatement ps = con.prepareStatement(sql);
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
                user.setUpdatedBy(rs.getString("updatedBy"));
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
            PreparedStatement ps = con.prepareStatement(sql);
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
            PreparedStatement ps = con.prepareStatement(sql);
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
                user.setUpdatedBy(rs.getString("updatedBy"));
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
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, userId);
            if (ps.executeUpdate() > 0) {
                deleted = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return deleted;
    }

    public User getUserByUserName(String usName) {
        String sql = "SELECT * FROM [User] WHERE userName = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, usName);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int userId = rs.getInt("userId");
                String userName = rs.getString("userName");
                String password = rs.getString("password");
                String name = rs.getString("name");

                User user = new User();
                user.setUserId(userId);
                user.setUserName(userName);
                user.setPassword(password);
                user.setName(name);
                return user;

            }
        } catch (Exception e) {
            e.printStackTrace();

        }
        return null;
    }

    public User getUserByEmail(String email) {
        String sql = "SELECT * FROM [User] WHERE email = ? and isDeleted=0";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int userId = rs.getInt("userId");
                String userName = rs.getString("userName");
                String password = rs.getString("password");
                String name = rs.getString("name");

                User user = new User();
                user.setUserId(userId);
                user.setUserName(userName);
                user.setPassword(password);
                user.setName(name);
                return user;

            }
        } catch (Exception e) {
            e.printStackTrace();

        }
        return null;
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
