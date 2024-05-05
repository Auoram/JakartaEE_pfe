<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="Children_Vax.Connection_Db" %>
<%@ page import="java.sql.ResultSet" %>
<%
    String firstName = (String) session.getAttribute("firstName");
    String email = (String) session.getAttribute("email");
    int pId = (int) session.getAttribute("pId");
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
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }

        .logo img {
            height: 55px;
        }

        .dashboard-container {
            max-width: 800px;
            width: 100%;
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
            margin-top: 20px;
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
    <div class="container-head bg-blue-400 py-4">
        <div class="logo">
            <a href="personnelDashboard.jsp"><img src="images/whiteLogo.png" alt="Logo"></a>
        </div>
    </div>
<div class="container">
    

    <div class="dashboard-container">
        <div class="section-title">Dashboard</div>

        <div class="card">
            <div class="card-title">Parents Information</div>
            <div class="select-container">
                <label for="parentSelect">Select Parent:</label>
                <select id="parentSelect">
                    <%
            try {
                Connection_Db.Connect();
                Connection conn = Connection_Db.conn;

                String selectPIdsQuery = "SELECT idP, nomP, prenomP FROM `vax`.`Parent`";
                PreparedStatement parentIdsStmt = conn.prepareStatement(selectPIdsQuery);
                ResultSet parentIdsRs = parentIdsStmt.executeQuery();
                while (parentIdsRs.next()) {
                    int id = parentIdsRs.getInt("idP");
                    String fname = parentIdsRs.getString("prenomP");
                    String lname = parentIdsRs.getString("nomP");
            %>
            <option value="<%= id %>"><%= fname %><%= lname %></option>
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
            </div>
            <div class="card-content">
                <!-- Display parent information here dynamically using JavaScript -->
            </div>
        </div>

        <!-- Section 2: Children Information -->
        <div class="card">
            <div class="card-title">Children Information</div>
            <div class="select-container">
                <label for="childSelect">Select Child:</label>
                <select id="childSelect">
                    <%
            try {
                Connection_Db.Connect();
                Connection conn = Connection_Db.conn;

                String selectChildIdsQuery = "SELECT idE, nomCompletE FROM `vax`.`Enfant`";
                PreparedStatement childIdsStmt = conn.prepareStatement(selectChildIdsQuery);
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
            </div>
            <div class="card-content">
                <!-- Display child information here dynamically using JavaScript -->
            </div>
        </div>

        <!-- Section 3: Change Appointment Status -->
        <div class="card">
            <div class="card-title">Change Appointment Status</div>
            <div class="select-container">
                <label for="appointmentSelect">Select Appointment:</label>
                <select id="appointmentSelect">
                    <%
            try {
                Connection_Db.Connect();
                Connection conn = Connection_Db.conn;

                String selectAppIdsQuery = "SELECT idR ,dateR FROM `vax`.`RendezVous`";
                PreparedStatement AppIdsStmt = conn.prepareStatement(selectAppIdsQuery);
                ResultSet AppIdsRs = AppIdsStmt.executeQuery();
                while (AppIdsRs.next()) {
                    int id = AppIdsRs.getInt("idR");
                    String date = AppIdsRs.getString("dateR");
            %>
            <option value="<%= id %>"><%= date %></option>
            <%
                }
                AppIdsRs.close();
                AppIdsStmt.close();
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
                out.println("Error fetching appointment information. Please try again.");
            }
            %>
                </select>
            </div>
            <div class="select-container">
                <label for="statusSelect">Change Status:</label>
                <select id="statusSelect">
                    <option value="scheduled">Scheduled</option>
                    <option value="completed">Completed</option>
                    <option value="cancelled">Cancelled</option>
                </select>
            </div>
            <div class="card-content">
                <!-- Implement functionality to change appointment status dynamically using JavaScript -->
            </div>
        </div>
    </div>
</div>
</body>
</html>

