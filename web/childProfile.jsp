<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="Children_Vax.Connection_Db" %>
<%@ page import="java.sql.ResultSet" %>
<%
    int pId = (int) session.getAttribute("pId");
    session.setAttribute("pId", pId);
    int newChildId = (request.getParameter("newChildId") != null) ? Integer.parseInt(request.getParameter("newChildId")) : 0;
    session.setAttribute("newChildId",newChildId );
    if (newChildId != 0) {
        out.println("New Child ID: " + newChildId);
    } else {
        out.println("New Child ID is 0 or null.");
    }
    %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Child Profile</title>
        <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
        <link rel="stylesheet" href="dashboardStyle.css">
    </head>
    <body class="bg-blue-100">
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
        <div class="justify-center">
            <section class="child-page-section mt-8 mx-8 bg-white border shadow-lg rounded-md pb-8">
    <div class="my-8 lg:mx-28 ml-8  font-bold text-3xl">Child's Profile</div>
    <div class="flex flex-row gap-x-12">
        <div class="lg:ml-28 ml-8 relative flex flex-1 flex-col gap-4">
<%
try {
    Connection_Db.Connect();
    Connection conn = Connection_Db.conn;
    PreparedStatement stmt;
    ResultSet rs;
    if (newChildId == 0) {
        String selectCentreIdQuery = "SELECT nomCompletE, dateNaiss, adresseE, sexe, groupeSang, province, ville FROM `vax`.`Enfant` WHERE Parent_idP = ?";
        stmt = conn.prepareStatement(selectCentreIdQuery);
        stmt.setInt(1, pId);
    } else {
        String selectCentreIdQuery = "SELECT nomCompletE, dateNaiss, adresseE, sexe, groupeSang, province, ville FROM `vax`.`Enfant` WHERE idE = ?";
        stmt = conn.prepareStatement(selectCentreIdQuery);
        stmt.setInt(1, newChildId);
    }
    rs = stmt.executeQuery();

    if (rs.next()) {
%>
    <h1 class="text-blue-40 mb-6 text-2xl"><%= rs.getString("nomCompletE") %></h1>
    <p class="text-gray-400"><span class="text-blue-600 mr-2 text-lg">Date of birth:</span><%= rs.getString("dateNaiss") %></p>
    <p class="text-gray-400"><span class="text-blue-600 mr-2 text-lg">Address:</span><%= rs.getString("adresseE") %></p>
    <p class="text-gray-400"><span class="text-blue-600 mr-2 text-lg">Gender:</span><%= rs.getString("sexe") %></p>
    <p class="text-gray-400"><span class="text-blue-600 mr-2 text-lg">Blood type :</span><%= rs.getString("groupeSang") %></p>
    <p class="text-gray-400"><span class="text-blue-600 mr-2 text-lg">Region :</span><%= rs.getString("province") %></p>
    <p class="text-gray-400"><span class="text-blue-600 mr-2 text-lg">City :</span><%= rs.getString("ville") %></p>
    <%
    } else {
    %>
    <p class="text-red-500">Child information not found.</p>
    <%
    }
    rs.close();
    stmt.close();
    conn.close();
    } catch (SQLException e) {
    e.printStackTrace();
    %>
    <p class="text-red-500">Error listing child information. Please try again.</p>
    <%
    }
    %>
    </div>
        <div class="child-page-img relative flex flex-1 flex-col gap-4">
            <img src="images/PreDi.jpg" alt="profile-img"/>
        </div>
    </div>
</section>
       <section class="vaccination-history-section mt-8 mx-8 bg-white border shadow-lg rounded-md pb-8">
    <h2 class="my-8 lg:mx-28 ml-8 font-bold text-3xl">Vaccination History</h2>
    <div class="table-container lg:mx-28 ml-8 overflow-x-auto">
<% 
try {
    Connection_Db.Connect();
    Connection conn = Connection_Db.conn;
    int childId = 0;
    if (newChildId == 0) {
        String selectChildIdQuery = "SELECT idE FROM `vax`.`Enfant` WHERE Parent_idP = ?";
        PreparedStatement childIdStmt = conn.prepareStatement(selectChildIdQuery);
        childIdStmt.setInt(1, pId);
        ResultSet childIdRs = childIdStmt.executeQuery();

        if (childIdRs.next()) {
            childId = childIdRs.getInt("idE");
        }
        childIdRs.close();
        childIdStmt.close();
    } else {
        childId = newChildId;
    }

    String selectVaccinationHistoryQuery = "SELECT dateR, nomV AS vaccineName, nomC AS vaccinationCenter FROM `vax`.`RendezVous` R INNER JOIN `vax`.`Vaccin` V ON R.Vaccin_idV = V.idV INNER JOIN `vax`.`CentreVax` C ON R.CentreVax_idC = C.idC WHERE R.Enfant_idE = ? AND R.statusR = 'completed'";
    PreparedStatement pstmt = conn.prepareStatement(selectVaccinationHistoryQuery);
    pstmt.setInt(1, childId);
    ResultSet rs1 = pstmt.executeQuery();

    if (rs1.next()) {
%>
    <table class="vaccination-history-table mt-6">   
       <tr>
        <th>Date</th>
        <th>Vaccine Name</th>
        <th>Vaccination Center</th>
       </tr>
    <% 
        do {
            String date = rs1.getString("dateR");
            String vaccineName = rs1.getString("vaccineName");
            String vaccinationCenter = rs1.getString("vaccinationCenter");
    %>
    <tr>
        <td><%= date %></td>
        <td><%= vaccineName %></td>
        <td><%= vaccinationCenter %></td>
    </tr>
    <% 
        } while (rs1.next());
    %>
    </table>
<% 
    } else { 
%>
    <p class="text-red-500">No vaccination history found for this child.</p>
<%
    }

    rs1.close();
    pstmt.close();
    conn.close();
} catch (SQLException e) {
    e.printStackTrace();
    out.println("Error listing vaccination history. Please try again. "+ e.getMessage());
}
%>
</div>

</section>

    <section class="quote-section mt-8 mb-8 mx-8 bg-white border shadow-lg rounded-md pb-8">
    <h2 class="my-8 lg:mx-28 ml-8 font-bold text-3xl">Quote</h2>
    <div class="flex lg:mx-28 ml-8 lg:gap-x-20">
        <div class="quote-image relative">
            <img src="images/computer.png" alt="Quote Image">
        </div>
        <div class="quote-text mt-14">
            <p class="text-lg font-semibold">"Vaccines are the most cost-effective health care interventions there are.A dollar spent on a childhood vaccination not only helps save a life, but greatly reduces spending on future healthcare."</p>
            <p class="text-sm mt-8">Ezekiel Emanuel</p>
        </div>
    </div>
</section>

        </div>
        <script src="handleDashboard.js"></script>
    </body>
</html>
