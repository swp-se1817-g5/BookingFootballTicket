/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import models.News;
import models.NewsState;

/**
 *
 * @author nguye
 */
public class NewsDAO {

    private static volatile NewsDAO INSTANCE;
    private final Connection connect;
    // Define constants for the string literals
    private static final String SQL_QUERY_GET_LIST_NEWS = "SELECT news.*, newsState.stateName\n"
            + "FROM News news\n"
            + "JOIN NewsState newsState ON newsState.stateId = news.stateId\n"
            + "WHERE news.isDeleted = 0";
    private static final String SQL_QUERY_GET_LIST_NEWS_STATE = "SELECT * FROM NewsState";
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

    //Search by 
    public ArrayList<News> getlistNews(String value) {
        ArrayList<News> list = new ArrayList<>();
        String SQL_QUERY_SEARCH_NEWS = "SELECT news.*, newsState.stateName\n"
                + "FROM News news\n"
                + "JOIN NewsState newsState ON newsState.stateId = news.stateId"
                + " WHERE (title LIKE '%" + value + "%' OR content LIKE '%" + value + "%' )AND news.isDeleted = 0";
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
                NewsState newsState = new NewsState();
                newsState.setStateId(rs.getInt(STATE_ID));
                news.setStateId(newsState);
                newsState.setStateName(rs.getString(STATE_NAME));
                list.add(news);
            }
        } catch (SQLException ex) {
            Logger.getLogger(NewsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    //Search by 
    public ArrayList<News> getlistNewsInHomePage(String value) {
        ArrayList<News> list = new ArrayList<>();
        String SQL_QUERY_SEARCH_NEWS = "SELECT news.*, newsState.stateName "
                + "FROM News news "
                + "JOIN NewsState newsState ON newsState.stateId = news.stateId "
                + "WHERE (title LIKE '%" + value + "%' OR content LIKE '%" + value + "%' ) AND news.isDeleted = 0 AND news.stateId = '2'"
                + "ORDER BY news.newsId DESC";
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

    public ArrayList<News> filterPostOn(String startDateValue, String endDateValue, String valueSearch) {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm");
        ArrayList<News> list = new ArrayList<>();
        StringBuilder sql_builder = new StringBuilder("SELECT news.*, newsState.stateName "
                + "FROM News news "
                + "JOIN NewsState newsState ON newsState.stateId = news.stateId "
                + "WHERE news.isDeleted = 0 AND news.stateId = '2'");

        if (startDateValue != null && !startDateValue.isBlank()) {
            sql_builder.append(" AND postOn >= ?"); // Thêm khoảng trắng ở đầu chuỗi điều kiện
        }
        if (endDateValue != null && !endDateValue.isBlank()) {
            sql_builder.append(" AND postOn <= ?"); // Thêm khoảng trắng ở đầu chuỗi điều kiện
        }
        if (valueSearch != null && !valueSearch.isBlank()) {
            sql_builder.append(" AND (title LIKE ? OR content LIKE ?)"); // Thêm khoảng trắng ở đầu chuỗi điều kiện
        }
        String sql = sql_builder.toString();
        try {
            ps = connect.prepareStatement(sql);

            int parameterIndex = 1;
            if (startDateValue != null && !startDateValue.isBlank()) {
                LocalDateTime localDateTime_startDate = LocalDateTime.parse(startDateValue + "T00:00", formatter);
                Timestamp startTime = Timestamp.valueOf(localDateTime_startDate);
                ps.setTimestamp(parameterIndex++, startTime);
            }
            if (endDateValue != null && !endDateValue.isBlank()) {
                LocalDateTime localDateTime_endDate = LocalDateTime.parse(endDateValue + "T00:00", formatter);
                Timestamp endTime = Timestamp.valueOf(localDateTime_endDate);
                ps.setTimestamp(parameterIndex++, endTime);
            }
            if (valueSearch != null && !valueSearch.isBlank()) {
                String searchPattern = "%" + valueSearch + "%";
                ps.setString(parameterIndex++, searchPattern);
                ps.setString(parameterIndex++, searchPattern);
            }
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

//  Create a news
    public boolean createNews(News news) {
        boolean n = false;
        String sql = "INSERT INTO [News] ([title],[content],[image],[conclusion],[stateId],[createdBy]) VALUES(?,?,?,?,?,?)";
        try {
            ps = connect.prepareStatement(sql);
            ps.setString(1, news.getTitle());
            ps.setString(2, news.getContent());
            ps.setString(3, news.getImage());
            ps.setString(4, news.getConclusion());
            ps.setInt(5, news.getStateId().getStateId());
            ps.setString(6, news.getCreateBy());
            n = ps.executeUpdate() > 0;
        } catch (SQLException ex) {
            Logger.getLogger(NewsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }


// Update news
    public boolean updateNews(News news) {
        boolean m = false;
        String sql = "UPDATE [News]"
                + "   SET [title] = ?"
                + "      ,[content] = ?"
                + "      ,[conclusion] = ?"
                + "      ,[image] = ?"
                + "      ,[stateId] = ?"
                + "      ,[updatedBy] = ?"
                + " WHERE newsId =?";
        try {
            ps = connect.prepareStatement(sql);
            ps.setString(1, news.getTitle());
            ps.setString(2, news.getContent());
            ps.setString(3, news.getConclusion());
            ps.setString(4, news.getImage());
            ps.setInt(5, news.getStateId().getStateId());
            ps.setString(6, news.getUpdateBy());
            ps.setInt(7, news.getNewsId());
            m = ps.executeUpdate() > 0;
        } catch (SQLException ex) {
            Logger.getLogger(NewsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return m;
    }

//Delete news

    public boolean deleteNews(int newsId) {
        boolean m = false;
        String sql = "UPDATE [News]"
                + "   SET[isDeleted] = ?"
                + " WHERE newsId =?";
        try {
            ps = connect.prepareStatement(sql);
            ps.setInt(1, 1);
            ps.setInt(2, newsId);
            m = ps.executeUpdate() > 0;
        } catch (SQLException ex) {
            Logger.getLogger(NewsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return m;
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
                news.setConclusion(rs.getString(CONCLUSION));
                news.setImage(rs.getString(IMAGE));
                news.setCreateBy(rs.getString(CREATED_BY));
                news.setCreatedDate(rs.getTimestamp(CREATED_DATE) != null ? rs.getTimestamp(CREATED_DATE).toLocalDateTime() : null);
                news.setUpdateBy(rs.getString(UPDATED_BY));
                news.setLastUpdateDate(rs.getTimestamp(LAST_UPDATED_DATE) != null ? rs.getTimestamp(LAST_UPDATED_DATE).toLocalDateTime() : null);
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
//        System.out.println(NewsDAO.getInstance().getNewsByNewsId(5));
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

    public static void main(String[] args) {
        System.out.println(NewsDAO.getInstance().getlistNews(""));
    }
 

}
