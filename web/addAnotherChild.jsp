<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>    
<%@ page import="java.sql.Connection" %>
<%@ page import="Children_Vax.Connection_Db" %>
<%@ page import="java.sql.ResultSet" %>
<%
    int pId = (int) session.getAttribute("pId");
    session.setAttribute("pId", pId);
    %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Child</title>
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
input[type="password"],
input[type="text"],
input[type="tel"],
input[type="date"]{
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
        <h2>Add Child Information</h2>
        </div>
        <form action="addAnotherChild" method="POST"> 
            
        <div>
        <label for="childName">Child's Full Name:</label><br>
        <input type="text" id="childName" name="childName" required><br><br>
        </div>
            
        <div>
        <label for="dateOfBirth">Date of Birth:</label><br>
        <input type="date" id="dateOfBirth" name="dateOfBirth" required><br><br>
        </div>
            
        <div>
        <label for="address">Address:</label><br>
        <input type="text" id="address" name="address" required><br><br>
        </div>
            
        <div>
        <label for="bt">Blood Type:</label>
        <input type="text" id="bt" name="bt" required><br><br>
        </div>
            
        <div>
        <label for="city">City:</label>
        <input type="text" id="city" name="city" required><br><br>
        </div>
        
        <div>
        <label for="allergy">Allergies</label>
        <input type="text" id="allergy" name="allergy"><br><br>
        </div>
            
        <div>
        <label for="mc">Medical Conditions</label>
        <input type="text" id="mc" name="mc"><br><br>
        </div>
            
        <div>
        <label for="region">Region</label>
        <input type="text" id="region" name="region" required><br><br>
        </div>
            
        <div>
        <label for="Cvax">Centre de vaccination</label>
        <input type="text" id="Cvax" name="Cvax"><br><br>
        </div>
        
        <div>
        <label for="gender">Gender</label>
          <div>
             <input type="radio" id="gender" name="gender" value="F"/>
               <label for="Girl">Girl<br/></label>
             <input type="radio" id="gender" name="gender" value="M"/>
               <label for="Boy">Boy<br/></label>
          </div>
        </div>
            
        <div>
            <% if (request.getAttribute("msg") != null) { %>
              <p><%= request.getAttribute("msg") %></p>
             <% } %>
        </div>
            <input type="submit" value="Add Another Child">
        </form>
    </body>
</html>
