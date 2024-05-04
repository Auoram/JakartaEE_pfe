<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="Children_Vax.Connection_Db" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.Period" %>
<%
    String firstName = (String) session.getAttribute("firstName");
    String email = (String) session.getAttribute("email");
    int pId = (int) session.getAttribute("pId");
    session.setAttribute("pId", pId);
    int newChildId = (request.getParameter("newChildId") != null) ? Integer.parseInt(request.getParameter("newChildId")) : 0;
    session.setAttribute("newChildId",newChildId );
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
        <header class="header flex justify-between items-center bg-blue-400 border-1 p-6">
            <div class="logo">
                <a href="dashboard.jsp"><img src="images/whiteLogo.png" alt="Logo"></a>
            </div>
            <div class="menu">
                <img src="images/menu-white.svg" alt="Menu" onclick="toggleMenu()">
                <div id="menuLinks" class="menu-links px-20 pt-8 bg-blue-400 right-0 w-auto flex flex-col gap-y-4 items-center justify-center text-3xl text-center" style ="margin-bottom: 35px;">
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
    <div class="flex justify-between">
        <div class="w-1/3">
    <section class="profile-section mt-8 ml-8 bg-white border shadow-lg rounded-md">
            <div class="profile-info grid grid-col items-center justify-center gap-6 text-center pb-4">
                <div class="profile-avatar ml-12 mt-4" id="profileAvatar"></div>
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
<div class="appointment-card mt-8 ml-8 bg-white border shadow-lg rounded-md">
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
    conn.close();
} catch (SQLException e) {
    e.printStackTrace();
    out.println("Error fetching appointments. Please try again.");
}
%>

    </section>
    <section class="download mt-8 ml-8 bg-white border shadow-lg rounded-md">
                <h1 class="text-2xl font-bold mb-8 my-8 lg:mx-10 ml-4">Download Records</h1>
                <form action="DownloadRecords" method="post">
                <button type="submit" class="download-btn bg-blue-500 border text-white font-bold rounded-full ml-10 mb-4 p-4 hover:bg-opacity-30 hover:text-blue-500">Download</button>
                </form>     
    </section>
        </div>
        <div class="w-3/5">
        <section class="child-profile-section mt-8 mr-8 bg-white border shadow-lg rounded-md">
            <h2 class=" my-8 lg:mx-20 ml-8  font-bold text-3xl">Child's Profile</h2>
            <div class="flex flex-row">
            <div class="lg:ml-20 ml-8 relative flex flex-1 flex-col gap-4">
                <%
                try {
                Connection_Db.Connect();
                Connection conn = Connection_Db.conn;
                if (newChildId == 0){
                String selectCentreIdQuery = "SELECT nomCompletE, dateNaiss, sexe, groupeSang, ville FROM `vax`.`Enfant` WHERE Parent_idP = ?";
                PreparedStatement stmt = conn.prepareStatement(selectCentreIdQuery);
                stmt.setInt(1, pId);
                ResultSet rs = stmt.executeQuery();
                
                rs.next();
                %>
       <h1 class="text-blue-40 mb-6 text-2xl"><%= rs.getString("nomCompletE") %></h1>
       <p class="text-gray-400"><span class="text-blue-40 mr-2 text-lg">Date of birth:</span><%= rs.getString("dateNaiss") %></p>
       <p class="text-gray-400"><span class="text-blue-40 mr-2 text-lg">Gender:</span><%= rs.getString("sexe") %></p>
       <p class="text-gray-400"><span class="text-blue-40 mr-2 text-lg">Blood type :</span><%= rs.getString("groupeSang") %></p>
       <p class="text-gray-400"><span class="text-blue-40 mr-2 text-lg">City :</span><%= rs.getString("ville") %></p>
       <%
           rs.close();
                stmt.close();
           } else {
                String selectCentreIdQuery = "SELECT nomCompletE, dateNaiss, sexe, groupeSang, ville FROM `vax`.`Enfant` WHERE idE = ?";
                PreparedStatement stmt = conn.prepareStatement(selectCentreIdQuery);
                stmt.setInt(1, newChildId);
                ResultSet rs = stmt.executeQuery();
                
                rs.next();
                %>
       <h1 class="text-blue-40 mb-6 text-2xl"><%= rs.getString("nomCompletE") %></h1>
       <p class="text-gray-400"><span class="text-blue-40 mr-2 text-lg">Date of birth:</span><%= rs.getString("dateNaiss") %></p>
       <p class="text-gray-400"><span class="text-blue-40 mr-2 text-lg">Gender:</span><%= rs.getString("sexe") %></p>
       <p class="text-gray-400"><span class="text-blue-40 mr-2 text-lg">Blood type :</span><%= rs.getString("groupeSang") %></p>
       <p class="text-gray-400"><span class="text-blue-40 mr-2 text-lg">City :</span><%= rs.getString("ville") %></p>
        <%      rs.close();
                stmt.close();
            }
                
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
                out.println("Error listing child information. Please try again.");
            }
        %>
        <div class="my-8">
            <a href="childProfile.jsp" class="child-profile-btn bg-blue-500 border text-white font-bold rounded-full p-4 hover:bg-opacity-30 hover:text-blue-500">More Info</a>
        </div>
     </div>
     <div class="child-profile-img relative flex flex-1 flex-col gap-4">
         <img src="images/PreDi.jpg" alt="profile-img"/>
     </div>
       </div>
        </section>

        <section class="vaccination-section mt-10">
            <div class="bg-white relative flex flex-1 gap-2 mt-8 mr-8 border border-gray-40 shadow-lg rounded-md p-4 flex-col">
    <h1 class="my-8 lg:mx-20 ml-8  font-bold text-3xl">Vaccins needed for your child in order:</h1>
