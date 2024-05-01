package Children_Vax;

import java.io.*;
import java.sql.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;

public class addUser extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");
        String firstName = request.getParameter("fname");
        String lastName = request.getParameter("lname");
        String phoneNumber = request.getParameter("tel");
        String gender = request.getParameter("gender");
        String rs = request.getParameter("rs");

        try {
            if (!password.equals(confirmPassword)) {
            request.setAttribute("msg", "Passwords do not match. Please try again.");
            request.getRequestDispatcher("signup.jsp").forward(request, response);
            return;
        }
            Connection_Db.Connect();
            Connection conn = Connection_Db.conn;
            PreparedStatement stmt = conn.prepareStatement("INSERT INTO `vax`.`User` (email,password,role) VALUES (?, ?, 'parent')");
            stmt.setString(1, email);
            stmt.setString(2, password);
            stmt.executeUpdate();
            
            String selectUserIdQuery = "SELECT id FROM `vax`.`User` WHERE email = ?";
            PreparedStatement selectUserIdStatement = conn.prepareStatement(selectUserIdQuery);
            selectUserIdStatement.setString(1, email);
            ResultSet resultSet = selectUserIdStatement.executeQuery();
            int userId = 0;
            if (resultSet.next()) {
                userId = resultSet.getInt("id");
            }

            // Insert additional personal information into Parent table
            String insertParentQuery = "INSERT INTO `vax`.`Parent` (user_id, nomP, prenomP, numTelP, roleP, sexeP) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement parentStatement = conn.prepareStatement(insertParentQuery);
            parentStatement.setInt(1, userId);
            parentStatement.setString(2, firstName);
            parentStatement.setString(3, lastName);
            parentStatement.setString(4, phoneNumber);
            parentStatement.setString(5, rs);
            parentStatement.setString(6, gender);
            parentStatement.executeUpdate();

            resultSet.close();
            stmt.close();
            selectUserIdStatement.close();
            parentStatement.close();
            conn.close();
            response.sendRedirect("addchild.jsp?parentId=" + userId);
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("msg", "Error adding acount. Please try again.");
            request.getRequestDispatcher("signup.jsp").forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "GET method not supported");
    }
}
