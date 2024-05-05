package Children_Vax;

import java.io.*;
import java.sql.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;

public class Login extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        
        boolean isAuthenticated = authenticate(email, password);
        boolean isPersonelAuthenticated = authenticatePersonel(email, password);


        if (isAuthenticated) {
            HttpSession session = request.getSession();
            String firstName = getFirstName(email);
            int pId = getUserId(email);
            session.setAttribute("firstName", firstName);
            session.setAttribute("email", email);
            session.setAttribute("pId", pId);
            response.sendRedirect("dashboard.jsp");
        }else if (isPersonelAuthenticated){
            HttpSession session = request.getSession();
            String firstName = getFirstNamePM(email);
            int pId = getUserIdPM(email);
            session.setAttribute("firstName", firstName);
            session.setAttribute("email", email);
            session.setAttribute("pId", pId);
            response.sendRedirect("personnelDashboard.jsp");
        }else {
            request.setAttribute("msg", "Error. Please try again.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
            dispatcher.forward(request, response);
        }
    }
    private boolean authenticate(String email, String password) {
        try{
        Connection_Db.Connect();
        Connection conn = Connection_Db.conn;
        String sql = "SELECT * FROM `vax`.`User` WHERE email=? AND password=? AND role = 'parent'";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, email);
            pstmt.setString(2, password);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) return true;
            rs.close();
            pstmt.close();
            conn.close();
        }catch (Exception e) {
        e.printStackTrace();	            
        }
        return false;
    }
    private boolean authenticatePersonel(String email, String password) {
        try{
        Connection_Db.Connect();
        Connection conn = Connection_Db.conn;
        String sql = "SELECT * FROM `vax`.`User` WHERE email=? AND password=? AND role = 'medical_personnel'";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, email);
            pstmt.setString(2, password);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) return true;
            rs.close();
            pstmt.close();
            conn.close();
        }catch (Exception e) {
        e.printStackTrace();	            
        }
        return false;
    }
    private int getUserId(String email) {
        int pId = 1;
        try {
            Connection_Db.Connect();
            Connection conn = Connection_Db.conn;
            String sql = "SELECT idP FROM `vax`.`Parent` WHERE user_id =(Select id from `vax`.`User` where email=?)";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, email);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                pId = rs.getInt("idP");
            }

            rs.close();
            pstmt.close();
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return pId;
    }
    private int getUserIdPM(String email) {
        int pId = 1;
        try {
            Connection_Db.Connect();
            Connection conn = Connection_Db.conn;
            String sql = "SELECT idPM FROM `vax`.`PersonnelMedical;` WHERE user_idP =(Select id from `vax`.`User` where email=?)";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, email);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                pId = rs.getInt("idPM");
            }

            rs.close();
            pstmt.close();
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return pId;
    }
    
    private String getFirstName(String email) {
        String firstName = "";
        try {
            Connection_Db.Connect();
            Connection conn = Connection_Db.conn;
            String sql = "SELECT nomP FROM `vax`.`Parent` WHERE user_id =(Select id from `vax`.`User` where email=?)";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, email);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                firstName = rs.getString("nomP");
            }

            rs.close();
            pstmt.close();
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return firstName;
    }
    private String getFirstNamePM(String email) {
        String firstName = "";
        try {
            Connection_Db.Connect();
            Connection conn = Connection_Db.conn;
            String sql = "SELECT nomPM FROM `vax`.`PersonnelMedical` WHERE user_idP =(Select id from `vax`.`User` where email=?)";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, email);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                firstName = rs.getString("nomPM");
            }

            rs.close();
            pstmt.close();
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return firstName;
    }
}