package Children_Vax;

import java.io.*;
import java.sql.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;

public class modifyPM extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String emailP = request.getParameter("emailP");
        String phoneNumber = request.getParameter("tel");
        String job = request.getParameter("job");
        String vc = request.getParameter("vc");

        try {
            Connection_Db.Connect();
            Connection conn = Connection_Db.conn;
            HttpSession session = request.getSession();
            
            String selectVaxCIdQuery = "SELECT idC FROM `vax`.`CentreVax` WHERE nomC = ?";
            PreparedStatement selectVaxCIdStatement = conn.prepareStatement(selectVaxCIdQuery);
            selectVaxCIdStatement.setString(1, vc);
            ResultSet resultSet1 = selectVaxCIdStatement.executeQuery();
            int VaxCId = 0;
            if (resultSet1.next()) {
                VaxCId = resultSet1.getInt("idC");
            }
            
            PreparedStatement stmt = conn.prepareStatement("UPDATE `vax`.`PersonnelMedical` p JOIN `vax`.`User` u ON p.user_idP = u.id SET emailPM = ?, numTelPM = ?, rolePM = ?, CentreVax_idC = ? WHERE u.email=?");
            stmt.setString(1, emailP);
            stmt.setString(2, phoneNumber);
            stmt.setString(3, job);
            stmt.setInt(4, VaxCId);
            stmt.setString(5, (String) session.getAttribute("email"));
            int rowsAffected = stmt.executeUpdate();

            stmt.close();
            conn.close();
            response.sendRedirect("personnelDashboard.jsp");
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("msg", "Error modifying your account information. Please try again.");
            request.getRequestDispatcher("modifyPm.jsp").forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "GET method not supported");
    }
}