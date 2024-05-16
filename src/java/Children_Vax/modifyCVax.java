package Children_Vax;

import java.io.*;
import java.sql.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;

public class modifyCVax extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String CenterName = request.getParameter("centerName");
        String address = request.getParameter("address");
        String phoneNumber = request.getParameter("tel");

        try {
            Connection_Db.Connect();
            Connection conn = Connection_Db.conn;
            PreparedStatement stmt = conn.prepareStatement("UPDATE `vax`.`CentreVax` SET adresseC = ?, numTel = ? WHERE nomC = ?");
            stmt.setString(1, address);
            stmt.setString(2, phoneNumber);
            stmt.setString(3, CenterName);
            stmt.executeUpdate();

            stmt.close();
            conn.close();
            response.sendRedirect("adminDashboard.jsp");
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("msg", "Error modifying Vaccination Center information. Please try again.");
            request.getRequestDispatcher("modifyVaxC.jsp").forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "GET method not supported");
    }
}