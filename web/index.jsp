<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="Children_Vax.Connection_Db" %>
<%@ page import="java.sql.ResultSet" %>
<!DOCTYPE html>
<html lang="fr">
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

    <main class="mx-5">
        <section class="relative bg-cover bg-center py-32 rounded-2xl mt-6" style="background-image: url('images/bg-virus.jpg');">
            <div class="absolute inset-0 bg-black bg-opacity-10 rounded-2xl"></div>
            <div class="container mx-auto relative z-10 flex flex-col items-center text-center text-white px-4">
                <h1 class="text-4xl lg:text-6xl font-bold mb-4">Build Your Child's Immunity System</h1>
                <p class="text-xl mb-8">Your trusted vaccination companion, KidVax is here to help you manage your child's vaccination effortlessly.</p>
                <a href="howItWork.jsp" class="bg-blue-700 px-4 py-2 rounded hover:bg-blue-500">How it works &gt;</a>
            </div>
        </section>

        <div class="info-section py-16">
            <h2 class="text-3xl text-blue-950 font-bold text-center mb-12">Why <span class="text-blue-700">Vaccinate</span> our Children?</h2>
            <div class="container mx-auto grid grid-cols-1 lg:grid-cols-3 md:grid-cols-3 gap-8">
                <div class="info-card bg-white p-6 rounded-lg shadow-lg text-center">
                    <img src="images/Baby_3.jpg" alt="Disease Prevention" class="w-full h-40 object-cover rounded-t-lg mb-4">
                    <h3 class="text-2xl text-blue-800 font-bold mb-2">Disease Prevention</h3>
                    <p>Vaccinations offer powerful protection against a range of diseases, ensuring our little ones can thrive and grow without the threat of preventable infections.</p>
                </div>
                <div class="info-card bg-white p-6 rounded-lg shadow-lg text-center">
                    <img src="images/cost3.jpg" alt="Reduced Healthcare Costs" class="w-full h-40 object-cover rounded-t-lg mb-4">
                    <h3 class="text-2xl text-blue-800 font-bold mb-2">Reduced Healthcare Costs</h3>
                    <p>Vaccinations offer a cost-effective solution, helping to prevent illness and reduce the financial burden associated with treating preventable diseases.</p>
                </div>
                <div class="info-card bg-white p-6 rounded-lg shadow-lg text-center">
                    <img src="images/Kid_school.jpg" alt="School Attendance" class="w-full h-40 object-cover rounded-t-lg mb-4">
                    <h3 class="text-2xl text-blue-800 font-bold mb-2">School Attendance</h3>
                    <p>Most schools mandate proof of immunization as part of the enrollment process to create a safe and healthy learning environment for all students.</p>
                </div>
            </div>
        </div>
        <div class="vaxSchedule-section bg-blue-200 bg-opacity-20 text-center mx-auto my-auto px-4 sm:py-12 lg:px-8 pb-32 lg:py-16 rounded-lg shadow-md">
            <h1 class="text-3xl lg:text-4xl font-bold text-blue-600 mb-8">Vaccination Schedule</h1>
            <div class="table-container">
            <table class="schedule-table mx-auto">
            <thead>
                <tr>
                    <th>Vaccines</th>
                    <th>1st Month</th>
                    <th>2nd Month</th>
                    <th>3rd Month</th>
                    <th>4th Month</th>
                    <th>9th Month</th>
                    <th>12th Month</th>
                    <th>18th Month</th>
                </tr>
            </thead>
            <tbody>
                <%
                try {
                    Connection_Db.Connect();
                    Connection conn = Connection_Db.conn;
                    PreparedStatement stmt;
                    ResultSet rs;
                    String query = "SELECT nomV, ageRecommande, doseV FROM `vax`.`Vaccin`";
                    stmt = conn.prepareStatement(query);
                    rs = stmt.executeQuery();
                    while (rs.next()) {
                        String nomV = rs.getString("nomV");
                        int ageRecommande = rs.getInt("ageRecommande");
                        String doseV = rs.getString("doseV");
                        out.println("<tr>");
                            out.println("<td>" + nomV + "</td>");
                        int[] months = {1, 2, 3, 4, 9, 12, 18};

                        for (int month : months) {
                            if (month == ageRecommande) {
                                out.println("<td class='dose-cell'>" + doseV + "</td>");
                            } else {
                                out.println("<td></td>");
                            }
                        }

                        out.println("</tr>");
                    }

                    rs.close();
                    stmt.close();
                    conn.close();
                } catch (Exception e) {
                    e.printStackTrace();
                    out.println("<tr><td colspan='3'>Error fetching data</td></tr>");
                }
            %>
        </tbody>
        </table>
        </div>
        </div> 
        <section class="quote-section my-8 mx-4 lg:mx-8 bg-white border border-gray-200 shadow-lg rounded-md p-8">
            <h2 class="text-3xl font-bold text-blue-800 mb-8 text-center">Quote</h2>
            <div class="flex flex-row items-center lg:gap-x-20 lg:mx-28">
                <div class="hidden quote-image mb-8 lg:mb-0 md:flex">
                    <img src="images/Playing.jpg" alt="Quote Image" class="lg:w-full lg:h-auto sm:w-4/5 sm:w-4/5 max-w-xl lg:">
                </div>
                <div class="quote-text lg:ml-8 text-center lg:text-left">
                    <p class="text-lg font-semibold text-gray-700">"Vaccines are the most cost-effective health care interventions there are. A dollar spent on a childhood vaccination not only helps save a life, but greatly reduces spending on future healthcare."</p>
                    <p class="text-sm mt-4 text-gray-500">Ezekiel Emanuel</p>
                </div>
            </div>
        </section>

    </main>

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
