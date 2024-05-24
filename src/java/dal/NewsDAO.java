/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import models.News;
import models.User;

/**
 *
 * @author nguye
 */
public class NewsDAO {

    public static NewsDAO INSTANCE = new NewsDAO();
    private Connection connect;

    private NewsDAO() {
        if (INSTANCE == null) {
            connect = new DBContext().connect;
        } else {
            INSTANCE = this;
        }
    }
    PreparedStatement ps = null;
    ResultSet rs = null;
// Get list all of news
    public ArrayList<News> getlistNews() {
        ArrayList<News> list = new ArrayList<>();
        String sql = "SELECT *"
                + "FROM News n\n"
                + "JOIN [User] u on u.userId = n.userId";
        try {
            ps = connect.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                News n = new News();
                n.setNewsId(rs.getInt("newsId"));
                User u = new User();
                u.setUserId(rs.getInt("userId"));
                n.setUserId(u);
                n.setTitle(rs.getString("title"));
                n.setContent(rs.getString("content"));
                n.setCreateBy(rs.getString("createdBy"));
                n.setCreatedDate(rs.getTimestamp("createdDate").toLocalDateTime());
                u.setUpdatedBy(rs.getString("updatedBy"));
                n.setUpdateBy(u);
                n.setLastUpdateDate(rs.getTimestamp("lastUpdatedDate").toLocalDateTime());
                n.setIsDeleted(rs.getBoolean("isDeleted"));

                list.add(n);
            }
        } catch (SQLException ex) {
            Logger.getLogger(NewsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return list;
    }
//  Create a news
    public int createNews(News n, User u) {
        int m = 0;
        String sql = "INSERT INTO News ([userId],[title],[content],[createdBy],[updatedBy],[isDeleted])"
                + "     VALUES (?,?,?,?,?,?)";
        try {
            ps = connect.prepareStatement(sql);
            ps.setInt(1, u.getUserId());
            ps.setString(2, n.getTitle());
            ps.setString(3, n.getContent());
            ps.setString(4, n.getCreateBy());
            ps.setString(5, n.getUserId().getUserName());
            ps.setBoolean(6, n.isIsDeleted());
            m = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(NewsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return m;
    }
// Update news
    public int updateNews(News n) {
        int m = 0;
        String sql = "UPDATE [News]"
                + "   SET [title] = ?"
                + "      ,[content] = ?"
                + "      ,[createdBy] = ?"
                + "      ,[updatedBy] = ?"
                + "      ,[isDeleted] = ?"
                + " WHERE newsId =? AND [userId] =?";
        try {
            ps = connect.prepareStatement(sql);
            ps.setString(1, n.getTitle());
            ps.setString(2, n.getContent());
            ps.setString(3, n.getCreateBy());
            ps.setString(4, n.getUserId().getUserName());
            System.out.println(n.getUserId().getUserName());
            ps.setBoolean(5, n.isIsDeleted());
            ps.setInt(6, n.getNewsId());
            ps.setInt(7, n.getUserId().getUserId());
            m = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(NewsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return m;
    }
//     
//    public static void main(String[] args) {
//        ArrayList<News> list = NewsDAO.INSTANCE.getlistNews();
//        System.out.println(list.toString());
//        User u = new User();
//        u.setUserId(2);
//        u.setUserName("Duong");
//        News n = new News(u, "title", "content", "Duong1", u, false);
//        n.setNewsId(11);
//        System.out.println(NewsDAO.INSTANCE.createNews(n, u));
//        System.out.println(NewsDAO.INSTANCE.updateNews(n));
//    }
}
