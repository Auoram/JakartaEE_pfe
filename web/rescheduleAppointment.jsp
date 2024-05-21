<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="java.sql.*, java.util.*" %>
<%@ page import="Children_Vax.Connection_Db" %>
<%@ page import="java.sql.ResultSet" %>
<%
    String email = (String) session.getAttribute("email");
    int pId = (int) session.getAttribute("pId");
    List<String> vaccineNames = new ArrayList<>();
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
            height: 55px;
        }
        form{
            width: 250px;
            margin: 35px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h2 {
            text-align: center;
            color: #333;
        }
input[type="text"],
input[type="date"],
input[type="time"],
select[id="vaccine"]{
    display: block;
    width: calc(100% - 20px);
    padding: 10px;
    margin-bottom: 10px;
    border: 1px solid #ccc;
    border-radius: 3px;
}

input[type="submit"] {
    width: 40%;
    padding: 15px;
    background-color: #007bff;
    color: #fff;
    border: none;
    border-radius: 3px;
    cursor: pointer;
    margin-top: 20px;
    margin-left: 31.5%;
    font-size: 16px;
}

input[type="submit"]:hover {
    background-color: #0056b3;
}

p {
    color: red;
}

@media only screen and (min-width: 768px) {
    form {
        width: 600px;
        margin: 35px auto;
        padding: 20px;
        background-color: #fff;
        border-radius: 5px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        display: flex;
        flex-wrap: wrap;
        justify-content: space-between;
    }

    form > div {
        width: calc(50% - 10px);
    }
    }
        </style>
    </head>
    <body>
    <div class="container">
        <div class="logo">
            <a href="index.html"><img src="images/logo-img.png" alt="Logo"></a>
        </div>
        <h2>Reschedule Appointment</h2>
    </div>
    <form action="rescheduleAppoint" method="POST"> 
        <div>
            <label for="date">Date:</label>
            <input type="date" id="date" name="date" required><br><br>
        </div>
        <div>
            <label for="time">Time:</label>
            <input type="time" id="time" name="time" required><br><br>
        </div>
        <div>
            <label for="centre">Vaccination Center:</label>
            <input type="text" id="centre" name="centre" required><br><br>
        </div>
        <div>
            <label for="child">Child Name:</label>
            <input type="text" id="child" name="child" required><br><br>
        </div>
        <div>
            <label for="vaccine">Vaccine:</label>
          <select id="vaccine" name="vaccine" required>
          <option value="">Select Vaccine</option>
         <% for (String vaccineName : vaccineNames) { %>
        <option value="<%= vaccineName %>"><%= vaccineName %></option>
           <% } %>
         </select><br><br>
        </div>
         <div>
            <label for="date">New Date:</label>
            <input type="date" id="newdate" name="newdate" required><br><br>
        </div>
        <div>
            <label for="time">New Time:</label>
            <input type="time" id="newtime" name="newtime" required><br><br>
        </div>
         <div>
            <% if (request.getAttribute("msg") != null) { %>
              <p><%= request.getAttribute("msg") %></p>
             <% } %>
        </div>
        <input type="submit" value="Reschedule appointment">
    </form>
</body>
</html>
