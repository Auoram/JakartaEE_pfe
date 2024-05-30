<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>KidVax - Children's Vaccination Management</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <link rel="stylesheet" href="mainStyle.css">
</head>
<body class="bg-white">
    <header class="flex items-center justify-between p-4 bg-blue-600 text-white">
        <div class="logo">
            <a href="index.jsp"><img src="images/whiteLogo.png" alt="Logo" class="h-10"></a>
        </div>
        <nav class="hidden md:flex space-x-6">
            <ul class="flex space-x-10">
                <li><a href="index.html">Home</a></li>
                <li><a href="#">About</a></li>
                <li><a href="#">Contact</a></li>
            </ul>
        </nav>
        <div class="hidden md:flex space-x-4">
            <a href="signup.jsp" class="bg-blue-700 px-4 py-2 rounded hover:bg-blue-500">Sign Up</a>
            <a href="login.jsp" class="bg-blue-700 px-4 py-2 rounded hover:bg-blue-500">Login</a>
        </div>
        <div class="md:hidden">
            <img src="images/menu-white.svg" alt="Menu" id="menu-icon" class="h-6 cursor-pointer">
        </div>
    </header>

    <div id="mobile-menu" class="hidden bg-blue-600 text-white p-4">
        <ul class="space-y-4">
            <li><a href="index.html" class="hover:underline">Home</a></li>
            <li><a href="#" class="hover:underline">About</a></li>
            <li><a href="#" class="hover:underline">Contact</a></li>
        </ul>
        <div class="mt-4 space-y-4">
            <a href="signup.jsp" class="block bg-blue-700 px-4 py-2 rounded text-center hover:bg-blue-500">Sign Up</a>
            <a href="login.jsp" class="block bg-blue-700 px-4 py-2 rounded text-center hover:bg-blue-500">Login</a>
        </div>
    </div>

    <main class="mx-5">
        <section class="relative bg-cover bg-center py-32 rounded-2xl mt-6" style="background-image: url('images/Backgroud1.jpg');">
            <div class="absolute inset-0 bg-black bg-opacity-50 rounded-2xl"></div>
            <div class="container mx-auto relative z-10 flex flex-col items-center text-center text-white px-4">
                <h1 class="text-4xl lg:text-6xl font-bold mb-4">Build Your Child's Immunity System</h1>
                <p class="text-lg mb-8">Your trusted vaccination companion, KidVax is here to help you manage your child's vaccination effortlessly.</p>
                <a href="test.html" class="bg-blue-700 px-4 py-2 rounded hover:bg-blue-500">How it works &gt;</a>
            </div>
        </section>

        <div class="info-section py-16">
            <h2 class="text-3xl font-bold text-center mb-12">Why <span class="text-blue-700">Vaccinate</span> our Children?</h2>
            <div class="container mx-auto grid grid-cols-1 lg:grid-cols-3 md:grid-cols-3 gap-8">
                <div class="info-card bg-white p-6 rounded-lg shadow-lg text-center">
                    <img src="images/Baby_3.jpg" alt="Disease Prevention" class="w-full h-40 object-cover rounded-t-lg mb-4">
                    <h3 class="text-2xl font-bold mb-2">Disease Prevention</h3>
                    <p>Vaccinations offer powerful protection against a range of diseases, ensuring our little ones can thrive and grow without the threat of preventable infections.</p>
                </div>
                <div class="info-card bg-white p-6 rounded-lg shadow-lg text-center">
                    <img src="images/cost3.jpg" alt="Reduced Healthcare Costs" class="w-full h-40 object-cover rounded-t-lg mb-4">
                    <h3 class="text-2xl font-bold mb-2">Reduced Healthcare Costs</h3>
                    <p>Vaccinations offer a cost-effective solution, helping to prevent illness and reduce the financial burden associated with treating preventable diseases.</p>
                </div>
                <div class="info-card bg-white p-6 rounded-lg shadow-lg text-center">
                    <img src="images/Kid_school.jpg" alt="School Attendance" class="w-full h-40 object-cover rounded-t-lg mb-4">
                    <h3 class="text-2xl font-bold mb-2">School Attendance</h3>
                    <p>Most schools mandate proof of immunization as part of the enrollment process to create a safe and healthy learning environment for all students.</p>
                </div>
            </div>
        </div>
        <div class="vaxSchedule-section bg-blue-50 text-center mx-auto my-auto px-4 sm:py-12 lg:px-8 pb-32 lg:py-16 rounded-lg shadow-md">
            <h1 class="text-3xl lg:text-4xl font-bold text-blue-600 mb-8">Vaccination Schedule</h1>
            <div class="flex justify-center items-center mt-7">
                <img src="images/vaccine-schedule.png" alt="schedule" class="rounded-lg shadow-lg" style="max-width: 100%; height: 500px;">
            </div>
        </div> 
        <section class="quote-section my-8 mx-4 lg:mx-8 bg-white border border-gray-200 shadow-lg rounded-md p-8">
            <h2 class="text-3xl font-bold text-gray-800 mb-8 text-center">Quote</h2>
            <div class="flex flex-row items-center lg:gap-x-20 lg:mx-28">
                <div class="hidden quote-image mb-8 lg:mb-0 md:flex">
                    <img src="images/child-visiting-the-pediatrician.png" alt="Quote Image" class="lg:w-full lg:h-auto sm:w-4/5 sm:w-4/5 max-w-xl lg:">
                </div>
                <div class="quote-text lg:ml-8 text-center lg:text-left">
                    <p class="text-lg font-semibold text-gray-700">"Vaccines are the most cost-effective health care interventions there are. A dollar spent on a childhood vaccination not only helps save a life, but greatly reduces spending on future healthcare."</p>
                    <p class="text-sm mt-4 text-gray-500">Ezekiel Emanuel</p>
                </div>
            </div>
        </section>

    </main>

    <footer class="bg-blue-600 text-white text-center py-4">
        <p>&copy; 2024 KidVax | Privacy Statement</p>
    </footer>

    <script src="handleMenu.js"></script>
</body>
</html>
