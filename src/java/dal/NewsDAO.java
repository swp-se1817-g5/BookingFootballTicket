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
import models.Match;
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
                + "JOIN [User] u on u.userId = n.userId\n"
                + "JOIN [Match] m on m.matchId = n.matchId";
        try {
            ps = connect.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                News n = new News();
                n.setNewsId(rs.getInt("newsId"));
                Match m = new Match();
                m.setMatchId(rs.getInt("matchId"));
                n.setMatchId(m);
                User u = new User();
                u.setUserId(rs.getInt("userId"));
                n.setUserId(u);
                n.setTitle(rs.getString("title"));
                n.setContent(rs.getString("content"));
                n.setCreateBy(rs.getString("createdBy"));
                n.setCreatedDate(rs.getTimestamp("createdDate") != null ? rs.getTimestamp("createdDate").toLocalDateTime() : null);
                n.setUpdateBy(rs.getString("updatedBy"));
                n.setLastUpdateDate(rs.getTimestamp("lastUpdatedDate") != null ? rs.getTimestamp("lastUpdatedDate").toLocalDateTime() : null);
                n.setStatus(rs.getInt("status"));
                n.setIsDeleted(rs.getBoolean("isDeleted"));
                list.add(n);
            }

        } catch (SQLException ex) {
            Logger.getLogger(NewsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
//  Create a news

    public int createNews(News n, User u, Match m) {
        int i = 0;
        String sql = "INSERT INTO News ([userId],[matchId],[title],[content],[createdBy],[status])"
                + "     VALUES (?,?,?,?,?,?)";
        try {
            ps = connect.prepareStatement(sql);
            ps.setInt(1, u.getUserId());
            ps.setInt(2, m.getMatchId());
            ps.setString(3, n.getTitle());
            ps.setString(4, n.getContent());
            ps.setString(5, n.getCreateBy());
            ps.setInt(6, n.getStatus());
            i = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(NewsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return i;
    }
// Update news

    public int updateNews(News n) {
        int m = 0;
        String sql = "UPDATE [News]"
                + "   SET [title] = ?"
                + "      ,[content] = ?"
                + "      ,[createdBy] = ?"
                + "      ,[updatedBy] = ?"
                + "      ,[status] = ?"
                + "      ,[isDeleted] = ?"
                + " WHERE newsId =? AND [userId] =?";
        try {
            ps = connect.prepareStatement(sql);
            ps.setString(1, n.getTitle());
            ps.setString(2, n.getContent());
            ps.setString(3, n.getCreateBy());
            ps.setString(4, n.getUserId().getUserName());
            ps.setInt(5, n.getStatus());
            ps.setBoolean(6, n.isIsDeleted());
            ps.setInt(7, n.getNewsId());
            ps.setInt(8, n.getUserId().getUserId());
            m = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(NewsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return m;

    }
// Get list all of news

    public News getNews(int newsId) {
        String sql = "SELECT *"
                + "FROM News n\n"
                + "JOIN [User] u on u.userId = n.userId\n"
                + "JOIN [Match] m on m.matchId = n.matchId\n"
                + "WHERE n.newsId =?";
        try {
            ps = connect.prepareStatement(sql);
            ps.setInt(1, newsId);
            rs = ps.executeQuery();
            while (rs.next()) {
                News n = new News();
                n.setNewsId(rs.getInt("newsId"));
                Match m = new Match();
                m.setMatchId(rs.getInt("matchId"));
                n.setMatchId(m);
                User u = new User();
                u.setUserId(rs.getInt("userId"));
                n.setUserId(u);
                n.setTitle(rs.getString("title"));
                n.setContent(rs.getString("content"));
                n.setCreateBy(rs.getString("createdBy"));
                n.setCreatedDate(rs.getTimestamp("createdDate") != null ? rs.getTimestamp("createdDate").toLocalDateTime() : null);
                n.setUpdateBy(rs.getString("updatedBy"));
                n.setLastUpdateDate(rs.getTimestamp("lastUpdatedDate") != null ? rs.getTimestamp("lastUpdatedDate").toLocalDateTime() : null);
                n.setStatus(rs.getInt("status"));
                n.setIsDeleted(rs.getBoolean("isDeleted"));
                return n;
            }

        } catch (SQLException ex) {
            Logger.getLogger(NewsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public static void main(String[] args) {
//        ArrayList<News> list = NewsDAO.INSTANCE.getlistNews();
//        System.out.println(list.toString());
        User u = new User();
        u.setUserId(2);
        u.setUserName("Duong");
        Match m = new Match();
        m.setMatchId(4);
        News n = new News(m, u, "4", "4", "null", 0);
        n.setNewsId(11);
        System.out.println(NewsDAO.INSTANCE.createNews(n, u, m));
//        System.out.println(NewsDAO.INSTANCE.updateNews(n));
    }
}
