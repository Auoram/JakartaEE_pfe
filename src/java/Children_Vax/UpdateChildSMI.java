
package Children_Vax;

import java.io.*;
import java.sql.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;

public class UpdateChildSMI extends HttpServlet {
@Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int childId = Integer.parseInt(request.getParameter("childId"));
        String newSMI = request.getParameter("newSMI");

        try {
            Connection_Db.Connect();
            Connection conn = Connection_Db.conn;
            String updateSMIQuery = "UPDATE `vax`.`Enfant` SET numSMI = ? WHERE idE = ?";
            PreparedStatement pstmt = conn.prepareStatement(updateSMIQuery);
            pstmt.setString(1, newSMI);
            pstmt.setInt(2, childId);
            int rowsUpdated = pstmt.executeUpdate();

            if (rowsUpdated > 0) {
                response.sendRedirect("personnelDashboard.jsp");
            } else {
                request.setAttribute("msg", "Error updating information. Please try again.");
                request.getRequestDispatcher("personnelDashboard.jsp").forward(request, response);
            }

            pstmt.close();
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("msg", "Error updating information. Please try again.");
            request.getRequestDispatcher("personnelDashboard.jsp").forward(request, response);
        }
    }
}
