<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="Children_Vax.Connection_Db" %>
<%@ page import="java.sql.ResultSet" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 1200px;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .header {
            background-color: #007bff;
            color: #fff;
            padding: 20px;
            text-align: center;
            border-radius: 5px 5px 0 0;
        }

        .welcome-message {
            font-size: 24px;
            margin-bottom: 20px;
        }

        .card-container {
            display: flex;
            justify-content: space-around;
            flex-wrap: wrap;
            gap: 20px;
        }

        .card {
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: calc(33% - 20px);
        }

        .card h3 {
            margin-top: 0;
            color: #333;
        }

        .card p {
            margin-bottom: 0;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="header">
        <h1>Welcome to Your Dashboard</h1>
    </div>
    <div class="welcome-message">
        <p>Hello, <%= session.getAttribute("firstName") %>!</p>
    </div>
    <div class="card-container">
        <div class="card">
            <h3>Profile</h3>
            <p>View and update your profile information.</p>
            <a href="profile.jsp">Go to Profile</a>
        </div>
        <div class="card">
            <h3>Children</h3>
            <p>Manage information about your children.</p>
            <a href="children.jsp">Go to Children</a>
        </div>
        <div class="card">
            <h3>Vaccination</h3>
            <p>View vaccination schedules and appointments.</p>
            <a href="vaccination.jsp">Go to Vaccination</a>
        </div>
    </div>
</div>
</body>
</html>
