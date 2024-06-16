<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="Children_Vax.Connection_Db" %>
<%@ page import="java.sql.ResultSet" %>
<%
    int pId = (int) session.getAttribute("pId");
    session.setAttribute("pId", pId);
    int newChildId = (request.getParameter("newChildId") != null) ? Integer.parseInt(request.getParameter("newChildId")) : 0;
    session.setAttribute("newChildId",newChildId );
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
        <header class="header flex justify-between items-center bg-blue-400 p-6 relative">
        <div class="logo">
            <img src="images/whiteLogo.png" alt="Logo">
        </div>
        <div class="menu">
            <img src="images/menu-white.svg" alt="Menu" onclick="toggleMenu()">
            <div id="menuLinks" class="menu-links bg-blue-400 bg-opacity-90 pt-12">
                <a href="dashboard.jsp" class="mb-7 text-3xl">Dashboard</a>
                <a href="childProfile.jsp" class="mb-7 text-3xl">Child Profile</a>
                <a href="VaxInfo.jsp" class="mb-7 text-3xl">Vaccination Information</a>
                <a href="addAnotherChild.jsp" class="mb-7 text-3xl">Add Child</a>
                <a href="appointmentPage.jsp" class="mb-7 text-3xl">Appointment Management</a>
                <a href="settings.jsp" class="mb-8 text-xl">Settings</a>
                <a href="logOut.jsp" class="mb-8 text-xl logout">Log Out</a>
            </div>
        </div>
        </header>
        <div class="justify-center">
            <section class="child-page-section mt-8 mx-8 bg-white border shadow-lg rounded-md pb-8">
    <div class="my-8 lg:mx-28 ml-8  font-bold text-3xl">Child's Profile</div>
        <form action="#" method="post" class="mb-6 ml-8 lg:mx-20">
            <label for="childId" class="select-label text-xl lg:ml-14 ml-8 mr-4">Select Child:</label>
            <select name="childId" id="childId" class="select-dropdown border border-blue-400 mr-4 rounded-md px-4 py-2">
                <%
                try {
                    Connection_Db.Connect();
                    Connection conn = Connection_Db.conn;
                    PreparedStatement stmt;
                    ResultSet rs;
                    String selectChildIdsQuery = "SELECT idE, nomCompletE FROM `vax`.`Enfant` WHERE Parent_idP = ?";
                    stmt = conn.prepareStatement(selectChildIdsQuery);
                    stmt.setInt(1, pId);
                    rs = stmt.executeQuery();
                    while (rs.next()) {
                        int id = rs.getInt("idE");
                        String name = rs.getString("nomCompletE");
                %>
                <option value="<%= id %>"><%= name %></option>
                <%
                    }
                    rs.close();
                    stmt.close();
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                    out.println("Error fetching child information. Please try again.");
                }
                %>
            </select>
            <input type="submit" value="Show Profile" class="submit-btn bg-blue-400 border text-white font-bold rounded-lg pointer px-4 py-2 hover:bg-opacity-30 hover:text-blue-400">
        </form>
        
            <% 
            try {
                if (request.getMethod().equals("POST")) {
                    int selectedChildId = Integer.parseInt(request.getParameter("childId"));
                    Connection_Db.Connect();
                    Connection conn = Connection_Db.conn;
                    
                    PreparedStatement stmt;
                    ResultSet rs;
                    String selectChildProfileQuery = "SELECT nomCompletE, dateNaiss, adresseE, sexe, groupeSang, province, ville FROM `vax`.`Enfant` WHERE idE = ?";
                    stmt = conn.prepareStatement(selectChildProfileQuery);
                    stmt.setInt(1, selectedChildId);
                    rs = stmt.executeQuery();
                    
                    if (rs.next()) {
            %>
            <div class="flex flex-row gap-x-12">
            <div class="lg:ml-28 ml-8 relative flex flex-1 flex-col gap-4">
            <h1 class="text-blue-40 mb-6 text-2xl"><%= rs.getString("nomCompletE") %></h1>
            <p class="text-gray-400"><span class="text-blue-600 mr-2 text-lg">Date of birth:</span><%= rs.getString("dateNaiss") %></p>
            <p class="text-gray-400"><span class="text-blue-600 mr-2 text-lg">Address:</span><%= rs.getString("adresseE") %></p>
            <p class="text-gray-400"><span class="text-blue-600 mr-2 text-lg">Gender:</span><%= rs.getString("sexe") %></p>
            <p class="text-gray-400"><span class="text-blue-600 mr-2 text-lg">Blood type :</span><%= rs.getString("groupeSang") %></p>
            <p class="text-gray-400"><span class="text-blue-600 mr-2 text-lg">Region :</span><%= rs.getString("province") %></p>
            <p class="text-gray-400"><span class="text-blue-600 mr-2 text-lg">City :</span><%= rs.getString("ville") %></p>
            </div>
            <div class="child-page-img relative flex flex-1 flex-col gap-4">
                <img src="images/PreDi.jpg" alt="profile-img"/>
            </div>
            </div>
            <%
                } else {
            %>
            <p class="text-red-500 lg:mx-28 ml-8">Child information not found.</p>
            <%
                }
                rs.close();
                stmt.close();
                conn.close();
            }
            } catch (SQLException e) {
                e.printStackTrace();
            %>
            <p class="text-red-500 lg:mx-28 ml-8">Error listing child information. Please try again.</p>
            <%
            }
            %>
