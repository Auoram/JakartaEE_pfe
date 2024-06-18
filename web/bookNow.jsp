<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="java.sql.*, java.util.*" %>
<%@ page import="Children_Vax.Connection_Db" %>
<%@ page import="java.sql.ResultSet" %>
<% 
    String email = (String) session.getAttribute("email");
    System.out.println("Email from session: " + email);

    List<String> vaccineNames = new ArrayList<>();
    List<String> vaccineCNames = new ArrayList<>();
    try {
        Connection_Db.Connect();
        Connection conn = Connection_Db.conn;
        String selectVaccineNamesQuery = "SELECT nomV FROM `vax`.`Vaccin`";
        PreparedStatement pstmt = conn.prepareStatement(selectVaccineNamesQuery);
        ResultSet rs = pstmt.executeQuery();

        while (rs.next()) {
            vaccineNames.add(rs.getString("nomV"));
        }
        rs.close();
        pstmt.close();
        
        String selectVaccineCNamesQuery = "SELECT nomC FROM `vax`.`CentreVax`";
        PreparedStatement stmt = conn.prepareStatement(selectVaccineCNamesQuery);
        ResultSet res = stmt.executeQuery();

        while (res.next()) {
            vaccineCNames.add(res.getString("nomC"));
        }

        res.close();
        stmt.close();
        conn.close();
    } catch (SQLException e) {
        e.printStackTrace();
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Book Now</title>
        <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    </head>
    <body class="bg-blue-100 bg-opacity-20">
        <div class="flex flex-col justify-center items-center mt-16 py-4">
            <div class="mb-14">
                    <img src="images/logo-img.png" alt="Logo" class="h-14">
            </div>
            <h2 class="text-2xl font-bold text-blue-900 mb-6">Book Appointment</h2>
            <form action="addAppointment" method="POST" class="lg:w-2/3 w-4/5 max-w-2xl bg-white p-8 mb-4 rounded-lg shadow-lg">
                <div class="grid grid-cols-1 lg:grid-cols-2 gap-4 mb-4">
                    <div class="mb-4">
                        <label for="date" class="block text-gray-700 mb-2">Date:</label>
                        <input type="date" id="date" name="date" required class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500">
                    </div>
                    <div class="mb-4">
                        <label for="time" class="block text-gray-700 mb-2">Time:</label>
                        <input type="time" id="time" name="time" required class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500">
                    </div>
                    <div class="mb-4">
                        <label for="centre" class="block text-gray-700 mb-2">Vaccination Center:</label>
                        <select id="centre" name="centre" required class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500">
                            <option value="">Select Vaccination center</option>
                            <% for (String vaccineCName : vaccineCNames) { %>
                            <option value="<%= vaccineCName %>"><%= vaccineCName %></option>
                            <% } %>
                        </select>
                    </div>
                    <div class="mb-4">
                        <label for="child" class="block text-gray-700 mb-2">Child Name:</label>
                        <input type="text" id="child" name="child" required class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500">
                    </div>
                    <div class="mb-4">
                        <label for="vaccine" class="block text-gray-700 mb-2">Vaccine:</label>
                        <select id="vaccine" name="vaccine" required class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500">
                            <option value="">Select Vaccine</option>
                            <% for (String vaccineName : vaccineNames) { %>
                                <option value="<%= vaccineName %>"><%= vaccineName %></option>
                            <% } %>
                        </select>
                    </div>
                </div>
                <div>
                    <% if (request.getAttribute("msg") != null) { %>
                        <p class="text-red-500 mb-4"><%= request.getAttribute("msg") %></p>
                    <% } %>
                </div>
                <div class="text-center">
                    <input type="submit" value="Book Now" class="w-2/4 lg:w-1/3 py-2 bg-blue-500 text-white rounded-md hover:bg-blue-600 cursor-pointer">
                </div>
            </form>
        </div>
    </body>
</html>
