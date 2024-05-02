document.addEventListener("DOMContentLoaded", function() {
    const menuIcon = document.getElementById("menu-icon");
    const mobileMenu = document.getElementById("mobile-menu");

    function toggleMenu() {
        mobileMenu.classList.toggle("active");
    }

    menuIcon.addEventListener("click", function() {
        toggleMenu();
    });

    document.addEventListener("click", function(event) {
        if (!mobileMenu.contains(event.target) && !menuIcon.contains(event.target)) {
            mobileMenu.classList.remove("active");
        }
    });
});


