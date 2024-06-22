
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
    <body class="bg-white">
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
        
        <section class="max-w-7xl mx-auto flex items-center gap-7 py-16 md:gap-10 lg:py-20">
        <div class="relative z-20 flex-1 flex px-4 lg:px-0 xl:text-center pt-10 flex-col gap-4 lg:gap-8 xl:mb-28">
            <h1 class="text-3xl lg:text-5xl font-bold lg:mr-6 text-blue-600">The purpose of <span class="text-blue-800">KidVax</span></h1>
            <p class="lg:text-xl text-lg mt-6 text-gray-600 xl:max-w-xl">
                In our commitment to children's health, KidVax provides comprehensive vaccination management services, ensuring every child receives the care and protection they need.
            </p>
        </div>
        <div class="relative flex-1 flex flex-col gap-7">
            <img src="<%= request.getContextPath() %>/images/computer.png" alt="about-img" class="h-auto w-full max-w-md"/>
        </div>
    </section>

    <section class="bg-blue-100 text-center mx-auto mb-6 lg:mb-0 py-12 lg:py-16 px-5 lg:px-24 pb-28">
        <h1 class="text-3xl font-normal text-green-600 mb-16">About Us</h1>
        <p class="text-xl flex justify-center items-center mt-7 mb-8 text-blue-600">
            Welcome to KidVax, your trusted partner in managing your child's vaccination journey. I'm Maroua Boumchich, the developer behind this platform. I created this website to provide a user-friendly solution for parents like you to streamline the vaccination process and ensure your child's health and well-being. At KidVax, we prioritize safety, accuracy, and convenience. Our mission is to empower parents with the knowledge and tools they need to make informed decisions about their child's health.
        </p>
    </section>

    <section class="grid xl:mx-28 my-auto px-4 justify-center gap-y-20 sm:py-12 lg:px-8 pb-32 lg:py-16">
        <h1 class="text-center text-3xl font-normal text-green-600 mb-18">Our Objectives</h1>
      
        <div class="flex items-center justify-center">
            <div class="border-2 border-gray-400 py-7 px-7 flex-1 flex flex-col gap-6 w-2/3">
                <h2 class="text-3xl font-normal text-blue-600">Promote Vaccination Awareness</h2>
                <p class="lg:text-xl text-lg text-gray-600">Increase awareness about the importance of childhood immunization among parents.</p>
            </div>
            <div class="flex flex-col items-center justify-center w-1/3">
                <img src="<%= request.getContextPath() %>/images/Vaccine.jpg" alt="about-obj1-img" class="h-auto w-full max-w-xs"/>
            </div>
        </div>

        <div class="flex items-center justify-center flex-row-reverse">
            <div class="border-2 border-gray-400 py-7 px-7 flex-1 flex flex-col gap-6 w-2/3">
                <h2 class="text-3xl font-normal text-blue-600">Streamline Appointment Scheduling</h2>
                <p class="lg:text-xl text-lg text-gray-600">Provide a platform for scheduling vaccination appointments, making it convenient for parents to keep track of the vaccination process.</p>
            </div>
            <div class="flex flex-col items-center justify-center w-1/3">
                <img src="<%= request.getContextPath() %>/images/picnic.jpg" alt="about-obj2-img" class="h-auto w-full max-w-xs"/>
            </div>
        </div>

        <div class="flex items-center justify-center">
            <div class="border-2 border-gray-400 py-7 px-7 flex-1 flex flex-col gap-6 w-2/3">
                <h2 class="text-3xl font-normal text-blue-600">Education and Information</h2>
                <p class="lg:text-xl text-lg text-gray-600">Offer reliable information about different vaccines, their benefits, and potential side effects, empowering parents to make informed decisions.</p>
            </div>
            <div class="flex flex-col items-center justify-center w-1/3">
                <img src="<%= request.getContextPath() %>/images/family-smile.jpg" alt="about-obj3-img" class="h-auto w-full max-w-xs"/>
            </div>
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
