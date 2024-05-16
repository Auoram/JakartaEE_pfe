<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*, java.util.*" %>    
<%@ page import="java.sql.Connection" %>
<%@ page import="Children_Vax.Connection_Db" %>
<%@ page import="java.sql.ResultSet" %>
<%
    String firstName = (String) session.getAttribute("firstName");
    String email = (String) session.getAttribute("email");
%>
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
        input[type="email"],
input[type="text"],
input[type="tel"],
select[id="vc"]{
    display: block;
    width: calc(100% - 20px);
    padding: 10px;
    margin-bottom: 10px;
    border: 1px solid #ccc;
    border-radius: 3px;
}

input[type="submit"] {
    width: 25%;
    padding: 10px;
    background-color: #007bff;
    color: #fff;
    border: none;
    border-radius: 3px;
    cursor: pointer;
    margin-top: 20px;
    margin-left: 37.5%;
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
        <h2>Modify Account Info</h2>
        </div>
        <form action="modifyPM" method="POST"> 
             
        <div>
        <label for="email">Personnel Email:</label>
        <input type="email" id="emailP" name="emailP" required><br><br>
        </div>
            
        <div>
        <label for="tel">Phone number:</label>
        <input type="tel" pattern="^0[0-9]{9}" id="tel" name="tel" required><br><br>
        </div>
            
        <div>
        <label for="job">Job:</label>
        <input type="text" id="job" name="job" required><br><br>
        </div>
           
        <div>
        <label for="vc">Vaccination Center:</label>
        <select id="vc" name="vc" required>
          <option value="">Select Vaccine</option>
         <% for (String vaccineCName : vaccineCNames) { %>
        <option value="<%= vaccineCName %>"><%= vaccineCName %></option>
           <% } %>
         </select><br><br>
        </div>
            
        <div>
            <% if (request.getAttribute("msg") != null) { %>
              <p><%= request.getAttribute("msg") %></p>
             <% } %>
        </div>
            <input type="submit" value="Submit Modification">
        </form>
    </body>
</html>
