<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="Children_Vax.Connection_Db" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.Period" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%
    if (session == null || session.getAttribute("email") == null) {
        response.sendRedirect("index.jsp");
        return;
    }
    String firstName = (String) session.getAttribute("firstName");
    String email = (String) session.getAttribute("email");
    Integer pId = (Integer) session.getAttribute("pId");
    if (pId == null) {
        pId = 0;
    }
    session.setAttribute("pId", pId);

    int newChildId = (request.getParameter("newChildId") != null) ? Integer.parseInt(request.getParameter("newChildId")) : 0;
    session.setAttribute("newChildId", newChildId);
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <link rel="stylesheet" href="dashboardStyle.css">
</head>
<body class="bg-blue-100">
<div class="container-fluid">
        <header class="header flex justify-between items-center bg-blue-400 p-6 relative">
        <div class="logo">
            <img src="images/whiteLogo.png" alt="Logo">
        </div>
        <div class="menu">
            <img src="images/menu-white.svg" alt="Menu" onclick="toggleMenu()">
            <div id="menuLinks" class="menu-links w-1/2 h-svh bg-blue-400 pt-10 pb-8 px-6">
                <a href="dashboard.jsp" class="mb-6 text-3xl">Dashboard</a>
                <a href="childProfile.jsp" class="mb-6 text-3xl">Child Profile</a>
                <a href="VaxInfo.jsp" class="mb-6 text-3xl">Vaccination Information</a>
                <a href="addAnotherChild.jsp" class="mb-6 text-3xl">Add Child</a>
                <a href="appointmentPage.jsp" class="mb-6 text-3xl">Appointment Management</a>
                <a href="settings.jsp" class="mb-7 text-xl">Settings</a>
                <a href="logOut.jsp" class="mb-7 text-xl logout">Log Out</a>
            </div>
        </div>
    </header>
    <div class="content flex justify-between">
        <div id="notification" class="lg:w-2/3 w-2/3 rounded-xl px-6 py-6 bg-opacity-40"></div>
        <div class="w-1/3">
    <section class="profile-section mt-8 lg:ml-8 ml-2 bg-white border shadow-lg rounded-md">
            <div class="profile-info grid grid-col items-center justify-center gap-6 text-center pb-4">
                <a href="settings.jsp"><div class="profile-avatar ml-14 mt-4" id="profileAvatar"></div></a>
                <div class="grid grid-col gap-2">
                    <h1 id="firstName" class="text-2xl">Hello, <%= firstName %>!</h1>
                    <p class="text-base"><%= email %></p>
                </div>
            </div>
        </section>
         <section class="appointment-section">
            <%
try {
        Connection_Db.Connect();
        Connection conn = Connection_Db.conn;
        int count = 0;
        List<Integer> childIds = new ArrayList<>();

        String selectChildIdsQuery = "SELECT idE FROM `vax`.`Enfant` WHERE Parent_idP = ?";
        PreparedStatement childIdsStmt = conn.prepareStatement(selectChildIdsQuery);
        childIdsStmt.setInt(1, pId);
        ResultSet childIdsRs = childIdsStmt.executeQuery();
        while (childIdsRs.next()) {
            childIds.add(childIdsRs.getInt("idE"));
        }
        childIdsRs.close();
        childIdsStmt.close();

        for (Integer childId : childIds) {
            String selectAppointmentsQuery = "SELECT R.dateR, V.nomV AS vaccineName, C.nomC AS centerName FROM `vax`.`RendezVous` R INNER JOIN `vax`.`Vaccin` V ON R.Vaccin_idV = V.idV INNER JOIN `vax`.`CentreVax` C ON R.CentreVax_idC = C.idC WHERE R.Enfant_idE = ? AND R.statusR = 'scheduled'";
            PreparedStatement pstmt = conn.prepareStatement(selectAppointmentsQuery);
            pstmt.setInt(1, childId);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                String appointmentDate = rs.getString("dateR");
                String vaccineName = rs.getString("vaccineName");
                String centerName = rs.getString("centerName");
                count++;
    %>
    <div class="appointment-card mt-8 lg:ml-8 ml-2 bg-white border shadow-lg rounded-md">
        <h2 class="text-2xl font-bold mb-4 my-8 lg:mx-10 ml-4">Appointment n° <%= count %></h2>
        <div class="appointment lg:mx-10 ml-4 mb-4 grid gap-y-4">
            <h1 class="text-xl text-gray-500"><%= vaccineName %></h1>
            <p><span class="text-blue-400 font-semibold">Vaccination Center:</span> <%= centerName %></p>
            <p><span class="text-blue-400 font-semibold">Date:</span> <%= appointmentDate %></p>
        </div>
    </div>
    <%
            }
            rs.close();
            pstmt.close();
        }
        conn.close();
    } catch (SQLException e) {
        e.printStackTrace();
        out.println("Error fetching appointments. Please try again.");
    }
    %>
