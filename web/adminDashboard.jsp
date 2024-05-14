<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="Children_Vax.Connection_Db" %>
<%@ page import="java.sql.ResultSet" %>
<%
    String email = (String) session.getAttribute("email");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f3f4f6;
        }

        .container {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            padding-top: 20px;
        }
        
        .container-head {
           display: flex;
           justify-content: space-between;
           align-items: center;
           padding: 1rem;
        }

        .logo img {
            height: 55px;
        }
        
        .dashboard-container {
            max-width: 800px;
            width: 100%;
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
            margin-top: 20px;
        }
        
        .section-title {
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 20px;
            color: #333;
        }
        </style>
    </head>
    <body>
        <div class="container-head bg-blue-400 py-4">
        <div class="logo">
            <a href="personnelDashboard.jsp"><img src="images/whiteLogo.png" alt="Logo"></a>
        </div>
        <div class="ml-auto">
        <a href="index.html" class="text-white font-bold border-2 border-white p-4 hover:bg-blue-100 hover:text-blue-400">Logout</a>
    </div>
    </div>
        <div class="container">
            <div class="dashboard-container">
                <div class="section-title">Dashboard</div>
            </div>
        </div>
    </body>
</html>
