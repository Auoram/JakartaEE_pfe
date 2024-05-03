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
        <title>Appointment page</title>
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
                <div id="menuLinks" class="menu-links px-20 pt-20 bg-blue-400 right-0 w-auto flex flex-col gap-9 items-center justify-center text-3xl text-center">
                    <a href="dashboard.jsp">Dashboard</a>
                    <a href="childProfile.jsp">Child Profile</a>
                    <a href="VaxInfo.jsp">Vaccination Information</a>
                    <a href="addchild.jsp">Add Child</a>
                    <a href="appointmentPage.jsp">Appointment Management</a>
                </div>
            </div>
        </header>
        <div class="justify-center">
            <section class="appointment-management-section sm:py-8 flex justify-between mt-8">
            <div class="text-container lg:ml-12 ml-8 flex gap-y-10 flex-col justify-center">
                <h2 class="lg:text-5xl text-3xl font-bold mb-4 text-blue-800">Take appointment right now</h2>
                <p class="text-xl text-gray-600">The way to manage your appointment is written right bellow.</p>
            </div>
            <div class="photo-container mr-12">
                <img src="images/child-visiting-the-pediatrician.png" alt="Appointment Management" class="rounded-md shadow-sm">
            </div>
            </section>
            <section class="take-appointment-section bg-white mt-8 py-14 flex justify-center items-center mt-8">
            <div class="text-center">
                    <h1 class="text-3xl font-bold my-8 text-blue-400">Take an Appointment</h1>
                    <p class="text-lg mb-6 text-gray-500">Click the button Book Now and fill the form.</p>
                    <button class="bg-blue-500 border text-white font-bold rounded-full p-4 hover:bg-opacity-30 hover:text-blue-500">Book Now</button>
            </div>
            </section>
            <section class="cancel-appointment-section mt-8 pb-8 flex justify-center items-center mt-8">
            <div class="text-center">
                    <h1 class="text-3xl font-bold my-8 text-blue-400">Cancel an Appointment</h1>
                    <p class="text-lg mb-6 text-gray-500">Click the button Cancel It and fill the form.</p>
                    <button class="bg-blue-500 border text-white font-bold rounded-full p-4 hover:bg-opacity-30 hover:text-blue-500">Cancel It</button>
            </div>
            </section>
            <section class="rescedule-appointment-section bg-white mt-8 py-14 flex justify-center items-center mt-8">
            <div class="text-center">
                    <h1 class="text-3xl font-bold my-8 text-blue-400">Reschedule an Appointment</h1>
                    <p class="text-lg mb-6 text-gray-500">Click the button Reschedule Now and fill the form.</p>
                    <button class="bg-blue-500 border text-white font-bold rounded-full p-4 hover:bg-opacity-30 hover:text-blue-500">Reschedule Now</button>
            </div>
            </section>
        </div>
        <script src="handleDashboard.js"></script>
    </body>
</html>
