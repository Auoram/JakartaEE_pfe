<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if (session != null) {
        session.invalidate();
    }
    response.sendRedirect("index.jsp");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Logout</title>
        <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
        <meta http-equiv="refresh" content="3;url=index.jsp">
    </head>
    <body class="bg-blue-100 bg-opacity-20 flex items-center justify-center h-screen">
        <div class="text-center">
            <div class="mb-6">
                <a href="index.jsp">
                    <img src="images/logo-img.png" alt="Logo" class="h-14 mx-auto">
                </a>
            </div>
            <h1 class="text-3xl font-bold text-blue-900 mb-4">You have been logged out</h1>
            <p class="text-gray-700">You will be redirected to the homepage in a few seconds.</p>
            <p class="text-gray-700">If not, click <a href="index.jsp" class="text-blue-500 underline">here</a> to return to the homepage.</p>
        </div>
    </body>
</html>
