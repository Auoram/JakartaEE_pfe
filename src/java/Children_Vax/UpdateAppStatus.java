package Children_Vax;

import java.io.*;
import java.sql.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
public class UpdateAppStatus extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int appointmentId = Integer.parseInt(request.getParameter("appointmentId"));
        String newStatus = request.getParameter("newStatus");

        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            Connection_Db.Connect();
            conn = Connection_Db.conn;

            String updateStatusQuery = "UPDATE `vax`.`RendezVous` SET `statusR` = ? WHERE `idR` = ?";
            pstmt = conn.prepareStatement(updateStatusQuery);
            pstmt.setString(1, newStatus);
            pstmt.setInt(2, appointmentId);
            
            int rowsUpdated = pstmt.executeUpdate();
            
            if (rowsUpdated > 0) {
                response.sendRedirect("personnelDashboard.jsp?success=true");
            } else {
                response.sendRedirect("personnelDashboard.jsp?success=false");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("personnelDashboard.jsp?error=true&message=" + e.getMessage());
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
    }

}
