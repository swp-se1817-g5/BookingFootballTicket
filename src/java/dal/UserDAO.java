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
                u.setEmail(rs.getString("email"));
                u.setName(rs.getString("name"));
                u.setRoleId(rs.getInt("roleId"));
                u.setHashedPassword(rs.getString("hashedPassword"));
                u.setPhoneNumber(rs.getString("phoneNumber"));
                u.setAvatar(rs.getString("avatar"));
                u.setCreatedBy(rs.getString("createdBy"));
                u.setCreatedDate(rs.getTimestamp("createdDate").toLocalDateTime());
                u.setUpdatedBy(rs.getString("updatedBy"));
                u.setLastUpdatedDate(rs.getTimestamp("lastUpdatedDate") != null ? rs.getTimestamp("lastUpdatedDate").toLocalDateTime() : null);
                u.setIsDeleted(rs.getBoolean("isDeleted"));
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
            String sql = "INSERT INTO [dbo].[User] (email, name, avatar) VALUES (?, ?, ?)";
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
        String sql = "INSERT INTO [User](email, name, roleId, hashedPassword, phoneNumber, avatar, createdBy, updatedBy, isDeleted, lastUpdatedDate)"
                + " VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        boolean added = false;
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, user.getEmail());
            ps.setString(2, user.getName());
            ps.setInt(3, user.getRoleId());
            ps.setString(4, user.getHashedPassword());
            ps.setString(5, user.getPhoneNumber());
            ps.setString(6, user.getAvatar());
            ps.setString(7, user.getCreatedBy());
            ps.setString(8, user.getUpdatedBy());
            ps.setBoolean(9, user.isIsDeleted());

            // Chuyển đổi định dạng của lastUpdatedDate từ LocalDateTime sang Timestamp
            Timestamp lastUpdatedTimestamp = null;
            if (user.getLastUpdatedDate() != null) {
                lastUpdatedTimestamp = Timestamp.valueOf(user.getLastUpdatedDate());
            }
            ps.setTimestamp(10, lastUpdatedTimestamp);

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
        String sql = "SELECT * FROM [User] WHERE email = ? AND hashedPassword = ? AND isDeleted = 0";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                User user = new User();
                user.setEmail(rs.getString("email"));
                user.setName(rs.getString("name"));
                user.setRoleId(rs.getInt("roleId"));
                user.setHashedPassword(rs.getString("hashedPassword"));
                user.setPhoneNumber(rs.getString("phoneNumber"));
                user.setAvatar(rs.getString("avatar"));
                user.setCreatedBy(rs.getString("createdBy"));
                user.setCreatedDate(rs.getTimestamp("createdDate").toLocalDateTime());
                user.setUpdatedBy(rs.getString("updatedBy"));
                user.setLastUpdatedDate(rs.getTimestamp("lastUpdatedDate") != null ? rs.getTimestamp("lastUpdatedDate").toLocalDateTime() : null);
                user.setIsDeleted(rs.getBoolean("isDeleted"));
                return user;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean updateUserInformation(User user) {
        String sql = "UPDATE [User] SET roleId = ?, [hashedPassword] = ?, phoneNumber = ?, avatar = ?, name = ?, updatedBy = ?, lastUpdatedDate = ?, isDeleted = ? WHERE email = ?";
        boolean updated = false;
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, user.getRoleId());
            ps.setString(2, user.getHashedPassword());
            ps.setString(3, user.getPhoneNumber());
            ps.setString(4, user.getAvatar());
            ps.setString(5, user.getName());
            ps.setString(6, user.getUpdatedBy());
            ps.setObject(7, user.getLastUpdatedDate());
            ps.setBoolean(8, user.isIsDeleted());
            ps.setString(9, user.getEmail());
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

    public User getUserByemail(String email) {
        String sql = "SELECT * FROM [User] WHERE email = ?";
        User user = null;
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                user = new User();
                user.setEmail(rs.getString("email"));
                user.setRoleId(rs.getInt("roleId"));
                user.setHashedPassword(rs.getString("hashedPassword"));
                user.setPhoneNumber(rs.getString("phoneNumber"));
                user.setAvatar(rs.getString("avatar"));
                user.setName(rs.getString("name"));
                user.setCreatedBy(rs.getString("createdBy"));
                user.setCreatedDate(rs.getTimestamp("createdDate").toLocalDateTime());
                user.setUpdatedBy(rs.getString("updatedBy"));
                user.setIsDeleted(rs.getBoolean("isDeleted"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }

    public boolean deleteUser(String email) {
        boolean deleted = false;
        String sql = "UPDATE [User] SET isDeleted = 1 WHERE email = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, email);
            if (ps.executeUpdate() > 0) {
                deleted = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return deleted;
    }

    public User getUserByName(String Name) {
        String sql = "SELECT * FROM [User] WHERE name = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, Name);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String email = rs.getString("email");
                String name = rs.getString("name");
                String hashedPassword = rs.getString("hashedPassword");
                User user = new User();
                user.setEmail(email);
                user.setName(name);
                user.setHashedPassword(hashedPassword);
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
        String sql = "UPDATE [User] SET hashedPassword = ? WHERE email = ?";
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
            if (ps != null) {
                ps.close();
            }
        }
    }

    public User getUserByEmail(String email) {
        String sql = "SELECT * FROM [User] WHERE email = ? AND isDeleted = 0";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                User user = new User();
                user.setEmail(rs.getString("email"));
                user.setName(rs.getString("name"));
                user.setRoleId(rs.getInt("roleId"));
                user.setHashedPassword(rs.getString("hashedPassword"));
                user.setPhoneNumber(rs.getString("phoneNumber"));
                user.setAvatar(rs.getString("avatar"));
                user.setCreatedBy(rs.getString("createdBy"));
                user.setCreatedDate(rs.getTimestamp("createdDate").toLocalDateTime());
                user.setUpdatedBy(rs.getString("updatedBy"));
                user.setLastUpdatedDate(rs.getTimestamp("lastUpdatedDate") != null ? rs.getTimestamp("lastUpdatedDate").toLocalDateTime() : null);
                user.setIsDeleted(rs.getBoolean("isDeleted"));
                return user;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public User getUserByPhone(String phone) {
        String sql = "SELECT * FROM [User] WHERE phoneNumber = ? AND isDeleted = 0";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, phone);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                User user = new User();
                user.setEmail(rs.getString("email"));
                user.setName(rs.getString("name"));
                user.setRoleId(rs.getInt("roleId"));
                user.setHashedPassword(rs.getString("hashedPassword"));
                user.setPhoneNumber(rs.getString("phoneNumber"));
                user.setAvatar(rs.getString("avatar"));
                user.setCreatedBy(rs.getString("createdBy"));
                user.setCreatedDate(rs.getTimestamp("createdDate").toLocalDateTime());
                user.setUpdatedBy(rs.getString("updatedBy"));
                user.setLastUpdatedDate(rs.getTimestamp("lastUpdatedDate") != null ? rs.getTimestamp("lastUpdatedDate").toLocalDateTime() : null);
                user.setIsDeleted(rs.getBoolean("isDeleted"));
                return user;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
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
                u.setEmail(rs.getString(1));
                u.setName(rs.getString(2));
                u.setRoleId(rs.getInt(3));
                u.setHashedPassword(rs.getString(4));
                u.setPhoneNumber(rs.getString(5));
                u.setAvatar(rs.getString(6));
                u.setCreatedBy(rs.getString(7));
                u.setCreatedDate(rs.getTimestamp(8).toLocalDateTime());
                u.setUpdatedBy(rs.getString(9));
                Timestamp updatedTimestamp = rs.getTimestamp(10);
                u.setLastUpdatedDate(updatedTimestamp != null ? updatedTimestamp.toLocalDateTime() : null);
                users.add(u);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return users;
    }

    public ArrayList<User> getUserbyName(String keyword) {
        ArrayList<User> users = new ArrayList<>();
        try {
            String sql = "select * from [dbo].[User] where userName LIKE ? and isDeleted = 0";
            ps = con.prepareStatement(sql);
            ps.setString(1, "%" + keyword + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                User u = new User();
                u.setEmail(rs.getString(1));
                u.setName(rs.getString(2));
                u.setRoleId(rs.getInt(3));
                u.setHashedPassword(rs.getString(4));
                u.setPhoneNumber(rs.getString(5));
                u.setAvatar(rs.getString(6));
                u.setCreatedBy(rs.getString(7));
                u.setCreatedDate(rs.getTimestamp(8).toLocalDateTime());
                u.setUpdatedBy(rs.getString(9));
                Timestamp updatedTimestamp = rs.getTimestamp(10);
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
                u.setEmail(rs.getString(1));
                u.setName(rs.getString(2));
                u.setRoleId(rs.getInt(3));
                u.setHashedPassword(rs.getString(4));
                u.setPhoneNumber(rs.getString(5));
                u.setAvatar(rs.getString(6));
                u.setCreatedBy(rs.getString(7));
                u.setCreatedDate(rs.getTimestamp(8).toLocalDateTime());
                u.setUpdatedBy(rs.getString(9));
                Timestamp updatedTimestamp = rs.getTimestamp(10);
                u.setLastUpdatedDate(updatedTimestamp != null ? updatedTimestamp.toLocalDateTime() : null);
                users.add(u);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return users;
    }

    public boolean createUser(User user) {
        String sql = "INSERT INTO [dbo].[User] (roleId, name, hashedpassword, email, phoneNumber, avatar,"
                + "createdBy,updatedBy\n"
                + "      ,lastUpdatedDate,isDeleted) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ? ,?)";
        boolean added = false;
        try {
            ps = con.prepareStatement(sql);
            int userRoleId = 2;
            ps.setInt(1, userRoleId);
            ps.setString(2, user.getName());
            ps.setString(3, user.getHashedPassword());
            ps.setString(4, user.getEmail());
            ps.setString(5, user.getPhoneNumber());
            ps.setString(6, user.getAvatar());
            ps.setString(7, user.getCreatedBy());
            ps.setString(8, null);
            ps.setString(9, null);
            ps.setBoolean(10, false);
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
        String sql = "UPDATE [dbo].[User] SET roleId = ?, hashedpassword = ?, phoneNumber = ?, "
                + "avatar = ?, name = ?, updatedBy = ? ,lastUpdatedDate = ? WHERE email = ? and isDeleted = 0";
        boolean updated = false;
        user.setLastUpdatedDate(LocalDateTime.now());
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, user.getRoleId());
            ps.setString(2, user.getHashedPassword());
            ps.setString(3, user.getPhoneNumber());
            ps.setString(4, user.getAvatar());
            ps.setString(5, user.getName());
            ps.setString(6, user.getUpdatedBy());
            LocalDateTime currentTime = LocalDateTime.now();
            user.setLastUpdatedDate(currentTime);
            ps.setTimestamp(7, Timestamp.valueOf(currentTime));
            ps.setString(8, user.getEmail());
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
        String query = "SELECT * FROM [User] WHERE [isDeleted] = 0 ORDER BY email OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";

        try (PreparedStatement ps = con.prepareStatement(query)) {
            ps.setInt(1, offset);
            ps.setInt(2, noOfRecords);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    User u = new User();
                    u.setEmail(rs.getString(1));
                    u.setName(rs.getString(2));
                    u.setRoleId(rs.getInt(3));
                    u.setHashedPassword(rs.getString(4));
                    u.setPhoneNumber(rs.getString(5));
                    u.setAvatar(rs.getString(6));
                    u.setCreatedBy(rs.getString(7));
                    u.setCreatedDate(rs.getTimestamp(8).toLocalDateTime());
                    u.setUpdatedBy(rs.getString(9));
                    Timestamp updatedTimestamp = rs.getTimestamp(10);
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

    public ArrayList<User> getPaginatedUsers(ArrayList<User> users, int page, int pageSize) {
        int start = (page - 1) * pageSize;
        int end = Math.min(start + pageSize, users.size());
        if (start >= users.size() || start < 0) {
            return new ArrayList<>();
        }
        return new ArrayList<>(users.subList(start, end));
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
