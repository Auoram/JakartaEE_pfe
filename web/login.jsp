<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>    
<%@ page import="java.sql.Connection" %>
<%@ page import="Children_Vax.Connection_Db" %>
<%@ page import="java.sql.ResultSet" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
        }
        .container {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            margin-top: 50px;
        }
        .logo {
            align-items: center;
            margin-bottom: 25px;
        }
       .logo img {
            height: 55px; /* Adjust the height of the logo as needed */
        }
        form{
            width: 250px;
            margin: 50px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h2 {
            text-align: center;
            color: #333;
        }
        input[type="email"],
        input[type="password"] {
            width: calc(100% - 20px);
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 3px;
        }
        input[type="submit"] {
            width: 100%;
            padding: 10px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 3px;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #0056b3;
        }
        p {
            color: red;
        }       
    </style>
    </head>
    <body>
        <div class="container">
        <div class="logo">
            <a href="index.html"><img src="images/logo-img.png" alt="Logo"></a>
        </div>
        <h2>Login</h2>
        </div>
    <form action="Login" method="post">
        <label for="email">Email</label>
        <input type="email" name="email"><br>
        <label for="password">Password:</label>
        <input type="password" name="password"><br>
        <% if (request.getAttribute("msg") != null) { %>
              <p><%= request.getAttribute("msg") %></p>
        <% } %>
        <input type="submit" value="Login">
    </form>
    </body>
</html>
