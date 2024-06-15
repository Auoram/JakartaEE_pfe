<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>    
<%@ page import="java.sql.Connection" %>
<%@ page import="Children_Vax.Connection_Db" %>
<%@ page import="java.sql.ResultSet" %>
<%
    String firstName = (String) session.getAttribute("firstName");
    String email = (String) session.getAttribute("email");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Modify Account Info</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
</head>
<body class="bg-blue-100 bg-opacity-20">
    <div class="flex flex-col justify-center items-center mt-16 py-4">
        <div class="mb-14">
                <img src="images/logo-img.png" alt="Logo" class="h-14">
        </div>
        <h2 class="text-2xl font-bold text-blue-900 mb-6">Modify Account Info</h2>
        <form action="ModifyInfo" method="POST" class="lg:w-full w-3/4 max-w-lg bg-white p-8 mb-4 rounded-lg shadow-lg">
            <div class="grid grid-cols-1 lg:grid-cols-2 gap-4 mb-4">
            <div class="mb-4">
                <label for="email" class="block text-gray-700 mb-2">Email:</label>
                <input type="email" id="email" name="email" required class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500">
            </div>
            
            <div class="mb-4">
                <label for="tel" class="block text-gray-700 mb-2">Phone number:</label>
                <input type="tel" pattern="[0-9]{10}" id="tel" name="tel" required class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500">
            </div>
        
            <div class="mb-4">
                <label for="gender" class="block text-gray-700 mb-2">Gender:</label>
                <div>
                    <input type="radio" id="gender_f" name="gender" value="F" class="mr-1">
                    <label for="gender_f" class="mr-4">Woman</label>
                    <input type="radio" id="gender_m" name="gender" value="M" class="mr-1">
                    <label for="gender_m">Man</label>
                </div>
            </div>
            
            <div class="mb-4">
                <label for="rs" class="block text-gray-700 mb-2">Relationship to child:</label>
                <div class="flex flex-col space-y-2">
                    <div class="flex items-center">
                    <input type="radio" id="rs_mother" name="rs" value="Mother" class="mr-1">
                    <label for="rs_mother" class="mr-4">Mother</label>
                    </div>
                    <div class="flex items-center">
                    <input type="radio" id="rs_father" name="rs" value="Father" class="mr-1">
                    <label for="rs_father" class="mr-4">Father</label>
                    </div>
                    <div class="flex items-center">
                    <input type="radio" id="rs_guardian" name="rs" value="Guardian" class="mr-1">
                    <label for="rs_guardian">Guardian</label>
                    </div>
                </div>
            </div>
            </div>
            <div class="mb-4">
                <% if (request.getAttribute("msg") != null) { %>
                    <p class="text-red-500"><%= request.getAttribute("msg") %></p>
                <% } %>
            </div>
            <div class="text-center">
                <input type="submit" value="Apply Modifications" class="w-2/4 lg:w-2/4 py-2 bg-blue-500 text-white rounded-md hover:bg-blue-600 cursor-pointer">
            </div>
        </form>
    </div>
</body>
</html>

