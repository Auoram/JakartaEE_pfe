<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>    
<%@ page import="java.sql.Connection" %>
<%@ page import="Children_Vax.Connection_Db" %>
<%@ page import="java.sql.ResultSet" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
        <title>JSP Page</title>
        <style>     
    </style>
    </head>
    <body class="bg-blue-100 bg-opacity-20">
    <div class="flex flex-col justify-center items-center mt-16 py-4">
        <div class="mb-14">
            <a href="index.jsp">
                <img src="images/logo-img.png" alt="Logo" class="h-14">
            </a>
        </div>
        <h2 class="text-2xl font-bold text-blue-900 mb-6">Login</h2>
        <form action="Login" method="POST" class="w-90 p-8 bg-white rounded-lg shadow-lg">
            <label for="email" class="block text-gray-700 mb-2">Email</label>
            <input type="email" name="email" id="email" class="w-full px-3 py-2 mb-4 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500">
            
            <label for="password" class="block text-gray-700 mb-2">Password</label>
            <input type="password" name="password" id="password" class="w-full px-3 py-2 mb-8 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500">
            
            <% if (request.getAttribute("msg") != null) { %>
                <p class="text-red-500 mb-4"><%= request.getAttribute("msg") %></p>
            <% } %>
            
            <input type="submit" value="Login" class="w-full py-2 mb-6 bg-blue-500 text-white rounded-md hover:bg-blue-600 cursor-pointer">
            
            <div>
                <a href="forgetPassword.jsp" class="text-blue-500 hover:underline">Forgot Password?</a>
            </div>
        </form>
    </div>
</body>
</html>
