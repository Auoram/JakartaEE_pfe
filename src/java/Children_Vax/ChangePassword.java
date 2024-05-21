package Children_Vax;

import java.io.*;
import java.sql.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;

public class ChangePassword extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String newPassword = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");

        if (!newPassword.equals(confirmPassword)) {
            request.setAttribute("msg", "Passwords do not match.");
            request.getRequestDispatcher("ChangePassword.jsp").forward(request, response);
            return;
        }

        String email = (String) request.getSession().getAttribute("email");

        try {
            Connection_Db.Connect();
            Connection conn = Connection_Db.conn;
            String updateQuery = "UPDATE `vax`.`User` SET password = ? WHERE email = ?";
            PreparedStatement stmt = conn.prepareStatement(updateQuery);
            stmt.setString(1, newPassword);
            stmt.setString(2, email);
            int rowsAffected = stmt.executeUpdate();

            stmt.close();
            conn.close();
            
            response.sendRedirect("login.jsp");
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("msg", "Error updating password. Please try again.");
            request.getRequestDispatcher("ChangePassword.jsp").forward(request, response);
        }
    }
}
