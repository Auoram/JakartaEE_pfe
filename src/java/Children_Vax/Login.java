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

        if (isAuthenticated) {
            HttpSession session = request.getSession();
            String firstName = getFirstName(email); // Assuming you have a method to retrieve the first name
            session.setAttribute("firstName", firstName);
            response.sendRedirect("dashboard.jsp");
        } else {
            request.setAttribute("msg", "Error. Please try again.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
            dispatcher.forward(request, response);
        }
    }
    private boolean authenticate(String email, String password) {
        try{
        Connection_Db.Connect();
        Connection conn = Connection_Db.conn;
        String sql = "SELECT * FROM `vax`.`User` WHERE email=? AND password=?";
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
}