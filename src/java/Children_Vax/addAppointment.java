package Children_Vax;

import java.io.*;
import java.sql.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class addAppointment extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String date = request.getParameter("date");
        String time = request.getParameter("time");
        String centreName = request.getParameter("centre");
        String childName = request.getParameter("child");
        String vaccineName = request.getParameter("vaccine");
        String dateTimeStr = date + " " + time;

        Connection conn = null;
        PreparedStatement pstmt = null;
        try {
            Connection_Db.Connect();
            conn = Connection_Db.conn;

            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
            LocalDateTime dateTime = LocalDateTime.parse(dateTimeStr, formatter);
            String formattedDateTime = dateTime.format(formatter);

            int childId = getChildId(conn, childName);
            if (childId == -1) {
                throw new SQLException("Child not found: " + childName);
            }

            int centreId = getCentreId(conn, centreName);
            if (centreId == -1) {
                throw new SQLException("Centre not found: " + centreName);
            }

            int vaccineId = getVaccineId(conn, vaccineName);
            if (vaccineId == -1) {
                throw new SQLException("Vaccine not found: " + vaccineName);
            }

            String insertAppointmentQuery = "INSERT INTO `vax`.`RendezVous` (dateR, CentreVax_idC, Enfant_idE, Vaccin_idV) VALUES (?, ?, ?, ?)";
            pstmt = conn.prepareStatement(insertAppointmentQuery);
            pstmt.setString(1, formattedDateTime);
            pstmt.setInt(2, centreId);
            pstmt.setInt(3, childId);
            pstmt.setInt(4, vaccineId);
            pstmt.executeUpdate();

            HttpSession session = request.getSession();
            session.setAttribute("confirmationMessage", "Appointment booked successfully for " + childName + " on " + date + " at " + time + " at " + centreName + " for vaccine " + vaccineName);

            response.sendRedirect("dashboard.jsp");
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("msg", "Error adding appointment. Please try again.");
            request.getRequestDispatcher("bookNow.jsp").forward(request, response);
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "GET method not supported");
    }

    private int getChildId(Connection conn, String childName) throws SQLException {
        String selectChildIdQuery = "SELECT idE FROM `vax`.`Enfant` WHERE nomCompletE = ?";
        PreparedStatement pstmt = conn.prepareStatement(selectChildIdQuery);
        pstmt.setString(1, childName);
        ResultSet rs = pstmt.executeQuery();
        int childId = -1;
        if (rs.next()) {
            childId = rs.getInt("idE");
        }
        rs.close();
        pstmt.close();
        return childId;
    }

    private int getCentreId(Connection conn, String centreName) throws SQLException {
        String selectCentreIdQuery = "SELECT idC FROM `vax`.`CentreVax` WHERE nomC = ?";
        PreparedStatement pstmt = conn.prepareStatement(selectCentreIdQuery);
        pstmt.setString(1, centreName);
        ResultSet rs = pstmt.executeQuery();
        int centreId = -1;
        if (rs.next()) {
            centreId = rs.getInt("idC");
        }
        rs.close();
        pstmt.close();
        return centreId;
    }

    private int getVaccineId(Connection conn, String vaccineName) throws SQLException {
        String selectVaccineIdQuery = "SELECT idV FROM `vax`.`Vaccin` WHERE nomV = ?";
        PreparedStatement pstmt = conn.prepareStatement(selectVaccineIdQuery);
        pstmt.setString(1, vaccineName);
        ResultSet rs = pstmt.executeQuery();
        int vaccineId = -1;
        if (rs.next()) {
            vaccineId = rs.getInt("idV");
        }
        rs.close();
        pstmt.close();
        return vaccineId;
    }
}
