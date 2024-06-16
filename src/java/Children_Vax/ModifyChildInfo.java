package Children_Vax;

import java.io.*;
import java.sql.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;

public class ModifyChildInfo extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String address = request.getParameter("address");
        String allergies = request.getParameter("allergies");
        String bloodType = request.getParameter("bloodType");
        String medicalInfo = request.getParameter("medicalInfo");
        String province = request.getParameter("province");
        String city = request.getParameter("city");
        int idE = Integer.parseInt(request.getParameter("kidId"));

        try {
            Connection_Db.Connect();
            Connection conn = Connection_Db.conn;
            String sql = "UPDATE `vax`.`Enfant` SET adresseE = ?, allergies = ?, groupeSang = ?, infoMedicaux = ?, province = ?, ville = ? WHERE idE = ?";
            PreparedStatement pstmt = conn.prepareStatement(sql);

            pstmt.setString(1, address);
            pstmt.setString(2, allergies);
            pstmt.setString(3, bloodType);
            pstmt.setString(4, medicalInfo);
            pstmt.setString(5, province);
            pstmt.setString(6, city);
            pstmt.setInt(7, idE);

            int rowsAffected = pstmt.executeUpdate();

            pstmt.close();
            conn.close();
            if (rowsAffected > 0) {
                response.sendRedirect("personnelDashboard.jsp");
            } else {
                request.setAttribute("msg", "No rows affected. Please check your input.");
                RequestDispatcher dispatcher = request.getRequestDispatcher("childInfoModify.jsp");
                dispatcher.forward(request, response);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("msg", "Database error. Please try again.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("childInfoModify.jsp");
            dispatcher.forward(request, response);
        } catch (NumberFormatException e) {
            e.printStackTrace();
            request.setAttribute("msg", "Invalid input format. Please check your input.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("childInfoModify.jsp");
            dispatcher.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("msg", "An unexpected error occurred. Please try again later.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("childInfoModify.jsp");
            dispatcher.forward(request, response);
        }

    }

}

