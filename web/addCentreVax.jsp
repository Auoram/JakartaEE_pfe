<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>    
<%@ page import="java.sql.Connection" %>
<%@ page import="Children_Vax.Connection_Db" %>
<%@ page import="java.sql.ResultSet" %>
<!DOCTYPE html>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Add Vaccination Center Information</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
</head>
<body class="bg-blue-100 bg-opacity-20">
    <div class="flex flex-col justify-center items-center mt-16 py-4">
        <div class="mb-14">
                <img src="images/logo-img.png" alt="Logo" class="h-14">
        </div>
        <h2 class="text-2xl font-bold text-blue-900 mb-6">Add Vaccination Center Information</h2>
        <form action="addVaxCenter" method="POST" class="lg:w-2/3 w-4/5 max-w-2xl bg-white p-8 mb-4 rounded-lg shadow-lg">
            <div class="grid grid-cols-1 lg:grid-cols-2 gap-4 mb-4">
                <div class="mb-4">
                    <label for="centerName" class="block text-gray-700 mb-2">Center Name:</label>
                    <input type="text" id="centerName" name="centerName" required class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500">
                </div>
                
                <div class="mb-4">
                    <label for="address" class="block text-gray-700 mb-2">Address:</label>
                    <input type="text" id="address" name="address" required class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500">
                </div>
                
                <div class="mb-4">
                    <label for="tel" class="block text-gray-700 mb-2">Phone Number:</label>
                    <input type="tel" pattern="^0[0-9]{9}" id="tel" name="tel" required class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500">
                </div>
            </div>
            <div>
                <% if (request.getAttribute("msg") != null) { %>
                    <p class="text-red-500 mb-4"><%= request.getAttribute("msg") %></p>
                <% } %>
            </div>
            <div class="text-center">
                <input type="submit" value="Add Vaccination Center" class="w-2/4 lg:w-1/3 py-2 bg-blue-500 text-white rounded-md hover:bg-blue-600 cursor-pointer">
            </div>
        </form>
    </div>
</body>
</html>

