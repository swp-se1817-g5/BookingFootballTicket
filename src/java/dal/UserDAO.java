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

    public UserDAO() {
        if (INSTANCE == null) {
            con = new DBContext().connect;
        } else {
            INSTANCE = this;
        }
    }

    public static UserDAO getINSTANCE() {
        return INSTANCE;
    }
    
    private void checkConnection() throws SQLException {
        if (con == null || con.isClosed()) {
            con = new DBContext().connect; // Thử kết nối lại nếu kết nối hiện tại là null hoặc đã đóng
        }
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
            e.printStackTrace();
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
        System.out.println(user);
        String sql = "INSERT INTO [User](userName, password, email, phoneNumber, name, avatar, roleId, createdBy, updatedBy)"
                + " VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        boolean added = false;
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, user.getUserName());
            ps.setString(2, user.getPassword());
            ps.setString(3, user.getEmail());
            ps.setString(4, user.getPhoneNumber());
            ps.setString(5, user.getName());
            ps.setString(6, user.getAvatar());
            ps.setInt(7, user.getRoleId());
            ps.setString(8, user.getCreatedBy());
            ps.setString(9, user.getUpdatedBy());

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
        String sql = "SELECT * FROM [User] WHERE email = ? AND password = ? AND isDeleted = 0";
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

    public boolean checkEmailExist(String email) {
        String sql = "SELECT COUNT(*) FROM [User] WHERE email = ?";
        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, email);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next() && rs.getInt(1) > 0) {
                    return true;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public void changePass(String email, String hashedPassword) throws SQLException {
        String sql = "UPDATE [User] SET password = ? WHERE email = ?";
        try {
            checkConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, hashedPassword);
            ps.setString(2, email);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            throw e;
        } finally {
            if (ps != null) ps.close();
        }
    }

    public User getUserByEmail(String email) {
        String sql = "SELECT * FROM [User] WHERE email = ? AND isDeleted=0";
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

    public User getUserByPhone(String phone) {
        String sql = "SELECT * FROM [User] WHERE phoneNumber = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, phone);
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

    public User getUserbyuserID(int userID) {

        User u = null;
        try {
            String sql = "select * from [dbo].[User] where userId = ? and isDeleted = 0";
            ps = con.prepareStatement(sql);
            ps.setInt(1, userID);
            rs = ps.executeQuery();
            while (rs.next()) {
                u = new User();
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
                Timestamp updatedTimestamp = rs.getTimestamp(12);
                u.setLastUpdatedDate(updatedTimestamp != null ? updatedTimestamp.toLocalDateTime() : null);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return u;
    }

    public ArrayList<User> getUserbyType(String searchType, String keyword) {
        ArrayList<User> users = new ArrayList<>();
        try {
            String sql = "SELECT * FROM [dbo].[User] WHERE " + searchType + " LIKE ? AND isDeleted = 0";

            ps = con.prepareStatement(sql);
            ps.setString(1, "%" + keyword + "%");
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
                Timestamp updatedTimestamp = rs.getTimestamp(12);
                u.setLastUpdatedDate(updatedTimestamp != null ? updatedTimestamp.toLocalDateTime() : null);

                users.add(u);
            }
        } catch (SQLException e) {
        }
        return users;
    }

    public ArrayList<User> getUserbyUsername(String keyword) {
        ArrayList<User> users = new ArrayList<>();
        try {
            String sql = "select * from [dbo].[User] where userName LIKE ? and isDeleted = 0";
            ps = con.prepareStatement(sql);
            ps.setString(1, "%" + keyword + "%");
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
                Timestamp updatedTimestamp = rs.getTimestamp(12);
                u.setLastUpdatedDate(updatedTimestamp != null ? updatedTimestamp.toLocalDateTime() : null);

                users.add(u);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return users;
    }

    public ArrayList<User> getUserbyroleID(int roleId) {
        ArrayList<User> users = new ArrayList<>();
        try {
            String sql = "select * from [dbo].[User] where roleId = ? and isDeleted = 0";
            ps = con.prepareStatement(sql);
            ps.setInt(1, roleId);
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
                Timestamp updatedTimestamp = rs.getTimestamp(12);
                u.setLastUpdatedDate(updatedTimestamp != null ? updatedTimestamp.toLocalDateTime() : null);
                users.add(u);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return users;
    }

    public boolean createUser(User user) {
        String sql = "INSERT INTO [dbo].[User] (roleId, userName, password, email, phoneNumber, avatar, name, "
                + "createdBy,updatedBy\n"
                + "      ,lastUpdatedDate,isDeleted) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ? ,? , ? )";
        boolean added = false;
        try {
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
            ps.setString(9, null);
            ps.setString(10, null);
            ps.setBoolean(11, false);
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

    public boolean updateUser(User user) {
        String sql = "UPDATE [dbo].[User] SET roleId = ?, userName = ?, password = ?, email = ?, phoneNumber = ?, "
                + "avatar = ?, name = ?, updatedBy = ? ,lastUpdatedDate = ? WHERE userId = ? and isDeleted = 0";
        boolean updated = false;
        user.setLastUpdatedDate(LocalDateTime.now());
        try {
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

    public ArrayList<User> getUsers(int offset, int noOfRecords) {
        ArrayList<User> users = new ArrayList<>();
        String query = "SELECT * FROM [User] WHERE [isDeleted] = 0 ORDER BY userId OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";

        try (PreparedStatement ps = con.prepareStatement(query)) {
            ps.setInt(1, offset);
            ps.setInt(2, noOfRecords);
            try (ResultSet rs = ps.executeQuery()) {
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
                    Timestamp updatedTimestamp = rs.getTimestamp(12);
                    u.setLastUpdatedDate(updatedTimestamp != null ? updatedTimestamp.toLocalDateTime() : null);
                    users.add(u);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return users;
    }

    public int getNoOfRecords() {
        String query = "SELECT COUNT(*) FROM [User]";
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
        System.out.println(UserDAO.INSTANCE.getUsers(0, 10));
    }

}