</section>

       <section class="vaccination-history-section mt-8 mx-8 bg-white border shadow-lg rounded-md pb-8">
    <h2 class="my-8 lg:mx-28 ml-8 font-bold text-3xl">Vaccination History</h2>
    <div class="table-container lg:mx-28 ml-8 overflow-x-auto">
        <form action="#" method="post" class="mb-6 ml-8 lg:mx-20">
            <label for="childId" class="select-label text-xl mr-4">Select Child:</label>
            <select name="childId" id="childId" class="select-dropdown border border-blue-400 mr-4 rounded-md px-4 py-2">
                <%
                try {
                    Connection_Db.Connect();
                    Connection conn = Connection_Db.conn;
                    PreparedStatement stmt;
                    ResultSet rs;
                    String selectChildIdsQuery = "SELECT idE, nomCompletE FROM `vax`.`Enfant` WHERE Parent_idP = ?";
                    stmt = conn.prepareStatement(selectChildIdsQuery);
                    stmt.setInt(1, pId);
                    rs = stmt.executeQuery();
                    while (rs.next()) {
                        int id = rs.getInt("idE");
                        String name = rs.getString("nomCompletE");
                %>
                <option value="<%= id %>"><%= name %></option>
                <%
                    }
                    rs.close();
                    stmt.close();
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                    out.println("Error fetching child information. Please try again.");
                }
                %>
            </select>
            <input type="submit" value="Show Vaccination History" class="submit-btn bg-blue-400 border text-white font-bold rounded-lg pointer px-4 py-2 hover:bg-opacity-30 hover:text-blue-400">
        </form>
        <% 
        try {
            if (request.getMethod().equals("POST")) {
                int selectedChildId = Integer.parseInt(request.getParameter("childId"));
                Connection_Db.Connect();
                Connection conn = Connection_Db.conn;
                String selectVaccinationHistoryQuery = "SELECT dateR, nomV AS vaccineName, nomC AS vaccinationCenter FROM `vax`.`RendezVous` R INNER JOIN `vax`.`Vaccin` V ON R.Vaccin_idV = V.idV INNER JOIN `vax`.`CentreVax` C ON R.CentreVax_idC = C.idC WHERE R.Enfant_idE = ? AND R.statusR = 'completed'";
                PreparedStatement pstmt = conn.prepareStatement(selectVaccinationHistoryQuery);
                pstmt.setInt(1, selectedChildId);
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
        }

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
