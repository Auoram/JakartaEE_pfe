<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="Children_Vax.Connection_Db" %>
<%@ page import="java.sql.ResultSet" %>
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
%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Personnel Page</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f3f4f6;
        }

        .container {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            padding-top: 20px;
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
            margin-bottom: 10px;
        }

        .card-content {
            color: #777;
            font-size: 16px;
        }

        .button {
            background-color: #4a90e2;
            color: white;
            padding: 10px 20px;
            border-radius: 5px;
            text-decoration: none;
            display: inline-block;
            margin-top: 20px;
        }

        .select-container {
            display: flex;
            flex-direction: row;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }

        .select-container select {
            padding: 10px;
            border-radius: 5px;
            border: 1px solid #ccc;
            width: 45%;
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
          <div class="gap-8 lg:gap-20 py-4 pr-6 lg:flex items-center grid ">
            <p class="relative flex flex-1 text-gray-500 regular-16 ml-4 lg:ml-10 my-10">Do you want to change your password ?</p>
            <div class="relative flex flex-1 lg:ml-0 ml-2">
            <a href="newPassword.jsp" class="border lg:py-4 py-2 lg:px-8 px-4 border-blue-400 text-center font-bold text-blue-400 hover:bg-blue-100">Change Password</a>
            </div>
          </div>
        </div>
                 <div class="mx-4 mt-6 bg-white mb-8 border border-gray-100 shadow-lg rounded-lg">
          <h1 class="text-gray-500 text-3xl mt-5 ml-4 lg:ml-10">Modify AccountInfo</h1>
          <div class="border border-gray-300 mt-5"></div>
          <div class="gap-8 lg:gap-20 py-4 pr-6 lg:flex items-center grid ">
              <p class="relative flex flex-1 text-gray-500 regular-16 ml-4 lg:ml-10 my-10">Do you want to change some account information ?</p>
            <div class="relative flex flex-1 lg:ml-0 ml-2">
            <a href="modifyPm.jsp" class="border lg:py-4 py-2 lg:px-8 px-3 border-blue-400 text-center font-bold text-blue-400 hover:bg-blue-100">Modify</a>
            </div>
          </div>
        </div>
        </div>
    <div class="dashboard-container lg:w-4/5 w-3/5 bg-white mt-6 mr-8">
        <div class="section-title">Dashboard</div>

        <div class="card">
            <div class="card-title">Parents Information</div>
            <div class="select-container">
                <form action="#" method="post" class="mb-6 mt-6 ml-8 lg:mx-20">
                   <div class="flex lg:flex-row flex-col">
    <label for="parentSelect" class="select-label text-xl mr-4">Select Parent:</label>
    <select name="parentId" id="parentId" class="select-dropdown border border-blue-400 mr-4 rounded-md px-4 py-2">
        <%
        try {
            Connection_Db.Connect();
            Connection conn = Connection_Db.conn;

            String selectParentIdsQuery = "SELECT idP, nomP, prenomP FROM `vax`.`Parent`";
            PreparedStatement parentIdsStmt = conn.prepareStatement(selectParentIdsQuery);
            ResultSet parentIdsRs = parentIdsStmt.executeQuery();
            while (parentIdsRs.next()) {
                int id = parentIdsRs.getInt("idP");
                String firstName1 = parentIdsRs.getString("prenomP");
                String lastName = parentIdsRs.getString("nomP");
        %>
        <option value="<%= id %>"><%= firstName1 %> <%= lastName %></option>
        <%
            }
            parentIdsRs.close();
            parentIdsStmt.close();
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
            out.println("Error fetching parent information. Please try again.");
        }
        %>
    </select>
    <input type="submit" value="Show Profile" class="submit-btn bg-blue-400 border text-white font-bold rounded-lg pointer px-4 py-2 hover:bg-opacity-30 hover:text-blue-400">
</div> 
        </form>
            </div>
<%
    try { 
    if (request.getMethod().equals("POST")) {
    String PIdParam = request.getParameter("parentId");
            if (PIdParam != null) {
        int selectedParentId = Integer.parseInt(PIdParam);
    
        Connection_Db.Connect();
        Connection conn = Connection_Db.conn;

        String selectParentProfileQuery = "SELECT nomP, prenomP, numTelP, roleP, sexeP FROM `vax`.`Parent` WHERE idP = ?";
        PreparedStatement pstmt = conn.prepareStatement(selectParentProfileQuery);
        pstmt.setInt(1, selectedParentId);
        ResultSet rs = pstmt.executeQuery();
        if (rs.next()) {
%>
    <div class="lg:ml-20 ml-8 relative flex flex-1 flex-col gap-4">
        <h1 class="text-blue-40 mb-6 text-2xl"><%= rs.getString("prenomP") %> <%= rs.getString("nomP") %></h1>
        <p class="text-gray-400"><span class="text-blue-40 mr-2 text-lg">Phone number:</span><%= rs.getString("numTelP") %></p>
        <p class="text-gray-400"><span class="text-blue-40 mr-2 text-lg">Relationship whith child:</span><%= rs.getString("roleP") %></p>
        <p class="text-gray-400"><span class="text-blue-40 mr-2 text-lg">Gender:</span><%= rs.getString("sexeP") %></p>
    </div>
<%
        }
        rs.close();
        pstmt.close();
        conn.close();
    }else{
    out.println("");
    }}} catch (SQLException e) {
        e.printStackTrace();
        out.println("Error fetching parent profile information. Please try again." + e.getMessage());
    }
%>
        </div>

        <div class="card">
            <div class="card-title">Children Information</div>
            <div class="select-container">
<form action="#" method="post" class="mb-6 mt-6 ml-8 lg:mx-20">
                   <div class="flex lg:flex-row flex-col">
    <label for="kidId" class="select-label text-xl mr-4">Select Child:</label>
    <select name="kidId" id="kidId" class="select-dropdown border border-blue-400 mr-4 rounded-md px-4 py-2">
            <%
            try {
                Connection_Db.Connect();
                Connection conn = Connection_Db.conn;

                String selectchildIdsQuery = "SELECT idE, nomCompletE FROM `vax`.`Enfant`";
            PreparedStatement childIdsStmt = conn.prepareStatement(selectchildIdsQuery);
                ResultSet childIdsRs = childIdsStmt.executeQuery();
                while (childIdsRs.next()) {
                    int id = childIdsRs.getInt("idE");
                String fullName = childIdsRs.getString("nomCompletE");
            %>
        <option value="<%= id %>"><%= fullName %></option>
            <%
                }
                childIdsRs.close();
                childIdsStmt.close();
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            out.println("Error fetching parent information. Please try again.");
            }
            %>
        </select>
        <input type="submit" value="Show Profile" class="submit-btn bg-blue-400 border text-white font-bold rounded-lg pointer px-4 py-2 hover:bg-opacity-30 hover:text-blue-400">
</div> 
    </form>
            </div>
<%  try {
            if (request.getMethod().equals("POST")) {
            String kidIdParam = request.getParameter("kidId");
            if (kidIdParam != null) {
            int selectedChildId = Integer.parseInt(kidIdParam);
        
            Connection_Db.Connect();
            Connection conn = Connection_Db.conn;

            String selectChildProfileQuery = "SELECT nomCompletE, dateNaiss, adresseE, numSMI, sexe, allergies, groupeSang, infoMedicaux, province, ville FROM `vax`.`Enfant` WHERE idE = ?";
        PreparedStatement stmt = conn.prepareStatement(selectChildProfileQuery);
        stmt.setInt(1, selectedChildId);
        ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
    %>
    <div class="lg:ml-20 ml-8 relative flex flex-1 flex-col gap-4">
        <h1 class="text-blue-40 mb-6 text-2xl"><%= rs.getString("nomCompletE") %></h1>
        <p class="text-gray-400"><span class="text-blue-40 mr-2 text-lg">Date of birth:</span><%= rs.getString("dateNaiss") %></p>
        <p class="text-gray-400"><span class="text-blue-40 mr-2 text-lg">Address:</span><%= rs.getString("adresseE") %></p>
        <p class="text-gray-400"><span class="text-blue-40 mr-2 text-lg">Gender:</span><%= rs.getString("sexe") %></p>
        <p class="text-gray-400"><span class="text-blue-40 mr-2 text-lg">Allergies:</span><%= rs.getString("allergies") %></p>
        <p class="text-gray-400"><span class="text-blue-40 mr-2 text-lg">Blood type :</span><%= rs.getString("groupeSang") %></p>
        <p class="text-gray-400"><span class="text-blue-40 mr-2 text-lg">Medical information:</span><%= rs.getString("infoMedicaux") %></p>
        <p class="text-gray-400"><span class="text-blue-40 mr-2 text-lg">Region:</span><%= rs.getString("province") %></p>
        <p class="text-gray-400"><span class="text-blue-40 mr-2 text-lg">City :</span><%= rs.getString("ville") %></p>
        <p class="text-gray-400"><span class="text-blue-40 mr-2 text-lg">SMI number :</span><%= rs.getString("numSMI") %></p>
        <form action="childInfoModify.jsp" method="post">
          <div class="flex flex-row">
            <input type="hidden" name="kidId" value="<%= kidIdParam %>">
            <input type="submit" value="Edit Profile" class="submit-btn bg-blue-400 border text-white font-bold rounded-lg pointer px-4 py-2 hover:bg-opacity-30 hover:text-blue-400">
          </div>
        </form>
        </div>
    <%
            }
            rs.close();
        stmt.close();
            conn.close();
    }else{
     out.println("");
    }} }catch (SQLException e) {
            e.printStackTrace();
        out.println("Error fetching child profile information. Please try again." + e.getMessage());
        }
    %> 
            </div>

        <div class="card">
        <div class="card-title">Change Appointment Status</div>
        <div class="select-container">
            <form action="UpdateAppStatus" method="post" class="mb-6 mt-6 ml-8 lg:mx-20">
                <div class="flex lg:flex-row flex-col lg:gap-20 gap-10 mb-8">
                <label for="appointmentSelect" class="select-label text-xl mr-4">Select Appointment:</label>
                <select name="appointmentId" id="appointmentSelect">
                    <% try {
                        Connection_Db.Connect();
                        Connection conn = Connection_Db.conn;

                        String selectAppIdsQuery = "SELECT idR, dateR FROM `vax`.`RendezVous`";
                        PreparedStatement AppIdsStmt = conn.prepareStatement(selectAppIdsQuery);
                        ResultSet AppIdsRs = AppIdsStmt.executeQuery();
                        while (AppIdsRs.next()) {
                            int id = AppIdsRs.getInt("idR");
                            String date = AppIdsRs.getString("dateR");
                    %>
                    <option value="<%= id %>"><%= date %></option>
                    <% }
                        AppIdsRs.close();
                        AppIdsStmt.close();
                        conn.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                        out.println("Error fetching appointment information. Please try again.");
                    } %>
                </select>
                </div>
                <div class="flex lg:flex-row flex-col lg:gap-32 gap-12">
            <label for="statusSelect" class="select-label text-xl mr-2">Change Status:</label>
            <select name="newStatus" id="statusSelect">
                <option value="scheduled">Scheduled</option>
                <option value="completed">Completed</option>
                <option value="cancelled">Cancelled</option>
            </select>
        </div>
        <div class="card-content mt-6">
            <input type="submit" value="Update Status" class="submit-btn bg-blue-400 border text-white font-bold rounded-lg pointer px-4 py-2 hover:bg-opacity-30 hover:text-blue-400">
        </div>
          </form>
        </div>
    </div>
                
     <div class="card">
        <div class="card-title">Change Child SMI Number</div>
        <div class="select-container">
            <form action="UpdateChildSMI" method="post" class="mb-6 mt-6 ml-8 lg:mx-20">
                <div class="flex lg:flex-row flex-col lg:gap-20 gap-10 mb-8">
                    <label for="childSelect" class="select-label text-xl mr-4">Select Child:</label>
                    <select name="childId" id="childSelect">
                        <% try {
                            Connection_Db.Connect();
                            Connection conn = Connection_Db.conn;

                            String selectChildrenQuery = "SELECT idE, nomCompletE FROM `vax`.`Enfant`";
                            PreparedStatement childrenStmt = conn.prepareStatement(selectChildrenQuery);
                            ResultSet childrenRs = childrenStmt.executeQuery();
                            while (childrenRs.next()) {
                                int id = childrenRs.getInt("idE");
                                String name = childrenRs.getString("nomCompletE");
                        %>
                        <option value="<%= id %>"><%= name %></option>
                        <% }
                            childrenRs.close();
                            childrenStmt.close();
                            conn.close();
                        } catch (SQLException e) {
                            e.printStackTrace();
                            out.println("Error fetching child information. Please try again.");
                        } %>
                    </select>
                </div>
                <div class="flex lg:flex-row flex-col lg:gap-32 gap-12">
                    <label for="smiInput" class="select-label text-xl mr-2">New SMI Number:</label>
                    <input type="text" name="newSMI" id="smiInput" class="border border-gray-300 rounded-md px-3 py-2">
                </div>
                <div class="card-content mt-6">
                    <input type="submit" value="Update SMI Number" class="submit-btn bg-blue-400 border text-white font-bold rounded-lg pointer px-4 py-2 hover:bg-opacity-30 hover:text-blue-400">
                </div>
            </form>
        </div>
    </div>
    </div>
</div>
</div>
</body>
</html>

