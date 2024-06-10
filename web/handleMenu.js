    document.addEventListener("DOMContentLoaded", function() {
    const menuIcon = document.getElementById("menu-icon");
    const mobileMenu = document.getElementById("mobile-menu");

    menuIcon.addEventListener("click", function() {
        mobileMenu.classList.toggle("active");
    });

    document.addEventListener("click", function(event) {
        if (!mobileMenu.contains(event.target) && !menuIcon.contains(event.target)) {
            mobileMenu.classList.remove("active");
        }
    });
});
