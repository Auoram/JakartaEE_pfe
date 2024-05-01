package Children_Vax;

import java.sql.*;

public class Connection_Db {
    static final String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";
    static final String DB_URL = "jdbc:mysql://localhost";
    static final String USER = "root";
    static final String PASS = "*Mb2003.sql2024";
    
    public static Connection conn;
    
    public static void Connect(){
        try {
            Class.forName(JDBC_DRIVER);
            conn = DriverManager.getConnection(DB_URL, USER, PASS); 
        }catch (Exception e) {
        e.printStackTrace();	            
        }
    }
}
