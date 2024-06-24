<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*, java.util.*" %>    
<%@ page import="java.sql.Connection" %>
<%@ page import="Children_Vax.Connection_Db" %>
<%@ page import="java.sql.ResultSet" %>
<%
    List<String> vaccineCNames = new ArrayList<>();
    try {
        Connection_Db.Connect();
        Connection conn = Connection_Db.conn;
        String selectVaccineCNamesQuery = "SELECT nomC FROM `vax`.`CentreVax`";
        PreparedStatement pstmt = conn.prepareStatement(selectVaccineCNamesQuery);
        ResultSet rs = pstmt.executeQuery();

        while (rs.next()) {
            vaccineCNames.add(rs.getString("nomC"));
        }

        rs.close();
        pstmt.close();
        conn.close();
    } catch (SQLException e) {
        e.printStackTrace();
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Modify Vaccination Center Information</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
</head>
<body class="bg-blue-100 bg-opacity-20">
    <div class="flex flex-col justify-center items-center mt-16 py-4">
        <div class="mb-14">
                <img src="images/logo-img.png" alt="Logo" class="h-14">
        </div>
        <h2 class="text-2xl font-bold text-blue-900 mb-6">Modify Vaccination Center Information</h2>
        <form action="modifyCVax" method="POST" class="lg:w-2/3 w-4/5 max-w-lg bg-white p-8 mb-4 rounded-lg shadow-lg">
            <div class="mb-4">
                <label for="centerName" class="block text-gray-700 mb-2">Vaccination Center to modify:</label>
                <select id="centerName" name="centerName" required class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500">
                    <option value="">Select Vaccine</option>
                    <% for (String vaccineCName : vaccineCNames) { %>
                        <option value="<%= vaccineCName %>"><%= vaccineCName %></option>
                    <% } %>
                </select>
            </div>
            
            <div class="mb-4">
                <label for="address" class="block text-gray-700 mb-2">Address:</label>
                <input type="text" id="address" name="address" required class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500">
            </div>
            
            <div class="mb-4">
                <label for="tel" class="block text-gray-700 mb-2">Phone number:</label>
                <input type="tel" pattern="^0[0-9]{9}" id="tel" name="tel" required class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500">
            </div>

            <div class="mb-4">
                <% if (request.getAttribute("msg") != null) { %>
                    <p class="text-red-500"><%= request.getAttribute("msg") %></p>
                <% } %>
            </div>
            <div class="text-center">
                <input type="submit" value="Submit Modification" class="w-2/4 lg:w-1/2 py-2 bg-blue-500 text-white rounded-md hover:bg-blue-600 cursor-pointer">
            </div>
        </form>
    </div>
</body>
</html>

