<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>    
<%@ page import="java.sql.Connection" %>
<%@ page import="Children_Vax.Connection_Db" %>
<%@ page import="java.sql.ResultSet" %>
<%
    int pId = (int) session.getAttribute("pId");
    session.setAttribute("pId", pId);
    %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Child</title>
        <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    </head>
    <body class="bg-blue-100 bg-opacity-20">
        <div class="flex flex-col justify-center items-center mt-16 py-4">
        <div class="mb-14">
                <img src="images/logo-img.png" alt="Logo" class="h-14">
        </div>
        <h2 class="text-2xl font-bold text-blue-900 mb-6">Add Child Information</h2>
        <form action="addAnotherChild" method="POST" class="lg:w-2/3 w-4/5 max-w-2xl bg-white p-8 mb-4 rounded-lg shadow-lg">
        <div class="grid grid-cols-1 lg:grid-cols-2 gap-4 mb-4">
            
        <div class="mb-4">
        <label for="childName" class="block text-gray-700 mb-2">Child's Full Name:</label>
        <input type="text" id="childName" name="childName" required class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500"><br><br>
        </div>
            
        <div class="mb-4">
        <label for="dateOfBirth" class="block text-gray-700 mb-2">Date of Birth:</label>
        <input type="date" id="dateOfBirth" name="dateOfBirth" required class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500"><br><br>
        </div>
            
        <div class="mb-4">
        <label for="address" class="block text-gray-700 mb-2">Address:</label>
        <input type="text" id="address" name="address" required class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500"><br><br>
        </div>
            
        <div class="mb-4">
        <label for="bt" class="block text-gray-700 mb-2">Blood Type:</label>
        <input type="text" id="bt" name="bt" required class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500"><br><br>
        </div>
            
        <div class="mb-4">
        <label for="city" class="block text-gray-700 mb-2">City:</label>
        <input type="text" id="city" name="city" required class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500"><br><br>
        </div>
        
        <div class="mb-4">
        <label for="allergy" class="block text-gray-700 mb-2">Allergies</label>
        <input type="text" id="allergy" name="allergy" class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500"><br><br>
        </div>
            
        <div class="mb-4">
        <label for="mc" class="block text-gray-700 mb-2">Medical Conditions</label>
        <input type="text" id="mc" name="mc" class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500"><br><br>
        </div>
            
        <div class="mb-4">
        <label for="region" class="block text-gray-700 mb-2">Region</label>
        <input type="text" id="region" name="region" required class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500"><br><br>
        </div>
            
        <div class="mb-4">
        <label for="Cvax" class="block text-gray-700 mb-2">Centre de vaccination</label>
        <input type="text" id="Cvax" name="Cvax" class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500"><br><br>
        </div>
        
        <div class="mb-4">
        <label for="gender" class="block text-gray-700 mb-4">Gender</label>
          <div class="flex items-center space-x-6">
                <div class="flex items-center">
                   <input type="radio" id="gender" name="gender" value="F"/>
                   <label for="Girl">Girl<br/></label>
                </div>
                <div class="flex items-center">
                   <input type="radio" id="gender" name="gender" value="M"/>
                   <label for="Boy">Boy<br/></label>
                </div>
          </div>
        </div>
        </div>    
        <div>
            <% if (request.getAttribute("msg") != null) { %>
              <p class="text-red-500 mb-4"><%= request.getAttribute("msg") %></p>
             <% } %>
        </div>
        <div class="text-center">
            <input type="submit" value="Add Another Child" class="w-2/4 lg:w-1/3 py-2 bg-blue-500 text-white rounded-md hover:bg-blue-600 cursor-pointer">
        </div>
        </form>
    </body>
</html>
