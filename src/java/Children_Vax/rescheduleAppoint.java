package Children_Vax;

import java.io.*;
import java.sql.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class rescheduleAppoint extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String date = request.getParameter("date");
    String time = request.getParameter("time");
    String centreName = request.getParameter("centre");
    String childName = request.getParameter("child");
    String vaccineName = request.getParameter("vaccine");
    String newdate = request.getParameter("newdate");
    String newtime = request.getParameter("newtime");
    String dateTimeStr = date + " " + time;
    String newDateTimeStr = newdate + " " + newtime;

    try {
        Connection_Db.Connect();
        Connection conn = Connection_Db.conn;
        
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
        LocalDateTime dateTime = LocalDateTime.parse(dateTimeStr, formatter);
        String formattedDateTime = dateTime.format(formatter);
        
        DateTimeFormatter formatter2 = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
        LocalDateTime newDateTime = LocalDateTime.parse(newDateTimeStr, formatter2);
        String newFormattedDateTime = newDateTime.format(formatter2);

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

        String insertAppointmentQuery = "UPDATE `vax`.`RendezVous` SET dateR = ? WHERE dateR = ? AND CentreVax_idC = ? AND Enfant_idE = ? AND Vaccin_idV =?";
        PreparedStatement pstmt = conn.prepareStatement(insertAppointmentQuery);
        pstmt.setString(1, newFormattedDateTime);
        pstmt.setString(2, formattedDateTime);
        pstmt.setInt(3, centreId);
        pstmt.setInt(4, childId);
        pstmt.setInt(5, vaccineId);
        pstmt.executeUpdate();
        pstmt.close();
        conn.close();

        response.sendRedirect("appointmentPage.jsp");
    } catch (SQLException e) {
        e.printStackTrace();
        request.setAttribute("msg", "Error rescheduling appointment. Please try again.");
        request.getRequestDispatcher("rescheduleAppointment.jsp").forward(request, response);
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