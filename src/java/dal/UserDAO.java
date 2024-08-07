package dal;

import models.User;
import org.mindrot.jbcrypt.BCrypt;
import java.sql.*;
import java.time.LocalDateTime;
import java.util.ArrayList;

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
            checkConnection();
            String sql = "select * from [dbo].[User] where status = 1";
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
                u.setStatus(rs.getBoolean("status"));
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
            checkConnection();
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
        String sql = "INSERT INTO [User](email, name, roleId, hashedPassword, phoneNumber, avatar, createdBy, updatedBy)"
                + " VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        boolean added = false;
        try {
            checkConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, user.getEmail());
            ps.setString(2, user.getName());
            ps.setInt(3, user.getRoleId());
            ps.setString(4, user.getHashedPassword());
            ps.setString(5, user.getPhoneNumber());
            ps.setString(6, user.getAvatar());
            ps.setString(7, user.getCreatedBy());
            ps.setString(8, user.getUpdatedBy());

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
        try {
            checkConnection();
            String hashedPassword = getHashedPasswordByEmail(email);
            if (hashedPassword != null && BCrypt.checkpw(password, hashedPassword)) {
                return getUserByEmail(email);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public int getRoleID(String email) {
        int roleID = -1;
        String query = "SELECT roleId FROM [User] WHERE email = ?";

        try (PreparedStatement ps = con.prepareStatement(query)) {
            ps.setString(1, email);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    roleID = rs.getInt(1);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return roleID;
    }

    public User getUserByEmail(String email) {
        String sql = "SELECT * FROM [User] WHERE email = ? AND status = 1";
        User user = null;
        try {
            checkConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                user = new User();
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
                user.setStatus(rs.getBoolean("status"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }
    
    public User getAllUserInDB(String email) {
        String sql = "SELECT * FROM [User] WHERE email = ?";
        User user = null;
        try {
            checkConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                user = new User();
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
                user.setStatus(rs.getBoolean("status"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }

    public String getHashedPasswordByEmail(String email) {
        try {
            checkConnection();
            String sql = "SELECT hashedPassword FROM [User] WHERE email = ?";
            try (PreparedStatement ps = con.prepareStatement(sql)) {
                ps.setString(1, email);
                try (ResultSet rs = ps.executeQuery()) {
                    if (rs.next()) {
                        return rs.getString("hashedPassword");
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean updateUserInformation(User user) {
        String sql = "UPDATE [User] SET roleId = ?, [hashedPassword] = ?, phoneNumber = ?, avatar = ?, name = ?, updatedBy = ?, lastUpdatedDate = ?, status = ? WHERE email = ?";
        boolean updated = false;
        try {
            checkConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, user.getRoleId());
            ps.setString(2, user.getHashedPassword());
            ps.setString(3, user.getPhoneNumber());
            ps.setString(4, user.getAvatar());
            ps.setString(5, user.getName());
            ps.setString(6, user.getUpdatedBy());
            ps.setObject(7, user.getLastUpdatedDate());
            ps.setBoolean(8, user.isStatus());
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

    public boolean InActiveUser(String email) {
        boolean changed = false;
        String sql = "UPDATE [User] SET status = 0 WHERE email = ?";
        try {
            checkConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, email);
            if (ps.executeUpdate() > 0) {
                changed = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return changed;
    }

    public boolean checkEmailExist(String email) {
        String sql = "SELECT COUNT(*) FROM [User] WHERE email = ?";
        try {
            checkConnection();
            try (PreparedStatement ps = con.prepareStatement(sql)) {
                ps.setString(1, email);
                try (ResultSet rs = ps.executeQuery()) {
                    if (rs.next() && rs.getInt(1) > 0) {
                        return true;
                    }
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

    public ArrayList<User> getUserbyType(String searchType, String keyword) {
        ArrayList<User> users = new ArrayList<>();
        try {
            checkConnection();
            String sql = "SELECT * FROM [dbo].[User] WHERE " + searchType + " LIKE ? AND status = 1";
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

    public boolean createUser(User user) {
        String sql = "INSERT INTO [dbo].[User] (roleId, name, hashedPassword, email, phoneNumber, avatar, createdBy, updatedBy, lastUpdatedDate, status) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        boolean added = false;
        try {
            checkConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, user.getRoleId());
            ps.setString(2, user.getName());
            ps.setString(3, BCrypt.hashpw(user.getHashedPassword(), BCrypt.gensalt()));
            ps.setString(4, user.getEmail());
            ps.setString(5, user.getPhoneNumber());
            ps.setString(6, user.getAvatar());
            ps.setString(7, user.getCreatedBy());
            ps.setString(8, null);
            ps.setString(9, null);
            ps.setBoolean(10, true);
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
        String sql = "UPDATE [dbo].[User] SET roleId = ?, phoneNumber = ?, avatar = ?, name = ?, updatedBy = ?, lastUpdatedDate = ?, status = ? WHERE email = ?";
        boolean updated = false;
        user.setLastUpdatedDate(LocalDateTime.now());
        try {
            checkConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, user.getRoleId());
            ps.setString(2, user.getPhoneNumber());
            ps.setString(3, user.getAvatar());
            ps.setString(4, user.getName());
            ps.setString(5, user.getUpdatedBy());
            LocalDateTime currentTime = LocalDateTime.now();
            user.setLastUpdatedDate(currentTime);
            ps.setTimestamp(6, Timestamp.valueOf(currentTime));
            ps.setBoolean(7, user.isStatus());
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
        String query = "SELECT * FROM [User] WHERE [roleId] <> 1 ORDER BY email OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";

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
                    u.setStatus(rs.getBoolean(11));
                    users.add(u);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return users;
    }

    public int getNoOfRecords() {
        String query = "SELECT COUNT(*) FROM [User] WHERE [roleId] <> 1";
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

    public ArrayList<User> searchUsers(String valueSearch) {
        ArrayList<User> users = new ArrayList<>();

        // Base SQL query
        String sql = "SELECT * FROM [User]";

        // Add WHERE clause if valueSearch is not empty or blank
        if (!valueSearch.isBlank() && !valueSearch.trim().isEmpty()) {
            sql += " WHERE email LIKE ? OR name LIKE ? OR phoneNumber LIKE ?";
        }

        try (PreparedStatement ps = con.prepareStatement(sql)) {
            // Set parameters if valueSearch is not empty
            if (!valueSearch.isBlank() && !valueSearch.trim().isEmpty()) {
                String searchPattern = "%" + valueSearch.trim().toLowerCase() + "%";
                ps.setString(1, searchPattern);
                ps.setString(2, searchPattern);
                ps.setString(3, searchPattern);
            }

            // Execute query
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    User u = new User();
                    u.setEmail(rs.getString("email")); // Use column names for clarity
                    u.setName(rs.getString("name"));
                    u.setRoleId(rs.getInt("roleId"));
                    u.setHashedPassword(rs.getString("hashedPassword"));
                    u.setPhoneNumber(rs.getString("phoneNumber"));
                    u.setAvatar(rs.getString("avatar"));
                    u.setCreatedBy(rs.getString("createdBy"));
                    u.setCreatedDate(rs.getTimestamp("createdDate").toLocalDateTime());
                    u.setUpdatedBy(rs.getString("updatedBy"));
                    Timestamp updatedTimestamp = rs.getTimestamp("lastUpdatedDate");
                    u.setLastUpdatedDate(updatedTimestamp != null ? updatedTimestamp.toLocalDateTime() : null);
                    u.setStatus(rs.getBoolean("status"));
                    users.add(u);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return users;
    }

    public User getUserByPhone(String phone) {
        User user = null;
        String sql = "SELECT * FROM [User] WHERE phoneNumber = ? AND status = 1";
        try {
            checkConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, phone);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                user = new User();
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
                user.setStatus(rs.getBoolean("status"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }

    public ArrayList<User> getUsersByRoleId(int roleId, int offset, int noOfRecords) {
        ArrayList<User> users = new ArrayList<>();
        String query = "SELECT * FROM [User] WHERE [roleId] = ? ORDER BY email OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";

        try (PreparedStatement ps = con.prepareStatement(query)) {
            ps.setInt(1, roleId);
            ps.setInt(2, offset);
            ps.setInt(3, noOfRecords);
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
                    u.setStatus(rs.getBoolean(11));
                    users.add(u);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return users;
    }

    public int getNoOfRecordsByRoleId(int roleId) {
        String query = "SELECT COUNT(*) FROM [User] WHERE [roleId] = ?";
        try (PreparedStatement ps = con.prepareStatement(query)) {
            ps.setInt(1, roleId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1);
                }
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
        ArrayList<User> users = UserDAO.INSTANCE.searchUsers("u");
        System.out.println(users.toString());
//        User u = UserDAO.INSTANCE.getUserbyID("1");
//        System.out.println(u);
//        UserDAO.INSTANCE.updateUser(u);
//        System.out.println(UserDAO.INSTANCE.getUsers(0, 10));
    }

    public ArrayList<User> getUserbyName(String keyword) {
        ArrayList<User> users = new ArrayList<>();
        try {
            checkConnection();
            String sql = "SELECT * FROM [dbo].[User] WHERE name LIKE ? AND status = 1";
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

    public ArrayList<User> getUserbyRoleID(int roleId) {
        ArrayList<User> users = new ArrayList<>();
        try {
            checkConnection();
            String sql = "SELECT * FROM [dbo].[User] WHERE roleId = ?";
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

    public boolean ActiveUser(String email) {
        boolean changed = false;
        String sql = "UPDATE [User] SET status = 1 WHERE email = ?";
        try {
            checkConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, email);
            if (ps.executeUpdate() > 0) {
                changed = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return changed;
    }

    public User getAllUserByEmail(String email) {
        String sql = "SELECT * FROM [User] WHERE email = ?";
        User user = null;
        try {
            checkConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                user = new User();
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
                user.setStatus(rs.getBoolean("status"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }
}
