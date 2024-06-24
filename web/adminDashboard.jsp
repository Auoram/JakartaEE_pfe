<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="Children_Vax.Connection_Db" %>
<%@ page import="java.sql.ResultSet" %>
<%
    if (session == null || session.getAttribute("email") == null) {
        response.sendRedirect("index.jsp");
        return;
    }

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
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
        }
        
        .section-title {
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 20px;
            color: #333;
        }

        .card {
            background-color: #f9fafc;
            border-radius: 10px;
            padding: 20px;
            margin-bottom: 20px;
        }

        .card-title {
            font-size: 18px;
            font-weight: bold;
            color: #555;
            margin-bottom: 45px;
        }

        .card-content {
            color: #777;
            font-size: 16px;
        }
        
        input[type="email"]{
            display: block;
            width: calc(100% - 20px);
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 3px;
        }
        </style>
    </head>
    <body>
        <div class="container-fluid">
        <div class="container-head bg-blue-400 py-4">
        <div class="logo">
            <img src="images/whiteLogo.png" alt="Logo">
        </div>
        <div class="ml-auto">
        <a href="logOut.jsp" class="text-white font-bold border-2 border-white p-4 hover:bg-blue-100 hover:text-blue-400">Logout</a>
    </div>
    </div>
           <div class="flex justify-between">
        <div class="w-1/3 ">
                <div class="mx-4 mt-6 bg-white mb-8 border border-gray-100 shadow-lg rounded-lg">
          <h1 class="text-gray-500 text-3xl mt-5 ml-4 lg:ml-10">Password</h1>
          <div class="border border-gray-300 mt-5"></div>
          <div class="gap-14 lg:gap-20 py-4 pr-6 lg:flex items-center grid ">
            <p class="relative flex flex-1 text-gray-500 regular-16 ml-4 lg:ml-10 my-10">Do you want to change your password ?</p>
            <div class="relative flex flex-1 lg:ml-0 ml-2">
            <a href="newPassword.jsp" class="button border lg:py-4 py-2 lg:px-8 px-4 border-blue-400 text-center font-bold text-blue-400 hover:bg-blue-100">Change Password</a>
            </div>
          </div>
        </div>
        </div>
        <div class="dashboard-container w-3/5 bg-white mt-6 mr-8">
            <div class="section-title">Dashboard</div>
                
                <div class="card">
                   <div class="card-title">Add Medical Staff</div>
                   <a href="addPM.jsp" class="submit-btn bg-blue-400 border text-white font-bold rounded-lg pointer px-10 py-3 hover:bg-opacity-30 hover:text-blue-400">add info</a>
                </div>
                
                <div class="card">
                   <div class="card-title">Delete Medical Staff</div>
                   <a href="#" onclick="showDeleteForm()" class="submit-btn bg-blue-400 border text-white font-bold rounded-lg pointer px-10 py-3 hover:bg-opacity-30 hover:text-blue-400">Choose Staff</a>
                   <div id="deleteForm" class="mt-8" style="display: none;">
                       <form action="DeletePM" method="POST"> 
                            <input type="email" name="emailToDelete" id="emailToDelete" placeholder="Enter Professional Email">
                            <% if (request.getAttribute("msg") != null) { %>
                            <p class="text-red-400 mt-4 mb-4"><%= request.getAttribute("msg") %></p>
                            <% } %>
                            <input type="submit" value="Delete" class="submit-btn bg-red-400 border text-white font-bold rounded-lg pointer px-10 py-3 hover:bg-opacity-30 hover:text-red-400">
                       </form>
                    </div>
                </div>
            
                <div class="card">
                    <div class="card-title">Add Vaccination center</div>
                   <a href="addCentreVax.jsp" class="submit-btn bg-blue-400 border text-white font-bold rounded-lg pointer px-10 py-3 hover:bg-opacity-30 hover:text-blue-400">add info</a>
                </div>
            
                <div class="card">
                   <div class="card-title">Modify Vaccination center Info</div>
                   <a href="modifyVaxC.jsp" class="submit-btn bg-blue-400 border text-white font-bold rounded-lg pointer px-10 py-3 hover:bg-opacity-30 hover:text-blue-400">Modify</a>
                </div>
        </div>
           </div>
        </div>
        <script>
    function showDeleteForm() {
        var deleteForm = document.getElementById("deleteForm");
        if (deleteForm.style.display === "none") {
            deleteForm.style.display = "block";
        } else {
            deleteForm.style.display = "none";
        }
    }
</script>
    </body>
</html>
