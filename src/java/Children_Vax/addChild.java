package Children_Vax;

import java.io.*;
import java.sql.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;

public class addChild extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String childName = request.getParameter("childName");
        String dateOfBirth = request.getParameter("dateOfBirth");
        String address = request.getParameter("address");
        String bloodType = request.getParameter("bt");
        String city = request.getParameter("city");
        String allergies = request.getParameter("allergy");
        String medicalConditions = request.getParameter("mc");
        String region = request.getParameter("region");
        String gender = request.getParameter("gender");
        int parentId = Integer.parseInt(request.getParameter("parentId"));
        String centreVax = request.getParameter("Cvax");
        
        int cvId = 0;
        
        try {
            Connection_Db.Connect();
            Connection conn = Connection_Db.conn;
            
            if (centreVax != null && !centreVax.isEmpty()) {
                // Retrieve CentreVax_id from the database
                String selectCentreIdQuery = "SELECT idC FROM `vax`.`CentreVax` WHERE nomC = ?";
                PreparedStatement selectCentreIdStatement = conn.prepareStatement(selectCentreIdQuery);
                selectCentreIdStatement.setString(1, centreVax);
                ResultSet resultSet = selectCentreIdStatement.executeQuery();
                
                if (resultSet.next()) {
                    cvId = resultSet.getInt("idC");
                } else {
                    throw new IllegalArgumentException("Vaccination Center not found: " + centreVax);
                }
                
                resultSet.close();
                selectCentreIdStatement.close();
            } else {
                cvId = 1;
            }
            
            String selectUserIdQuery = "SELECT idP FROM `vax`.`Parent` WHERE user_id = ?";
            PreparedStatement selectUserIdStatement = conn.prepareStatement(selectUserIdQuery);
            selectUserIdStatement.setInt(1, parentId);
            ResultSet resultSet = selectUserIdStatement.executeQuery();
            int PId = 0;
            if (resultSet.next()) {
                PId = resultSet.getInt("idP");
            }
            
            PreparedStatement childStatement = conn.prepareStatement("INSERT INTO `vax`.`Enfant` (nomCompletE, dateNaiss, adresseE,CentreVax_idC, Parent_idP, groupeSang, ville, allergies, infoMedicaux, province, sexe) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
            childStatement.setString(1, childName);
            childStatement.setString(2, dateOfBirth);
            childStatement.setString(3, address);
            childStatement.setInt(4, cvId);
            childStatement.setInt(5, PId);
            childStatement.setString(6, bloodType);
            childStatement.setString(7, city);
            childStatement.setString(8, allergies);
            childStatement.setString(9, medicalConditions);
            childStatement.setString(10, region);
            childStatement.setString(11, gender);
            
            childStatement.executeUpdate();

            childStatement.close();
            conn.close();
            response.sendRedirect("login.jsp");
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("msg", "Error adding child. Please try again.");
            request.getRequestDispatcher("addchild.jsp").forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "GET method not supported");
    }
}
