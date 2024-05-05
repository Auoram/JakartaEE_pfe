
package Children_Vax;
import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.sql.*;

public class ModifyInfo extends HttpServlet {
    @Override
public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String newEmail = request.getParameter("email");
    String phoneNumber = request.getParameter("tel");
    String gender = request.getParameter("gender");
    String relationship = request.getParameter("rs");
    
    try {
        Connection_Db.Connect();
        Connection conn = Connection_Db.conn;
        HttpSession session = request.getSession();
        String updateQuery = "UPDATE `vax`.`Parent` p JOIN `vax`.`User` u ON p.user_id = u.id SET p.numTelP=?, p.sexeP=?, p.roleP=?, u.email=? WHERE u.email=?";
        PreparedStatement stmt = conn.prepareStatement(updateQuery);
        stmt.setString(1, phoneNumber);
        stmt.setString(2, gender);
        stmt.setString(3, relationship);
        stmt.setString(4, newEmail);
        stmt.setString(5, (String) session.getAttribute("email"));
        stmt.executeUpdate();

        stmt.close();
        conn.close();
        
        
        session.setAttribute("email", newEmail);
        
        response.sendRedirect("settings.jsp");
    } catch (SQLException e) {
        e.printStackTrace();
        request.setAttribute("msg", "Error updating information. Please try again.");
        request.getRequestDispatcher("modification.jsp").forward(request, response);
    }
}
}