<%
try {
    Connection_Db.Connect();
    Connection conn = Connection_Db.conn;
    int childId = 0;
    LocalDate dob = null;
    if (newChildId == 0) {
        String selectChildIdQuery = "SELECT idE, dateNaiss FROM `vax`.`Enfant` WHERE Parent_idP = ?";
        PreparedStatement childIdStmt = conn.prepareStatement(selectChildIdQuery);
        childIdStmt.setInt(1, pId);
        ResultSet childIdRs = childIdStmt.executeQuery();

        if (childIdRs.next()) {
            childId = childIdRs.getInt("idE");
            dob = childIdRs.getDate("dateNaiss").toLocalDate();
        }
        childIdRs.close();
        childIdStmt.close();
    } else {
        childId = newChildId;
        String selectDateOfBirthQuery = "SELECT dateNaiss FROM `vax`.`Enfant` WHERE idE = ?";
        PreparedStatement dateOfBirthStmt = conn.prepareStatement(selectDateOfBirthQuery);
        dateOfBirthStmt.setInt(1, newChildId);
        ResultSet dobRs = dateOfBirthStmt.executeQuery();
        if (dobRs.next()) {
            dob = dobRs.getDate("dateNaiss").toLocalDate();
        }
        dobRs.close();
        dateOfBirthStmt.close();
    }

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
        while (rs.next()) {
%>
    <h2 class="text-gray-400"><%= rs.getString("nomV") %></h2>
    <div class="grid lg:grid-cols-3 grid-cols-1 text-center mb-3 gap-x-20 lg:px-32">
        <div class='grid gap-y-4 justify-items-center'>
            <img src="images/sideEffect.jpg" alt='Side Effect'/>
            <h3 class="text-blue-40">Side effects</h3>
            <p class="text-gray-600"><%= rs.getString("EffetSecondaire") %></p>
        </div>
        <div class='grid gap-y-4 justify-items-center'>
            <img src="images/recommend.jpg" alt='Recommendations'/>
            <h3 class="text-blue-40">Recommendations</h3>
            <p class="text-gray-600"><%= rs.getString("descr") %></p>
        </div>
        <div class='grid gap-y-4 justify-items-center'>
            <img src="images/PreDi.jpg" alt='Preventable Diseases'/>
            <h3 class="text-blue-40">Preventable diseases</h3>
            <p class="text-gray-600"><%= rs.getString("maladieEvitable") %></p>
        </div>
    </div>
<%
        }
        rs.close();
        pstmt.close();
    } else {
        out.println("No Vaccin for this age!");
    }
    conn.close();
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
        var firstName = "<%= firstName %>";
        var firstLetter = firstName.charAt(0);
        document.getElementById("profileAvatar").innerText = firstLetter;
    });
</script>
    <script src="handleDashboard.js"></script>
</body>
</html>
