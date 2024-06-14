<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="Children_Vax.Connection_Db" %>
<%@ page import="java.sql.ResultSet" %>
<%
    String firstName = (String) session.getAttribute("firstName");
    String newemail = (String) session.getAttribute("email");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Settings</title>
        <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
        <link rel="stylesheet" href="dashboardStyle.css">
    </head>
   <header class="header flex justify-between items-center bg-blue-400 border-1 p-6">
            <div class="logo">
                <img src="images/whiteLogo.png" alt="Logo">
            </div>
            <div class="menu">
                <img src="images/menu-white.svg" alt="Menu" onclick="toggleMenu()">
                <div id="menuLinks" class="menu-links px-20 pt-14 bg-blue-400 right-0 w-auto flex flex-col gap-y-4 items-center justify-center text-3xl text-center" >
                    <a href="dashboard.jsp" class="mb-7">Dashboard</a>
                    <a href="childProfile.jsp" class="mb-7">Child Profile</a>
                    <a href="VaxInfo.jsp" class="mb-7">Vaccination Information</a>
                    <a href="addAnotherChild.jsp" class="mb-7">Add Child</a>
                    <a href="appointmentPage.jsp" class="mb-7">Appointment Management</a>
                    
                    <a href="settings.jsp" class="mb-7">
                        <p class="text-lg">Settings</p>
                    </a>

                    <a href="logOut.jsp" class="border border-white p-4 mx-14 hover:bg-white">
                        <p class="text-base">Log Out</p>
                    </a>
                </div>
            </div>
        </header>
<body>
    <div>
        <p class="text-gray-500 text-4xl my-5 ml-8 lg:ml-20">Account Settings</p>
         <div class="border border-gray-400"></div>
        </div>
         <section>
        <div class="bg-white mx-3 mt-2 border border-gray-100 shadow-lg rounded-lg">
    <h1 class="text-gray-500 text-3xl mt-5 ml-8 lg:ml-20">Profile</h1>
    <div class="border border-gray-300 mt-5"></div>
    <%      try {
                Connection_Db.Connect();
                Connection conn = Connection_Db.conn;
                String selectCentreIdQuery = "SELECT prenomP ,numTelP ,roleP FROM `vax`.`Parent` WHERE user_id = (SELECT id FROM `vax`.`User` WHERE email = ?)";
                PreparedStatement stmt = conn.prepareStatement(selectCentreIdQuery);
                stmt.setString(1, newemail);
                ResultSet rs = stmt.executeQuery();
                
                rs.next();
                %>
    <div class="gap-16 lg:gap-48 p-4 ml-8 lg:ml-20 flex items-center">
        <div class="relative flex flex-1 flex-col gap-6">
            <div class='flex items-center'>
                <p class="lg:bold-18 bold-16 text-blue-40" style="min-width: 200px;">Full name :</p>
                <p class="regular-16 text-gray-600"> <%= firstName %> <%= rs.getString("prenomP") %></p>
            </div>
            <div class='flex items-center'>
                <p class="lg:bold-18 bold-16 text-blue-40" style="min-width: 200px;">Email :</p>
                <p class="regular-16 text-gray-600"> <%= newemail %></p>
            </div>
            <div class='flex items-center'>
                <p class="lg:bold-18 bold-16 text-blue-40" style="min-width: 200px;">Phone Number :</p>
                <p class="regular-16 text-gray-600"> <%= rs.getString("numTelP") %></p>
            </div>
            <div class='flex items-center'>
                <p class="lg:bold-18 bold-16 text-blue-40" style="min-width: 200px;">Role :</p>
                <p class="regular-16 text-gray-600"> <%= rs.getString("roleP") %></p>
            </div>
        </div>
        <div class="relative flex flex-1">
            <a href="modification.jsp" class="button border py-4 px-14 border-blue-400 font-bold text-blue-400 hover:bg-blue-100">Modify</a>
        </div>
    </div>
        <%      rs.close();
                stmt.close();
                conn.close(); 
            } catch (SQLException e) {
                e.printStackTrace();
                out.println("Error listing user information. Please try again.");
            }
        %>
</div>
         </section>
<section>
    <div class="mx-3 mt-6 bg-white mb-8 border border-gray-100 shadow-lg rounded-lg">
          <h1 class="text-gray-500 text-3xl mt-5 ml-8 lg:ml-20">Password</h1>
          <div class="border border-gray-300 mt-5"></div>
          <div class="gap-32 lg:gap-36 py-4 flex items-center">
            <p class="relative flex flex-1 text-gray-500 regular-16 ml-8 lg:ml-20 my-10">Do you want to change your password ?</p>
            <div class="relative flex flex-1">
            <a href="newPassword.jsp" class="button border py-4 px-10 border-blue-400 font-bold text-blue-400 hover:bg-blue-100">Change Password</a>
            </div>
          </div>
        </div>
</section>
<section>
    <div class="mx-3 mt-6 bg-white mb-8 border border-gray-100 shadow-lg rounded-lg">
          <h1 class="text-gray-500 text-3xl mt-5 ml-8 lg:ml-20">Delete Account</h1>
          <div class="border border-gray-300 mt-5"></div>
          <div class="gap-x-52 lg:gap-62 py-4 flex items-center">
            <p class="relative flex flex-1 text-gray-500 regular-16 ml-8 lg:ml-20 my-10">Do you want to delete your account ?</p>
            <div class="relative flex flex-1">
            <form action="DeleteAccount" method="POST">
                    <input type="submit" value="Delete" class="button border py-4 px-14 border-red-600 bg-white font-bold text-red-600 hover:bg-red-100">
                </form>
            </div>
          </div>
        </div>
</section>
<script src="handleDashboard.js"></script>
    </body>
</html>
