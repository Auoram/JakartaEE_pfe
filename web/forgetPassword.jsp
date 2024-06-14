
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Forgot Password</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
</head>
<body class="bg-blue-100 bg-opacity-20">
    <div class="flex flex-col justify-center items-center mt-16 py-4">
        <div class="mb-14">
                <img src="images/logo-img.png" alt="Logo" class="h-14">
        </div>
        <h2 class="text-2xl font-bold text-blue-900 mb-6">Forgot Password</h2>
        <form action="ForgetPassword" method="post" class="w-full max-w-sm bg-white p-8 mb-4 rounded-lg shadow-lg">
            <div class="mb-4">
                <label for="email" class="block text-gray-700 mb-2">Email:</label>
                <input type="email" name="email" id="email" required class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500">
            </div>
            <div>
                <% if (request.getAttribute("msg") != null) { %>
                    <p class="text-red-500 mb-4"><%= request.getAttribute("msg") %></p>
                <% } %>
            </div>
            <div class="text-center">
                <input type="submit" value="Change Password" class="w-full py-2 bg-blue-500 text-white rounded-md hover:bg-blue-600 cursor-pointer">
            </div>
        </form>
    </div>
</body>
</html>


