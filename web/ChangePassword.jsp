<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>    
<%@ page import="java.sql.Connection" %>
<%@ page import="Children_Vax.Connection_Db" %>
<%@ page import="java.sql.ResultSet" %>
<%
    String email = (String) session.getAttribute("email");
%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Create New Password</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
</head>
<body class="bg-blue-100 bg-opacity-20">
    <div class="flex flex-col justify-center items-center mt-16 py-4">
        <div class="mb-14">
            <a href="index.jsp">
                <img src="images/logo-img.png" alt="Logo" class="h-14">
            </a>
        </div>
        <h2 class="text-2xl font-bold text-blue-900 mb-6">Create New Password</h2>
        <form action="ChangePassword" method="POST" class="lg:w-2/3 w-4/5 max-w-2xl bg-white p-8 mb-4 rounded-lg shadow-lg">
            <div class="grid grid-cols-1 lg:grid-cols-2 gap-4 mb-4">
                <div class="mb-4">
                    <label for="password" class="block text-gray-700 mb-2">Password:</label>
                    <input type="password" id="password" name="password" required class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500">
                </div>
                
                <div class="mb-4">
                    <label for="confirmPassword" class="block text-gray-700 mb-2">Confirm Password:</label>
                    <input type="password" id="confirmPassword" name="confirmPassword" required class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500">
                </div>
            </div>
            <div>
                <% if (request.getAttribute("msg") != null) { %>
                    <p class="text-red-500 mb-4"><%= request.getAttribute("msg") %></p>
                <% } %>
            </div>
            <div class="text-center">
                <input type="submit" value="Change Password" class="w-2/4 lg:w-1/3 py-2 bg-blue-500 text-white rounded-md hover:bg-blue-600 cursor-pointer">
            </div>
        </form>
    </div>
</body>
</html>

