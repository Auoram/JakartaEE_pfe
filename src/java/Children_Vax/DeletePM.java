
package Children_Vax;

import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.sql.*;

public class DeletePM extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String emailPro = request.getParameter("emailToDelete");

        try {
            Connection_Db.Connect();
            Connection conn = Connection_Db.conn;
            String deleteQuery = "DELETE FROM `vax`.`User` WHERE email = ?";
            PreparedStatement stmt = conn.prepareStatement(deleteQuery);
            stmt.setString(1, emailPro);
            int rowsAffected = stmt.executeUpdate();

            stmt.close();
            conn.close();

            HttpSession session = request.getSession();
            session.invalidate();
            
            if (rowsAffected > 0) {
            request.setAttribute("msg", "Medical Staff deleted.");
            } else {
            request.setAttribute("msg", "No Medical Staff found with the provided email.");
            }
            RequestDispatcher dispatcher = request.getRequestDispatcher("adminDashboard.jsp");
            dispatcher.forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("msg", "Error. Please try again.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("adminDashboard.jsp?error=delete_failed");
            dispatcher.forward(request, response);
        }
    }
}