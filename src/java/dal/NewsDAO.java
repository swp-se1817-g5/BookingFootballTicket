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
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import models.News;
import models.NewsState;
import models.NewsStatus;

/**
 *
 * @author nguye
 */
public class NewsDAO {

    private static volatile NewsDAO INSTANCE;
    private final Connection connect;
    // Define constants for the string literals
    private static final String SQL_QUERY_GET_LIST_NEWS = "SELECT news.*, newsState.stateName, newsStatus.statusName\n"
            + "FROM News news\n"
            + "JOIN NewsStatus newsStatus ON newsStatus.statusId = news.statusId\n"
            + "JOIN NewsState newsState ON newsState.stateId = news.stateId\n"
            + "WHERE news.isDeleted = 0;";
    private static final String SQL_QUERY_GET_LIST_NEWS_STATE = "SELECT * FROM NewsState";
    private static final String SQL_QUERY_GET_LIST_NEWS_STATUS = "SELECT * FROM NewsStatus";
    private static final String NEWS_ID = "newsId";
    private static final String TITLE = "title";
    private static final String CONTENT = "content";
    private static final String IMAGE = "image";
    private static final String CONCLUSION = "conclusion";
    private static final String CREATED_BY = "createdBy";
    private static final String CREATED_DATE = "createdDate";
    private static final String UPDATED_BY = "updatedBy";
    private static final String LAST_UPDATED_DATE = "lastUpdatedDate";
    private static final String POST_ON = "postOn";
    private static final String STATUS_ID = "statusId";
    private static final String STATUS_NAME = "statusName";
    private static final String STATE_ID = "stateId";
    private static final String STATE_NAME = "stateName";

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
                news.setImage(rs.getString(IMAGE));
                news.setConclusion(rs.getString(CONCLUSION));
                news.setCreateBy(rs.getString(CREATED_BY));
                news.setCreatedDate(rs.getTimestamp(CREATED_DATE) != null ? rs.getTimestamp(CREATED_DATE).toLocalDateTime() : null);
                news.setUpdateBy(rs.getString(UPDATED_BY));
                news.setLastUpdateDate(rs.getTimestamp(LAST_UPDATED_DATE) != null ? rs.getTimestamp(LAST_UPDATED_DATE).toLocalDateTime() : null);
                news.setPostOn(rs.getTimestamp(POST_ON) != null ? rs.getTimestamp(POST_ON).toLocalDateTime() : null);
                NewsStatus newsStatus = new NewsStatus();
                newsStatus.setStatusName(rs.getString(STATUS_NAME));
                news.setStatusId(newsStatus);
                NewsState newsState = new NewsState();
                newsState.setStateName(rs.getString(STATE_NAME));
                news.setStateId(newsState);
                list.add(news);
            }
        } catch (SQLException ex) {
            Logger.getLogger(NewsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
//

    public static void main(String[] args) {
        System.out.println(NewsDAO.getInstance().getlistNews());
    }

    //Search by 
    public ArrayList<News> search(String value) {
        ArrayList<News> list = new ArrayList<>();
        String SQL_QUERY_SEARCH_NEWS = "SELECT news.*, newsState.stateName, newsStatus.statusName\n"
                + "FROM News news\n"
                + "JOIN NewsStatus newsStatus ON newsStatus.statusId = news.statusId\n"
                + "JOIN NewsState newsState ON newsState.stateId = news.stateId"
                + " WHERE (title LIKE '%" + value + "%' OR content LIKE '%" + value + "%' )AND news.isDeleted = 0;";
        try {
            ps = connect.prepareStatement(SQL_QUERY_SEARCH_NEWS);
            rs = ps.executeQuery();
            while (rs.next()) {
                News news = new News();
                news.setNewsId(rs.getInt(NEWS_ID));
                news.setTitle(rs.getString(TITLE));
                news.setContent(rs.getString(CONTENT));
                news.setImage(rs.getString(IMAGE));
                news.setConclusion(rs.getString(CONCLUSION));
                news.setCreateBy(rs.getString(CREATED_BY));
                news.setCreatedDate(rs.getTimestamp(CREATED_DATE) != null ? rs.getTimestamp(CREATED_DATE).toLocalDateTime() : null);
                news.setUpdateBy(rs.getString(UPDATED_BY));
                news.setLastUpdateDate(rs.getTimestamp(LAST_UPDATED_DATE) != null ? rs.getTimestamp(LAST_UPDATED_DATE).toLocalDateTime() : null);
                news.setPostOn(rs.getTimestamp(POST_ON) != null ? rs.getTimestamp(POST_ON).toLocalDateTime() : null);
                NewsStatus newsStatus = new NewsStatus();
                newsStatus.setStatusName(rs.getString(STATUS_NAME));
                news.setStatusId(newsStatus);
                NewsState newsState = new NewsState();
                newsState.setStateName(rs.getString(STATE_NAME));
                news.setStateId(newsState);
                list.add(news);
            }
        } catch (SQLException ex) {
            Logger.getLogger(NewsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
//
//    public static void main(String[] args) {
//        ArrayList<News> list = NewsDAO.getInstance().search("Title ");
//        for (News news : list) {
//            System.out.println(news.toString());
//        }
//    }
//  Create a news

    public int createNews(News news) {
        int n = 0;
        String sql = "INSERT INTO [News] ([title],[content],[image],[conclusion],[statusId],[stateId],[createdBy]) VALUES(?,?,?,?,?,?,?)";
        try {
            ps = connect.prepareStatement(sql);
            ps.setString(1, news.getTitle());
            ps.setString(2, news.getContent());
            ps.setString(3, news.getImage());
            ps.setString(4, news.getConclusion());
            ps.setInt(5, news.getStatusId().getStatusId());
            ps.setInt(6, news.getStateId().getStateId());
            ps.setString(7, news.getCreateBy());
            n = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(NewsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }
//    public static void main(String[] args) {
//        NewsState n1 = new NewsState();
//        n1.setStateId(1);
//        NewsStatus n2 = new NewsStatus();
//        n2.setStatusId(1);
//        News n = new News("TITLE", "CONTENT", "IMAGE", "CONCLUSION", "CREATED_BY", n2, n1);
//        System.out.println(NewsDAO.getInstance().createNews(n));
//    }

// Update news
    public int updateNews(News news) {
        int m = 0;
        String sql = "UPDATE [News]"
                + "   SET [title] = ?"
                + "      ,[content] = ?"
                + "      ,[image] = ?"
                + "      ,[statusId] = ?"
                + "      ,[stateId] = ?"
                + "      ,[updatedBy] = ?"
                + " WHERE newsId =?";
        try {
            ps = connect.prepareStatement(sql);
            ps.setString(1, news.getTitle());
            ps.setString(2, news.getContent());
            ps.setString(3, news.getImage());
            ps.setInt(4, news.getStatusId().getStatusId());
            ps.setInt(5, news.getStateId().getStateId());
            ps.setString(6, news.getUpdateBy());
            ps.setInt(7, news.getNewsId());
            m = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(NewsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return m;
    }
//    public static void main(String[] args) {
//        NewsState n1 = new NewsState();
//        n1.setStateId(1);
//        NewsStatus n2 = new NewsStatus();
//        n2.setStatusId(1);
//        News n = new News("TITLE", "CONTENT", "IMAGE", "CONCLUSION", "CREATED_BY", n2, n1);
//        System.out.println(NewsDAO.getInstance().updateNews(n));
//    }
//Delete news

    public int deleteNews(int newsId) {
        int i = 0;
        String sql = "UPDATE [News]"
                + "   SET[isDeleted] = ?"
                + " WHERE newsId =?";
        try {
            ps = connect.prepareStatement(sql);
            ps.setInt(1, 1);
            ps.setInt(2, newsId);
            i = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(NewsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return i;
    }
//    public static void main(String[] args) {
//        System.out.println(NewsDAO.getInstance().deleteNews(5));
//    }
// Get list all of news

    public News getNewsByNewsId(int newsId) {
        String sql = "SELECT * FROM News n WHERE n.newsId =? AND isDeleted = 0";
        try {
            ps = connect.prepareStatement(sql);
            ps.setInt(1, newsId);
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
                NewsStatus newsStatus = new NewsStatus();
                newsStatus.setStatusName(rs.getString(STATUS_ID));
                news.setStatusId(newsStatus);
                NewsState newsState = new NewsState();
                newsState.setStateName(rs.getString(STATE_ID));

                news.setStateId(newsState);
                return news;
            }
        } catch (SQLException ex) {
            Logger.getLogger(NewsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
//    public static void main(String[] args) {
//        System.out.println(NewsDAO.getInstance().getNewsByNewsId(1));
//    }

    public ArrayList<NewsState> getListState() {
        ArrayList<NewsState> list = new ArrayList<>();
        try {
            ps = connect.prepareStatement(SQL_QUERY_GET_LIST_NEWS_STATE);
            rs = ps.executeQuery();
            while (rs.next()) {
                NewsState newsState = new NewsState();
                newsState.setStateId(rs.getInt(STATE_ID));
                newsState.setStateName(rs.getString(STATE_NAME));
                list.add(newsState);
            }
        } catch (SQLException ex) {
            Logger.getLogger(NewsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public ArrayList<NewsStatus> getListStatus() {
        ArrayList<NewsStatus> list = new ArrayList<>();
        try {
            ps = connect.prepareStatement(SQL_QUERY_GET_LIST_NEWS_STATUS);
            rs = ps.executeQuery();
            while (rs.next()) {
                NewsStatus newsStatus = new NewsStatus();
                newsStatus.setStatusId(rs.getInt(STATUS_ID));
                newsStatus.setStatusName(rs.getString(STATUS_NAME));
                list.add(newsStatus);
            }
        } catch (SQLException ex) {
            Logger.getLogger(NewsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

//    public static void main(String[] args) {
//        ArrayList<NewsStatus> list = NewsDAO.getInstance().getListStatus();
//        for (NewsStatus newsState : list) {
//            System.out.println(newsState.toString());
//        }
//    }
}