</section>
    <section class="download mt-8 lg:ml-8 ml-2 bg-white border shadow-lg rounded-md">
                <h1 class="text-2xl font-bold mb-8 my-8 lg:mx-10 ml-4">Download Records</h1>
                <form action="DownloadRecords" method="post" class="mb-6 ml-4 lg:mx-10">
                    <label for="childId" class="select-label text-xl mr-4">Select Child:</label>
                    <select name="childId" id="childId" class="select-dropdown border border-blue-400 mr-4 rounded-md lg:px-4 px-1 py-2" required>
                        <% 
                            try {
                                Connection_Db.Connect();
                                Connection conn = Connection_Db.conn;
                                String query = "SELECT idE, nomCompletE FROM `vax`.`Enfant` WHERE Parent_idP = ?";
                                PreparedStatement pstmt = conn.prepareStatement(query);
                                pstmt.setInt(1, pId);
                                ResultSet rs = pstmt.executeQuery();
                                
                                while (rs.next()) {
                                    int id = rs.getInt("idE");
                                    String name = rs.getString("nomCompletE");
                                    out.print("<option value='" + id + "'>" + name + "</option>");
                                }
                                rs.close();
                                pstmt.close();
                                conn.close();
                            } catch (SQLException e) {
                                e.printStackTrace();
                            }
                        %>
                    </select>
                <button type="submit" class="download-btn bg-blue-500 border text-white font-bold rounded-full ml-2 mt-6 mb-4 p-4 hover:bg-opacity-30 hover:text-blue-500">Download</button>
                </form>     
    </section>
        </div>
        <div class="w-3/5">
    <section class="child-profile-section mt-8 lg:mr-8 mr-2 bg-white border shadow-lg rounded-md">
    <h2 class="my-8 lg:mx-20 ml-8 font-bold text-3xl">Child's Profile</h2>
    
    <form action="#" method="post" class="mb-6 ml-8 lg:mx-20">
        <label for="childId" class="select-label text-xl mr-4">Select Child:</label>
        <select name="childId" id="childId" class="select-dropdown border border-blue-400 mr-4 rounded-md px-4 py-2">
            <%
            try {
                Connection_Db.Connect();
                Connection conn = Connection_Db.conn;

                String selectChildIdsQuery = "SELECT idE, nomCompletE FROM `vax`.`Enfant` WHERE Parent_idP = ?";
                PreparedStatement childIdsStmt = conn.prepareStatement(selectChildIdsQuery);
                childIdsStmt.setInt(1, pId);
                ResultSet childIdsRs = childIdsStmt.executeQuery();
                while (childIdsRs.next()) {
                    int id = childIdsRs.getInt("idE");
                    String name = childIdsRs.getString("nomCompletE");
            %>
            <option value="<%= id %>"><%= name %></option>
            <%
                }
                childIdsRs.close();
                childIdsStmt.close();
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
    if (request.getMethod().equals("POST")) {
        int selectedChildId = Integer.parseInt(request.getParameter("childId"));
        try {
            Connection_Db.Connect();
            Connection conn = Connection_Db.conn;

            String selectChildProfileQuery = "SELECT nomCompletE, dateNaiss, sexe, groupeSang, ville FROM `vax`.`Enfant` WHERE idE = ?";
            PreparedStatement pstmt = conn.prepareStatement(selectChildProfileQuery);
            pstmt.setInt(1, selectedChildId);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
    %>
    <div class="flex flex-row">
    <div class="lg:ml-20 ml-8 relative flex flex-1 flex-col gap-4">
        <h1 class="text-blue-40 mb-6 text-2xl"><%= rs.getString("nomCompletE") %></h1>
        <p class="text-gray-400"><span class="text-blue-40 mr-2 text-lg">Date of birth:</span><%= rs.getString("dateNaiss") %></p>
        <p class="text-gray-400"><span class="text-blue-40 mr-2 text-lg">Gender:</span><%= rs.getString("sexe") %></p>
        <p class="text-gray-400"><span class="text-blue-40 mr-2 text-lg">Blood type :</span><%= rs.getString("groupeSang") %></p>
        <p class="text-gray-400"><span class="text-blue-40 mr-2 text-lg">City :</span><%= rs.getString("ville") %></p>
        <div class="my-8">
            <a href="childProfile.jsp" class="child-profile-btn bg-blue-500 border text-white font-bold rounded-full p-4 hover:bg-opacity-30 hover:text-blue-500">More Info</a>
        </div>
    </div>
        <div class="child-profile-img relative flex flex-1 flex-col gap-4">
         <img src="images/PreDi.jpg" alt="profile-img"/>
     </div>
    </div>
    <%
            }
            rs.close();
            pstmt.close();
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
            out.println("Error fetching child profile information. Please try again.");
        }
    }
    %> 
        </section>

        <section class="vaccination-section mt-10">
    <div class="bg-white relative flex flex-1 gap-2 mt-8 lg:mr-8 mr-2 border border shadow-lg rounded-md lg:p-4 p-2 flex-col">
        <h2 class="my-8 lg:mx-20 ml-8  font-bold text-3xl">Vaccines to do</h2>
        <form action="#" method="post" class="mb-6 ml-8 lg:mx-20">
            <label for="childId" class="select-label text-xl mr-4">Select Child:</label>
            <select name="childId" id="childId" class="select-dropdown border border-blue-400 mr-4 rounded-md px-4 py-2">
                <%
                try {
                    Connection_Db.Connect();
                    Connection conn = Connection_Db.conn;

                    String selectChildIdsQuery = "SELECT idE, nomCompletE FROM `vax`.`Enfant` WHERE Parent_idP = ?";
                    PreparedStatement childIdsStmt = conn.prepareStatement(selectChildIdsQuery);
                    childIdsStmt.setInt(1, pId);
                    ResultSet childIdsRs = childIdsStmt.executeQuery();
                    while (childIdsRs.next()) {
                        int id = childIdsRs.getInt("idE");
                        String name = childIdsRs.getString("nomCompletE");
                %>
                <option value="<%= id %>"><%= name %></option>
                <%
                    }
                    childIdsRs.close();
                    childIdsStmt.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                    out.println("Error fetching child information. Please try again.");
                }
                %>
            </select>
            <input type="submit" value="Show Vaccination Info" class="submit-btn bg-blue-400 border text-white font-bold rounded-lg pointer px-4 py-2 hover:bg-opacity-30 hover:text-blue-400">
        </form>
        <% 
        try {
            if (request.getMethod().equals("POST")) {
                int selectedChildId = Integer.parseInt(request.getParameter("childId"));
                Connection conn = Connection_Db.conn;
                String selectChildNameQuery = "SELECT nomCompletE FROM `vax`.`Enfant` WHERE idE = ?";
                PreparedStatement pstmtChildName = conn.prepareStatement(selectChildNameQuery);
                pstmtChildName.setInt(1, selectedChildId);
                ResultSet rsChildName = pstmtChildName.executeQuery();
                String childName = "";
                if (rsChildName.next()) {
                    childName = rsChildName.getString("nomCompletE");
                }
                rsChildName.close();
                pstmtChildName.close(); %>
                <p class="text-blue-500 text-2xl lg:ml-20 ml-8 mb-4">Vaccines needed for <%= childName %> in order</p>  
                <%
                String selectChildIdQuery = "SELECT idE, dateNaiss FROM `vax`.`Enfant` WHERE idE = ?";
                PreparedStatement childIdStmt = conn.prepareStatement(selectChildIdQuery);
                childIdStmt.setInt(1, selectedChildId);
                ResultSet childIdRs = childIdStmt.executeQuery();

                int childId = 0;
                LocalDate dob = null;
                if (childIdRs.next()) {
                    childId = childIdRs.getInt("idE");
                    dob = childIdRs.getDate("dateNaiss").toLocalDate();
                }
                childIdRs.close();
                childIdStmt.close();

                if (dob != null) {
                    LocalDate currentDate = LocalDate.now();
                    Period period = Period.between(dob, currentDate);
                    int calculatedAge = period.getMonths();

                    String selectVaccineQuery = "SELECT * FROM `vax`.`Vaccin` WHERE ageRecommande <= ? OR ageRecommande <= ? + 1 " +
                            "AND idV NOT IN (SELECT Vaccin_idV FROM `vax`.`RendezVous` WHERE Enfant_idE = ? AND statusR = 'completed')";
                    PreparedStatement pstmt = conn.prepareStatement(selectVaccineQuery);
                    pstmt.setInt(1, calculatedAge);
                    pstmt.setInt(2, calculatedAge);
                    pstmt.setInt(3, childId);
                    ResultSet rs = pstmt.executeQuery();
                    int index = 0;
                    while (rs.next()) {
                %>  
                <div class="border border-gray-300 shadow-lg mb-6 p-4 rounded-md">
                    <div class="flex justify-between items-center">
                        <h3 class="text-xl text-gray-500"><%= rs.getString("nomV") %></h3>
                        <div onclick="toggleDescription(<%= index %>)" class="hover:cursor-pointer">
                            <img src="images/close.svg" alt="plus" height="30" width="30" />
                        </div>
                    </div>
                    <div id="description-<%= index %>" class="mt-4 hidden">
                        <div class="grid lg:grid-row grid-cols-1 text-center mb-3 gap-y-6 lg:ml-20">
                            <div class='grid gap-y-4 justify-items-center lg:text-left lg:justify-items-start'>
                                <h3 class="text-blue-500 text-lg font-medium">Side effects</h3>
                                <p class="text-gray-600 text-md"><%= rs.getString("EffetSecondaire") %></p>
                            </div>
                            <div class='grid gap-y-4 justify-items-center lg:text-left lg:justify-items-start'>
                                <h3 class="text-blue-500 text-lg font-medium">Recommendations</h3>
                                <p class="text-gray-600 text-md"><%= rs.getString("descr") %></p>
                            </div>
                            <div class='grid gap-y-4 justify-items-center lg:text-left lg:justify-items-start'>
                                <h3 class="text-blue-500 text-lg font-medium">Preventable diseases</h3>
                                <p class="text-gray-600 text-md"><%= rs.getString("maladieEvitable") %></p>
                            </div>
                        </div>
                    </div>
                </div>
                <%
                    index++;
                    }
                    pstmt.close();
                } else {
                    out.println("No date of birth found for the selected child.");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            out.println("An error occurred while fetching vaccination information.");
        }
        %>
    </div>
</section>


        </div>
    </div>
</div>
    <script>
        document.addEventListener("DOMContentLoaded", function() {
            <% String confirmationMessage = (String) session.getAttribute("confirmationMessage");
               if (confirmationMessage != null) { %>
                var notification = document.getElementById("notification");
                notification.innerText = "<%= confirmationMessage %>";
                notification.style.visibility = "visible";
                setTimeout(function() {
                    notification.style.visibility = "hidden";
                }, 20000);
                <% session.removeAttribute("confirmationMessage"); %>
            <% } %>
        });
    </script>
    <script>
function toggleDescription(index) {
    var description = document.getElementById('description-' + index);
    if (description.classList.contains('hidden')) {
        description.classList.remove('hidden');
    } else {
        description.classList.add('hidden');
    }
}
</script>
    <script>
    document.addEventListener("DOMContentLoaded", function() {
        var firstName = "<%= firstName %>";
        var firstLetter = firstName.charAt(0);
        document.getElementById("profileAvatar").innerText = firstLetter;
    });
</script>
    <script src="handleDashboard.js"></script>
</body>
</html>
