<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="Children_Vax.Connection_Db" %>
<%@ page import="java.sql.ResultSet" %>
<%
    String firstName = (String) session.getAttribute("firstName");
    String email = (String) session.getAttribute("email");
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
                <a href="dashboard.jsp"><img src="images/whiteLogo.png" alt="Logo"></a>
            </div>
            <div class="menu">
                <img src="images/menu-white.svg" alt="Menu" onclick="toggleMenu()">
                <div id="menuLinks" class="menu-links px-20 pt-8 bg-blue-400 right-0 w-auto flex flex-col gap-y-4 items-center justify-center text-3xl text-center" style = "margin-bottom: 35px;">
                    <a href="dashboard.jsp">Dashboard</a>
                    <a href="childProfile.jsp">Child Profile</a>
                    <a href="VaxInfo.jsp">Vaccination Information</a>
                    <a href="addAnotherChild.jsp">Add Child</a>
                    <a href="appointmentPage.jsp">Appointment Management</a>
                    
                    <a href="settings.jsp">
                        <p class="text-lg">Settings</p>
                    </a>

                    <a href="chooseWho.jsp">
                        <p class="text-lg">Check Another Kid</p>
                    </a>

                    <a href="index.html" class="border border-white p-4 mx-14 hover:bg-white">
                        <p class="text-base">Log Out</p>
                    </a>
                </div>
            </div>
        </header>
    <body>
         <section>
             <div>
        <p className="text-gray-600 text-6xl my-5 ml-8 lg:ml-20">Account Settings</p>
         <div className="border border-gray-400"></div>
        </div>
        <div class="bg-white mx-3 mt-2 border border-gray-100 shadow-lg rounded-lg">
    <h1 class="text-gray-500 text-3xl mt-5 ml-8 lg:ml-20">Profile</h1>
    <div class="border border-gray-300 mt-5"></div>
    <%      try {
                Connection_Db.Connect();
                Connection conn = Connection_Db.conn;
                String selectCentreIdQuery = "SELECT prenomP ,numTelP ,roleP FROM `vax`.`Parent` WHERE nomP = ?";
                PreparedStatement stmt = conn.prepareStatement(selectCentreIdQuery);
                stmt.setString(1, firstName);
                ResultSet rs = stmt.executeQuery();
                
                rs.next();
                %>
    <div class="gap-16 lg:gap-48 p-4 ml-4 flex items-center">
        <div class="relative flex flex-1 flex-col gap-6">
            <div class='flex items-center'>
                <p class="lg:bold-18 bold-16 text-blue-40" style="min-width: 200px;">Full name :</p>
                <p class="regular-16 text-gray-600"> <%= firstName %> <%= rs.getString("prenomP") %></p>
            </div>
            <div class='flex items-center'>
                <p class="lg:bold-18 bold-16 text-blue-40" style="min-width: 200px;">Email :</p>
                <p class="regular-16 text-gray-600"> <%= email %></p>
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
    <div className="ml-2 mt-2 bg-white mb-8 border border-gray-100 shadow-lg rounded-lg">
          <h1 className="text-gray-600 text-6xl mt-5 ml-8 lg:ml-20">Password</h1>
          <div className="border border-gray-300 mt-5"></div>
          <div className="gap-40 lg:gap-28 py-4 flex items-center">
            <p className="relative flex flex-1 text-gray-500 regular-16 ml-8 lg:ml-20 my-10">Do you want to change your password ?</p>
            <div className="relative flex flex-1">
            <a href="modification.jsp" class="button border py-4 px-14 border-blue-400 font-bold text-blue-400 hover:bg-blue-100">Change Password</a>
            </div>
          </div>
        </div>
</section>
<script src="handleDashboard.js"></script>
    </body>
</html>
