
package Children_Vax;

import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.sql.*;

public class DeleteAccount extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String email = (String) request.getSession().getAttribute("email");

        try {
            Connection_Db.Connect();
            Connection conn = Connection_Db.conn;
            String deleteQuery = "DELETE FROM `vax`.`User` WHERE email = ?";
            PreparedStatement stmt = conn.prepareStatement(deleteQuery);
            stmt.setString(1, email);
            stmt.executeUpdate();

            stmt.close();
            conn.close();

            HttpSession session = request.getSession();
            session.invalidate();

            response.sendRedirect("index.html");
        } catch (SQLException e) {
            e.printStackTrace();

            response.sendRedirect("settings.jsp?error=delete_failed");
        }
    }
}
