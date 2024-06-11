    document.addEventListener('DOMContentLoaded', function() {
    const sections = document.querySelectorAll('.hidden-section');
    
    const handleScroll = () => {
        const triggerBottom = window.innerHeight / 5 * 4;
        sections.forEach(section => {
            const sectionTop = section.getBoundingClientRect().top;
            if (sectionTop < triggerBottom) {
                section.classList.add('show-section');
            } else {
                section.classList.remove('show-section');
            }
        });
    };

    window.addEventListener('scroll', handleScroll);
    handleScroll();
});

