
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
      
        <div>
    <section class="h-[500px] relative grid gap-10 text-center mx-auto my-auto px-20 py-10 pb-32 lg:py-12">
        <h1 class="text-4xl lg:text-5xl font-bold text-blue-600">Connect to <span class="text-blue-800">KidVax</span><br/>in 3 steps</h1>
        <p class="text-lg text-gray-600">Our website is here to help you manage your children's<br/> vaccination schedule</p>
    </section>

    <div class="bg-green-100 bg-opacity-25 xl:mx-28 my-auto px-4 justify-center gap-y-20 py-12 lg:px-8 pb-32 lg:py-16">
        <section id="section1" class="flex max-container padding-container items-center gap-10 m-10 hidden-section">
            <div class="relative z-20 flex flex-1 flex-col gap-7">
                <img src="images/baby_1.jpg" alt="image-1" class="w-[400px] h-auto">
            </div>
            <div class="relative flex flex-1 flex-col gap-7 sm:ml-20">
                <h1 class="text-2xl lg:text-4xl text-green-700">Set up your account<br/> in minutes</h1>
                <p class="text-lg lg:text-xl text-gray-600">Begin by providing basic information about yourself and your child. KidVax guides you through the process step by step, making it easy to create an account for your family's needs.</p>
                <a href="signup.jsp" class="bg-green-600 text-center font-bold rounded-full border-green-600 shadow-lg shadow-green-300 w-44 px-8 py-4 text-white transition-all hover:bg-green-100 hover:bg-opacity-35 hover:text-green-600">Sign Up</a>
            </div>
        </section>

        <section id="section2" class="flex max-container padding-container items-center gap-10 m-10 hidden-section">
            <div class="relative z-20 flex flex-1 flex-col gap-7">
                <img src="images/baby_2.jpg" alt="image-2" class="w-[400px] h-auto">
            </div>
            <div class="relative flex flex-1 flex-col gap-7 sm:ml-20">
                <h1 class="text-2xl lg:text-4xl text-green-700">Choose Your Child's <br/> Vaccination Schedule</h1>
                <p class="text-lg lg:text-xl text-gray-600">Once you finish the first two steps, you'll have the flexibility to select and customize your child's vaccination schedule.</p>
                <a href="login.jsp" class="bg-green-600 text-center font-bold rounded-full border-green-600 shadow-lg shadow-green-300 w-44 px-8 py-4 text-white transition-all hover:bg-green-100 hover:bg-opacity-35 hover:text-green-600">Log In</a>
            </div>
        </section>

        <section id="section3" class="flex max-container padding-container items-center gap-10 m-10 hidden-section">
            <div class="relative z-20 flex flex-1 flex-col gap-7">
                <img src="images/Baby_3.jpg" alt="image-3" class="w-[400px] h-auto">
            </div>
            <div class="relative flex flex-1 flex-col gap-7 sm:ml-20">
                <h1 class="text-2xl lg:text-4xl text-green-700">Access Personalized <br/> Reminders and Resources</h1>
                <p class="text-lg lg:text-xl text-gray-600">Stay on top of your child's immunization schedule with personalized reminders. Additionally, unlock a wealth of educational resources.</p>
                <a href="login.jsp" class="bg-green-600 text-center font-bold rounded-full border-green-600 shadow-lg shadow-green-300 w-44 px-8 py-4 text-white transition-all hover:bg-green-100 hover:bg-opacity-35 hover:text-green-600">Log In</a>
            </div>
        </section>
    </div>
</div>
        
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
                    <li>Phone: <a href="tel:+212 0654789635" class="hover:underline">+212 0654789635</a></li>
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
        <script src="scrollHandler.js">
        </script>
        <script src="handleMenu.js">
    </script>
    </body>
</html>
