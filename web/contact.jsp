
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>KidVax - Children's Vaccination Management</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <link rel="stylesheet" href="appStyle.css">
    </head>
    <body class="bg-gradient-to-r from-white from-90% via-blue-100 via-10% to-blue-300 to-30%">
        <header class="flex items-center justify-between p-4 bg-blue-800 text-white">
        <div class="logo">
            <a href="index.jsp"><img src="images/whiteLogo.png" alt="Logo"></a>
        </div>
        <nav class="hidden md:flex space-x-6">
            <ul class="flex space-x-10">
                <li><a href="index.jsp">Home</a></li>
                <li><a href="about.jsp">About</a></li>
                <li><a href="contact.jsp">Contact</a></li>
            </ul>
        </nav>
        <div class="hidden md:flex space-x-4">
            <a href="signup.jsp" class="bg-blue-700 px-5 py-2 text-lg rounded hover:bg-blue-500">Sign Up</a>
            <a href="login.jsp" class="bg-blue-700 px-5 py-2 text-lg rounded hover:bg-blue-500">Login</a>
        </div>
        <div class="md:hidden">
            <img src="images/menu-white.svg" alt="Menu" id="menu-icon" class="menu-icon h-9 cursor-pointer">
        </div>
    </header>
            <div id="mobile-menu" class="mobile-menu hidden bg-blue-600 text-white p-4">
        <ul class="space-y-4">
            <li><a href="index.jsp">Home</a></li>
            <li><a href="about.jsp">About</a></li>
            <li><a href="contact.jsp">Contact</a></li>
        </ul>
        <div class="buttons mt-4 space-y-4">
            <a href="signup.jsp" class="block bg-blue-700 px-4 py-2 rounded text-center hover:bg-blue-500">Sign Up</a>
            <a href="login.jsp" class="block bg-blue-700 px-4 py-2 rounded text-center hover:bg-blue-500">Login</a>
        </div>
    </div>
        
    <section class="max-w-screen-xl mx-auto px-4 flex items-center gap-6 py-16 pb-32 md:gap-7 lg:py-28">
    <div class="relative z-20 flex-1 flex flex-col gap-7 xl:mb-28">
        <h1 class="font-bold text-4xl text-blue-700 lg:text-5xl">Contact Us</h1>
        <p class="lg:text-2xl text-xl mt-6 text-gray-600 xl:max-w-xl">
            If you are experiencing technical issues with our website or app, please contact us at:
        </p>
        <div class="flex gap-4 flex-col lg:flex-row">
            <p class="text-blue-600 text-xl">
                    Phone number:
            </p>
            <p class="text-xl text-gray-600">
                    +212 0654789635
            </p>
        </div>
        <div class="flex gap-4 flex-col lg:flex-row">
            <p class="text-blue-600 text-xl">
                    Email:
            </p>
            <p class="text-xl text-gray-600">
                    info@kidvax.com
            </p>
        </div>
    </div>
    <div class="relative flex-1 flex flex-col gap-7">
        <img src="images/undraw_mobile_content_xvgr.svg" alt="contact-img" class="h-96 w-50 lg:h-[300px] lg:w-[350px]">
    </div>
    </section>
        
    <footer class="bg-blue-800 text-white py-8">
    <div class="container mx-auto px-4 lg:px-8">
        <div class="grid grid-cols-1 md:grid-cols-3 gap-8">
            <div class="px-5">
                <div class="logo mb-5">
                   <a href="index.jsp"><img src="images/whiteLogo.png" alt="Logo"></a>
                </div>
                <p class="text-md">KidVax for an effortless children vaccination management.</p>
            </div>
            <div class="px-5">
                <ul class="text-lg font-bold space-y-4">
                    <li><a href="index.jsp" class="hover:underline">Home</a></li>
                    <li><a href="about.jsp" class="hover:underline">About</a></li>
                    <li><a href="contact.jsp" class="hover:underline">Contact</a></li>
                    <li><a href="howItWork.jsp" class="hover:underline">How it works</a></li>
                </ul>
            </div>
            <div class="px-5">
                <h2 class="text-xl font-bold mb-4">Get in Touch</h2>
                <ul class="text-md space-y-2">
                    <li>Email: <a href="mailto:info@kidvax.com" class="hover:underline">info@kidvax.com</a></li>
                    <li>Phone: <a href="tel:(+212) 0654789635" class="hover:underline">(+212) 0654789635</a></li>
                    <li>
                        Follow us:
                        <div class="flex space-x-4 mt-2">
                            <a href="https://www.linkedin.com/login" class="hover:underline"><img src="images/linkedin.svg" alt="LinkedIn" class="h-4"></a>
                            <a href="https://github.com/Auoram" class="hover:underline"><img src="images/github.svg" alt="GitHub" class="h-5"></a>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
        <div class="border-t border-blue-700 mt-8 pt-4 text-center">
            <p class="text-sm">&copy; 2024 KidVax</p>
        </div>
    </div>
</footer>
        <script src="handleMenu.js">
    </script>
    </body>
</html>
