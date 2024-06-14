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

    private static volatile NewsDAO INSTANCE;
    private final Connection connect;
    // Define constants for the string literals
    private static final String SQL_QUERY_GET_LIST_NEWS = "SELECT * FROM News n WHERE isDeleted = 0";
    private static final String NEWS_ID = "newsId";
    private static final String TITLE = "title";
    private static final String CONTENT = "content";
    private static final String CREATED_BY = "createdBy";
    private static final String CREATED_DATE = "createdDate";
    private static final String UPDATED_BY = "updatedBy";
    private static final String LAST_UPDATED_DATE = "lastUpdatedDate";
    private static final String STATUS = "status";
    private static final String STATE = "state";

    private NewsDAO() {
        // Private constructor to prevent instantiation
        connect = new DBContext().connect;
    }

    public static NewsDAO getInstance() {
        if (INSTANCE == null) {
            synchronized (NewsDAO.class) {
                if (INSTANCE == null) {
                    INSTANCE = new NewsDAO();
                }
            }
        }
        return INSTANCE;
    }
    PreparedStatement ps = null;
    ResultSet rs = null;

// Get list all of news
    public ArrayList<News> getlistNews() {
        ArrayList<News> list = new ArrayList<>();
        try {
            ps = connect.prepareStatement(SQL_QUERY_GET_LIST_NEWS);
            rs = ps.executeQuery();
            while (rs.next()) {
                News news = new News();
                news.setNewsId(rs.getInt(NEWS_ID));
                news.setTitle(rs.getString(TITLE));
                news.setContent(rs.getString(CONTENT));
                news.setCreateBy(rs.getString(CREATED_BY));
                news.setCreatedDate(rs.getTimestamp(CREATED_DATE) != null ? rs.getTimestamp(CREATED_DATE).toLocalDateTime() : null);
                news.setUpdateBy(rs.getString(UPDATED_BY));
                news.setLastUpdateDate(rs.getTimestamp(LAST_UPDATED_DATE) != null ? rs.getTimestamp(LAST_UPDATED_DATE).toLocalDateTime() : null);
                news.setStatus(rs.getInt(STATUS));
                news.setState(rs.getBoolean(STATE));
                list.add(news);
            }
        } catch (SQLException ex) {
            Logger.getLogger(NewsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

//Search by 
    public ArrayList<News> search(String value) {
        ArrayList<News> list = new ArrayList<>();
        String SQL_QUERY_SEARCH_NEWS = "SELECT * FROM News WHERE mainTitle LIKE '%" + value + "%' OR title LIKE '%" + value + "%' OR  mainContent LIKE '%" + value + "%' OR  content LIKE '%" + value + "%' OR createdBy LIKE '%" + value + "%' OR updatedBy LIKE '%" + value + "%'";
        try {
            ps = connect.prepareStatement(SQL_QUERY_SEARCH_NEWS);
            rs = ps.executeQuery();
            while (rs.next()) {
                News n = new News();
                n.setNewsId(rs.getInt(NEWS_ID));
                n.setTitle(rs.getString(TITLE));
                n.setContent(rs.getString(CONTENT));
                n.setCreateBy(rs.getString(CREATED_BY));
                n.setCreatedDate(rs.getTimestamp(CREATED_DATE) != null ? rs.getTimestamp(CREATED_DATE).toLocalDateTime() : null);
                n.setUpdateBy(rs.getString(UPDATED_BY));
                n.setLastUpdateDate(rs.getTimestamp(LAST_UPDATED_DATE) != null ? rs.getTimestamp(LAST_UPDATED_DATE).toLocalDateTime() : null);
                list.add(n);
            }
        } catch (SQLException ex) {
            Logger.getLogger(NewsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
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
                n.setNewsId(rs.getInt(NEWS_ID));
                n.setTitle(rs.getString(TITLE));
                n.setContent(rs.getString(CONTENT));
                n.setCreateBy(rs.getString(CREATED_BY));
                n.setCreatedDate(rs.getTimestamp(CREATED_DATE) != null ? rs.getTimestamp(CREATED_DATE).toLocalDateTime() : null);
                n.setUpdateBy(rs.getString(UPDATED_BY));
                n.setLastUpdateDate(rs.getTimestamp(LAST_UPDATED_DATE) != null ? rs.getTimestamp(LAST_UPDATED_DATE).toLocalDateTime() : null);
                n.setStatus(rs.getInt(STATUS));
                n.setState(rs.getBoolean(STATE));
                return n;
            }
        } catch (SQLException ex) {
            Logger.getLogger(NewsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
}
