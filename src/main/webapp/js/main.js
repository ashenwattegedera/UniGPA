document.addEventListener('DOMContentLoaded', () => {
    console.log('UniGPA Loaded');

    // Theme handling
    const toggleBtn = document.getElementById('theme-toggle');
    const root = document.documentElement;

    // Check local storage or system preference
    const savedTheme = localStorage.getItem('theme');
    const systemPrefersDark = window.matchMedia('(prefers-color-scheme: dark)').matches;

    // Apply theme immediately on load
    if (savedTheme === 'dark' || (!savedTheme && systemPrefersDark)) {
        root.classList.add('dark');
    }

    if (toggleBtn) {
        toggleBtn.addEventListener('click', () => {
            root.classList.toggle('dark');
            const isDark = root.classList.contains('dark');
            localStorage.setItem('theme', isDark ? 'dark' : 'light');
            updateIcon(isDark);
        });
    }

    function updateIcon(isDark) {
        if (!toggleBtn) return;
        // Simple text icon for now, or use FontAwesome if available
        // Sun: ☀️, Moon: 🌙
        toggleBtn.innerHTML = isDark ? '<i class="fas fa-sun"></i>' : '<i class="fas fa-moon"></i>';
        // Fallback if FontAwesome isn't loaded (though it is in index.jsp)
        if (!window.getComputedStyle(toggleBtn).fontFamily.includes('Font Awesome')) {
            toggleBtn.textContent = isDark ? '☀️' : '🌙';
        }
    }
});
