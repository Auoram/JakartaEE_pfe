package Children_Vax;

import java.io.*;
import java.sql.*;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class ForgetPassword extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        try {
            Connection_Db.Connect();
            Connection conn = Connection_Db.conn;
            String query = "SELECT * FROM `vax`.`User` WHERE email = ?";
            PreparedStatement preparedStatement = conn.prepareStatement(query);
            preparedStatement.setString(1, email);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                request.getSession().setAttribute("email", email);
               response.sendRedirect("ChangePassword.jsp");
            }else {
            request.setAttribute("msg", "Email not found. Please try again.");
            request.getRequestDispatcher("forgetPassword.jsp").forward(request, response);
        }


        }catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("msg", "An error occurred. Please try again.");
            request.getRequestDispatcher("forgetPassword.jsp").forward(request, response);
        }
        
    }
}
