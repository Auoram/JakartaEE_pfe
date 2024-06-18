<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    <meta charset="UTF-8">
    <title>Vaccination information</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <link rel="stylesheet" href="dashboardStyle.css">
    </head>
    <body class="bg-white">
        <header class="header flex justify-between items-center bg-blue-400 p-6 relative">
        <div class="logo">
            <img src="images/whiteLogo.png" alt="Logo">
        </div>
        <div class="menu">
            <img src="images/menu-white.svg" alt="Menu" onclick="toggleMenu()">
            <div id="menuLinks" class="menu-links bg-blue-400 bg-opacity-90 pt-12">
                <a href="dashboard.jsp" class="mb-6 text-3xl">Dashboard</a>
                <a href="childProfile.jsp" class="mb-6 text-3xl">Child Profile</a>
                <a href="VaxInfo.jsp" class="mb-6 text-3xl">Vaccination Information</a>
                <a href="addAnotherChild.jsp" class="mb-6 text-3xl">Add Child</a>
                <a href="appointmentPage.jsp" class="mb-6 text-3xl">Appointment Management</a>
                <a href="settings.jsp" class="mb-7 text-xl">Settings</a>
                <a href="logOut.jsp" class="mb-4 text-xl logout">Log Out</a>
            </div>
        </div>
        </header>
            
    <section class="bg-blue-100 padding-container flex items-center pl-10 lg:pl-16 gap-25 py-16 pb-28 md:gap-18 lg:py-28">
        <div class="relative z-20 flex flex-1 flex-col gap-8 xl:-1/2">
            <h1 class="font-bold text-4xl text-blue-600 lg:text-6xl">More information about children's vaccination</h1>
        </div>
        <div class="relative flex flex-1 flex-col gap-7">
            <img src="images/child-visiting-the-pediatrician.png" alt="hero-img" height="592" width="457" />
        </div>
    </section>

    <section class="padding-container py-7 px-2 lg:px-8">
        <div class="border border-gray-300 shadow-lg mb-6 p-4 rounded-md">
            <div class="flex justify-between items-center">
                <h3 class="text-xl text-blue-600">Should my child get shots if she is sick?</h3>
                <div onclick="toggleDescription(0)" class="hover:cursor-pointer">
                    <img src="images/close.svg" alt="plus" height="40" width="39" />
                </div>
            </div>
            <div id="description-0" class="mt-4 hidden">
                <p class="text-gray-600 text-lg">In general, it's advisable to postpone vaccinations if your child is currently sick, especially if they have a fever. Vaccinating a sick child could potentially worsen their illness or mask symptoms of serious adverse reactions. It's best to wait until your child has fully recovered before proceeding with vaccinations. However, if the illness is mild and not accompanied by a fever, your healthcare provider may recommend going ahead with vaccinations. Always consult with your child's healthcare provider for personalized advice based on their specific health condition.</p>
            </div>
        </div>
        <div class="border border-gray-300 shadow-lg mb-6 p-4 rounded-md">
            <div class="flex justify-between items-center">
                <h3 class="text-xl text-blue-600">Are there any medical conditions that would make vaccination unsafe for my child?</h3>
                <div onclick="toggleDescription(1)" class="hover:cursor-pointer">
                    <img src="images/close.svg" alt="plus" height="40" width="39" />
                </div>
            </div>
            <div id="description-1" class="mt-4 hidden">
                <p class="text-gray-600 text-lg">Yes, there are certain medical conditions in which vaccination should be avoided or postponed. These include severe allergic reactions to vaccine components, immunodeficiency disorders, and certain treatments that suppress the immune system. Additionally, if a child has experienced a severe reaction to a previous vaccine dose, further vaccination with the same vaccine may be contraindicated. It's important to discuss your child's medical history with their healthcare provider to determine if any contraindications to vaccination exist.</p>
            </div>
        </div>
        <div class="border border-gray-300 shadow-lg mb-6 p-4 rounded-md">
            <div class="flex justify-between items-center">
                <h3 class="text-xl text-blue-600">How can I manage common side effects of vaccination at home?</h3>
                <div onclick="toggleDescription(2)" class="hover:cursor-pointer">
                    <img src="images/close.svg" alt="plus" height="40" width="39" />
                </div>
            </div>
            <div id="description-2" class="mt-4 hidden">
                <p class="text-gray-600 text-lg">Most side effects of vaccination are mild and temporary, such as soreness at the injection site, low-grade fever, or mild fussiness. These can often be managed at home with simple remedies like rest, cool compresses, and over-the-counter pain relievers if recommended by your healthcare provider. It's important to monitor for signs of more serious reactions, such as high fever, persistent crying, or signs of allergic reaction, and seek medical attention if necessary.</p>
            </div>
        </div>
        <div class="border border-gray-300 shadow-lg mb-6 p-4 rounded-md">
            <div class="flex justify-between items-center">
                <h3 class="text-xl text-blue-600">Are there any alternative vaccine schedules I can follow for my child?</h3>
                <div onclick="toggleDescription(3)" class="hover:cursor-pointer">
                    <img src="images/close.svg" alt="plus" height="40" width="39" />
                </div>
            </div>
            <div id="description-3" class="mt-4 hidden">
                <p class="text-gray-600 text-lg">While some parents may seek alternative vaccine schedules, it's essential to understand that deviating from the recommended vaccination schedule can leave children susceptible to vaccine-preventable diseases for longer periods. The recommended vaccine schedule is carefully designed to provide the best protection at the earliest age possible. Altering this schedule may increase the risk of disease outbreaks and complications. It's crucial to discuss any concerns or preferences regarding vaccination schedules with your child's healthcare provider.</p>
            </div>
        </div>
        <div class="border border-gray-300 shadow-lg mb-6 p-4 rounded-md">
            <div class="flex justify-between items-center">
                <h3 class="text-xl text-blue-600">What should I do if my child misses a scheduled vaccine dose?</h3>
                <div onclick="toggleDescription(4)" class="hover:cursor-pointer">
                    <img src="images/close.svg" alt="plus" height="40" width="39" />
                </div>
            </div>
            <div id="description-4" class="mt-4 hidden">
                <p class="text-gray-600 text-lg">If your child misses a scheduled vaccine dose, it's important to catch up as soon as possible to maintain protection against vaccine-preventable diseases. Depending on the vaccine and your child's age, your healthcare provider may recommend a catch-up schedule to ensure they receive all necessary doses. It's essential to communicate with your child's healthcare provider and follow their guidance to ensure your child remains up-to-date with their vaccinations.</p>
            </div>
        </div>
    </section>

    <section>
        <div class="flex flex-col items-center gap-2 ml-2 mt-2 p-4">
            <h1 class="text-blue-600 text-4xl text-center mb-8">Other types of vaccine information</h1>
            <div class="grid lg:grid-cols-3 grid-cols-1 text-center mb-6 gap-x-20 lg:px-32">
                <div class="flex flex-col items-center gap-8 ml-2 mt-2 border border-gray-400 shadow-md p-4">
                    <img src="images/img1.jpg" alt="profile-img" height="250" width="350" />
                    <h1 class="text-blue-600 text-2xl">Vaccines are Safe and Effective</h1>
                    <p class="text-gray-600 text-lg">Research and testing confirm vaccines's safety and efficacy in preventing childhood diseases. Thorough testing before approval and ongoing monitoring ensure their safety and effectiveness.</p>
                </div>
                <div class="flex flex-col items-center gap-8 ml-2 mt-2 border border-gray-400 shadow-md p-4">
                    <img src="images/cost2.jpg" alt="profile-img" height="250" width="350" />
                    <h1 class="text-blue-600 text-2xl">Immunization Protects Against Serious Diseases</h1>
                    <p class="text-gray-600 text-lg">Vaccines trigger the immune system to create antibodies, offering lasting protection against particular pathogens. Following the recommended vaccination schedule safeguards children's health and community well-being.</p>
                </div>
                <div class="flex flex-col items-center gap-8 ml-2 mt-2 border border-gray-400 shadow-md p-4">
                    <img src="images/Immunization.webp" alt="profile-img" height="250" width="350" />
                    <h1 class="text-blue-600 text-2xl">Vaccination Schedules Are Optimized</h1>
                    <p class="text-gray-600 text-lg">Vaccination schedules are meticulously planned to offer optimal disease protection early in life, guided by thorough research and immune system responsiveness.</p>
                </div>
            </div>
        </div>
    </section>

    <section class="bg-blue-100 py-5">
        <h1 class="text-blue-600 text-4xl text-center mb-10">Additional Resources</h1>
        <div class="pl-6 grid gap-6 my-7">
            <div class="flex items-center">
                <h2 class="text-blue-600 text-xl">"Vaccines and Your Child: Separating Fact from Fiction"</h2>
                <h3 class="text-blue-600 text-lg ml-2">Paul A. Offit and Charlotte A. Moser</h3>
            </div>
            <div class="flex items-center">
                <h2 class="text-blue-600 text-xl">"The Vaccine Book: Making the Right Decision for Your Child"</h2>
                <h3 class="text-blue-600 text-lg ml-2">Robert W. Sears</h3>
            </div>
            <div class="flex items-center">
                <h2 class="text-blue-600 text-xl">"Do Vaccines Cause That?! A Guide for Evaluating Vaccine Safety Concerns"</h2>
                <h3 class="text-blue-600 text-lg ml-2">Martin G. Myers and Diego Pineda</h3>
            </div>
            <div class="flex items-center">
                <h2 class="text-blue-600 text-xl">"Vaccination: A Guide for Making Personal Choices"</h2>
                <h3 class="text-blue-600 text-lg ml-2">Richard Moskowitz</h3>
            </div>
            <div class="flex items-center">
                <h2 class="text-blue-600 text-xl">"Vaccines: How Do They Work?"</h2>
                <h3 class="text-blue-600 text-lg ml-2">Video by AsapSCIENCE</h3>
            </div>
        </div>
    </section>
    <script>
        const descriptionVisibility = {};

        function toggleDescription(index) {
            descriptionVisibility[index] = !descriptionVisibility[index];
            document.getElementById('description-' + index).classList.toggle('hidden');
        }
    </script>
    <script src="handleDashboard.js"></script>
    </body>
</html>
