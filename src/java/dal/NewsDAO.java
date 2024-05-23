/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
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
                n.setUserId(rs.getInt("userId"));
                n.setTitle(rs.getString("title"));
                n.setContent(rs.getString("content"));
                n.setPostTime(rs.getDate("postTime").toLocalDate());
                n.setCreateBy(rs.getString("createdBy"));
                n.setCreatedDate(rs.getDate("createdDate").toLocalDate());
                n.setUpdateBy(rs.getString("updatedBy"));
                n.setLastUpdateDate(rs.getDate("lastUpdatedDate").toLocalDate());
                n.setIsDeleted(rs.getBoolean("isDeleted"));
                list.add(n);
            }
        } catch (SQLException ex) {
            Logger.getLogger(NewsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return list;
    }

    public int insertNews(News n, User u) {
        int m = 0;
        String sql = "INSERT INTO News ([userId],[title],[content],[createdBy],[updatedBy],[isDeleted])"
                + "     VALUES (?,?,?,?,?,?)";
        try {
            ps = connect.prepareStatement(sql);
            ps.setInt(1, u.getUserId());
            ps.setString(2, n.getTitle());
            ps.setString(3, n.getContent());
            ps.setString(4, n.getCreateBy());
            ps.setString(5, n.getUpdateBy());
            ps.setBoolean(6, n.isIsDeleted());
            m = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(NewsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return m;
    }

    public static void main(String[] args) {
//        ArrayList<News> list = NewsDAO.INSTANCE.getlistNews();
//        System.out.println(list.toString());
        User u = new User();
        u.setUserId(2);
        u.setName("Duong");
//        News n = new News(u.getUserId(), "title", "content", "createBy", u.getUserName(), true);
//        System.out.println(NewsDAO.INSTANCE.insertNews(n, u));
    }
}
