document.addEventListener("DOMContentLoaded", function() {
    const menuIcon = document.getElementById("menu-icon");
    const mobileMenu = document.getElementById("mobile-menu");

    // Function to toggle mobile menu
    function toggleMenu() {
        mobileMenu.classList.toggle("active");
    }

    // Event listener for menu icon click
    menuIcon.addEventListener("click", function() {
        toggleMenu();
    });

    // Event listener to close menu when clicking outside of it
    document.addEventListener("click", function(event) {
        if (!mobileMenu.contains(event.target) && !menuIcon.contains(event.target)) {
            mobileMenu.classList.remove("active");
        }
    });
});


