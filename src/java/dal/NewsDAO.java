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
        String sql = "SELECT * FROM News n WHERE isDeleted = 0";
        try {
            ps = connect.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                News n = new News();
                n.setNewsId(rs.getInt("newsId"));
                n.setMainTitle(rs.getString("mainTitle"));
                n.setTitle(rs.getString("title"));
                n.setMainContent(rs.getString("mainContent"));
                n.setContent(rs.getString("content"));
                n.setCreateBy(rs.getString("createdBy"));
                n.setCreatedDate(rs.getTimestamp("createdDate") != null ? rs.getTimestamp("createdDate").toLocalDateTime() : null);
                n.setUpdateBy(rs.getString("updatedBy"));
                n.setLastUpdateDate(rs.getTimestamp("lastUpdatedDate") != null ? rs.getTimestamp("lastUpdatedDate").toLocalDateTime() : null);
                n.setStatus(rs.getInt("status"));
                n.setState(rs.getBoolean("state"));
                list.add(n);
            }
        } catch (SQLException ex) {
            Logger.getLogger(NewsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
//    public static void main(String[] args) {
//        System.out.println(NewsDAO.INSTANCE.getlistNews().toString());
//    }
//Search by 

    public ArrayList<News> search(String value) {
        ArrayList<News> list = new ArrayList<>();
        String sql = "SELECT * FROM News\n"
                + "WHERE mainTitle LIKE '%" + value + "%' OR\n"
                + "    title LIKE '%" + value + "%' OR\n"
                + "    mainContent LIKE '%" + value + "%' OR\n"
                + "    content LIKE '%" + value + "%' OR\n"
                + "    createdBy LIKE '%" + value + "%' OR\n"
                + "    updatedBy LIKE '%" + value + "%'";

        try {
            ps = connect.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                News n = new News();
                n.setNewsId(rs.getInt("newsId"));
                n.setMainTitle(rs.getString("mainTitle"));
                n.setTitle(rs.getString("title"));
                n.setMainContent(rs.getString("mainContent"));
                n.setContent(rs.getString("content"));
                n.setCreateBy(rs.getString("createdBy"));
                n.setCreatedDate(rs.getTimestamp("createdDate") != null ? rs.getTimestamp("createdDate").toLocalDateTime() : null);
                n.setUpdateBy(rs.getString("updatedBy"));
                n.setLastUpdateDate(rs.getTimestamp("lastUpdatedDate") != null ? rs.getTimestamp("lastUpdatedDate").toLocalDateTime() : null);
                list.add(n);
            }
        } catch (SQLException ex) {
            Logger.getLogger(NewsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
//
//    public static void main(String[] args) {
//        for (Object search : NewsDAO.INSTANCE.search("Stadium")) {
//            System.out.println(search.toString());
//        }
//    }

//  Create a news
    public int createNews(News n) {
        int i = 0;
        String sql = "INSERT INTO [News] ([mainTitle],[title],[mainContent],[content],[status],[state],[createdBy]) VALUES(?,?,?,?,?,?,?)";
        try {
            ps = connect.prepareStatement(sql);
            ps.setString(1, n.getMainTitle());
            ps.setString(2, n.getTitle());
            ps.setString(3, n.getMainContent());
            ps.setString(4, n.getContent());
            ps.setInt(5, n.getStatus());
            ps.setBoolean(6, n.isState());
            ps.setString(7, n.getCreateBy());
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
                + "   SET [mainTitle] = ?"
                + "      ,[title] = ?"
                + "      ,[mainContent] = ?"
                + "      ,[content] = ?"
                + "      ,[status] = ?"
                + "      ,[state] = ?"
                + "      ,[updatedBy] = ?"
                + " WHERE newsId =?";
        try {
            ps = connect.prepareStatement(sql);
            ps.setString(1, n.getMainTitle());
            ps.setString(2, n.getTitle());
            ps.setString(3, n.getMainContent());
            ps.setString(4, n.getContent());
            ps.setInt(5, n.getStatus());
            ps.setBoolean(6, n.isState());
            ps.setString(7, n.getUpdateBy());
            ps.setInt(8, n.getNewsId());
            m = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(NewsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return m;
    }

//Delete news
    public int deleteNews(News n) {
        int i = 0;
        String sql = "UPDATE [News]"
                + "   SET[isDeleted] = ?"
                + " WHERE newsId =?";
        try {
            ps = connect.prepareStatement(sql);
            ps.setInt(1, n.isIsDeleted() ? 1 : 0);
            ps.setInt(2, n.getNewsId());
            i = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(NewsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return i;
    }
// Get list all of news

    public News getNewsByNewsId(int newsId) {
        String sql = "SELECT * FROM News n WHERE n.newsId =? AND isDeleted = 0";
        try {
            ps = connect.prepareStatement(sql);
            ps.setInt(1, newsId);
            rs = ps.executeQuery();
            while (rs.next()) {
                News n = new News();
                n.setNewsId(rs.getInt("newsId"));
                n.setMainTitle(rs.getString("mainTitle"));
                n.setTitle(rs.getString("title"));
                n.setMainContent(rs.getString("mainContent"));
                n.setContent(rs.getString("content"));
                n.setCreateBy(rs.getString("createdBy"));
                n.setCreatedDate(rs.getTimestamp("createdDate") != null ? rs.getTimestamp("createdDate").toLocalDateTime() : null);
                n.setUpdateBy(rs.getString("updatedBy"));
                n.setLastUpdateDate(rs.getTimestamp("lastUpdatedDate") != null ? rs.getTimestamp("lastUpdatedDate").toLocalDateTime() : null);
                n.setStatus(rs.getInt("status"));
                n.setState(rs.getBoolean("state"));
                return n;
            }
        } catch (SQLException ex) {
            Logger.getLogger(NewsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    public static void main(String[] args) {
        System.out.println(NewsDAO.INSTANCE.getNewsByNewsId(1).toString());
    }
}
