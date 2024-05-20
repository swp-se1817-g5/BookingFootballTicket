package dal;

import java.sql.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import models.*;

/**
 *
 * @author thuat
 */
public class DAO {

    public static DAO INSTANCE = new DAO();
    private Connection con;
    private String status = "OK";

    private DAO() {
        if (INSTANCE == null) {
            con = new DBContext().connect;
        } else {
            INSTANCE = this;
        }
    }

    public static DAO getINSTANCE() {
        return INSTANCE;
    }

}
