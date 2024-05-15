package Children_Vax;

import java.io.*;
import java.sql.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;

public class addPm extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");
        String firstName = request.getParameter("fname");
        String lastName = request.getParameter("lname");
        String emailP = request.getParameter("emailP");
        String phoneNumber = request.getParameter("tel");
        String job = request.getParameter("job");
        String gender = request.getParameter("gender");
        String vc = request.getParameter("vc");

        try {
            if (!password.equals(confirmPassword)) {
            request.setAttribute("msg", "Passwords do not match. Please try again.");
            request.getRequestDispatcher("addPM.jsp").forward(request, response);
            return;
        }
            Connection_Db.Connect();
            Connection conn = Connection_Db.conn;
            PreparedStatement stmt = conn.prepareStatement("INSERT INTO `vax`.`User` (email,password,role) VALUES (?, ?, 'medical_personnel')");
            stmt.setString(1, email);
            stmt.setString(2, password);
            stmt.executeUpdate();
            
            String selectVaxCIdQuery = "SELECT idC FROM `vax`.`CentreVax` WHERE nomC = ?";
            PreparedStatement selectVaxCIdStatement = conn.prepareStatement(selectVaxCIdQuery);
            selectVaxCIdStatement.setString(1, vc);
            ResultSet resultSet1 = selectVaxCIdStatement.executeQuery();
            int VaxCId = 0;
            if (resultSet1.next()) {
                VaxCId = resultSet1.getInt("idC");
            }
            
            String selectUserIdQuery = "SELECT id FROM `vax`.`User` WHERE email = ?";
            PreparedStatement selectUserIdStatement = conn.prepareStatement(selectUserIdQuery);
            selectUserIdStatement.setString(1, email);
            ResultSet resultSet = selectUserIdStatement.executeQuery();
            int userId = 0;
            if (resultSet.next()) {
                userId = resultSet.getInt("id");
            }

            String insertPMQuery = "INSERT INTO `vax`.`PersonnelMedical` (user_idP, nomPM, prenomPM, emailPM, numTelPM, rolePM, sexePM, CentreVax_idC) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement pmStatement = conn.prepareStatement(insertPMQuery);
            pmStatement.setInt(1, userId);
            pmStatement.setString(2, firstName);
            pmStatement.setString(3, lastName);
            pmStatement.setString(4, emailP);
            pmStatement.setString(5, phoneNumber);
            pmStatement.setString(6, job);
            pmStatement.setString(7, gender);
            pmStatement.setInt(8, VaxCId);
            pmStatement.executeUpdate();

            resultSet.close();
            stmt.close();
            selectUserIdStatement.close();
            pmStatement.close();
            conn.close();
            response.sendRedirect("adminDashboard.jsp");
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("msg", "Error adding acount. Please try again.");
            request.getRequestDispatcher("addPM.jsp").forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "GET method not supported");
    }
}